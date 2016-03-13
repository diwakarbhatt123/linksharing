<div class="panel panel-default">
    <div class="panel-heading"><strong>Login</strong></div>

    <div class="panel-body">
        <div class="alert alert-success collapse" hidden="hidden" id="responseMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.</span>
        </div>

        <form class="form-horizontal" name="login form">

            <div class="form-group">
                <label class="col-xs-4">Username</label>

                <div class="col-xs-8">
                    <input name="username" id="loginUsername" type="text" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Password</label>

                <div class="col-xs-8">
                    <input name="password" type="password" id="loginPassword" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-offset-3 col-xs-10">
                    <a href="#" data-toggle="modal" data-target="#forgotPassword">Forgot Password</a>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-10">
                    <input type="button" id="loginButton" class="btn btn-primary" name="login" value="Login"/>
                </div>
            </div>
        </form>
        <g:render template="/user/forgotPassword"/>
    </div>
</div>
<script>
    $("#loginButton").click(function () {
        var username = $("#loginUsername").val();
        var password = $("#loginPassword").val();
        $.ajax({
            url: "/login/loginHandler",
            data: {"username": username, "password": password},
            method: "POST",
            success: function (data) {
                if (data.message == "Success") {
                    location.reload();
                }
                else {
                    loadLoginpanel(function () {
                        $("#responseMessage").attr("class", "alert alert-danger").show();
                        $("#responseMessage > .visibilityText").text(data.message);
                    })
                }
            },
            error: function (data) {
                loadLoginpanel(function () {
                    $("#responseMessage").attr("class", "alert alert-danger").show();
                    $("#responseMessage > .visibilityText").text(data.statusText);
                });
            }
        });
    });
    function loadLoginpanel(callback) {
        $("#loginSection").load("login/loadLoginPanel", function (data) {
            if (callback) {
                callback();
            }
        })
    }
</script>