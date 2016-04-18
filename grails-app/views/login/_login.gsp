<style>
.panel-body {
    background: #eee;
}

#signinid {
    color: #ccc;
    text-align: center;
    font-size: 50px;
}

.panel {
    width: 350px;
    margin-left: 470px;
}

.form-group {
    position: relative;
    margin-bottom: 15px;
}

.form-control {

    width: 100%;
    height: 50px;
    border: none;
    padding: 5px 7px 5px 15px;
    background: #fff;
    color: #666;
    border: 2px solid #ddd;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
}

.log-btn {
    background: #3c8dbc;
    dispaly: inline-block;
    width: 100%;
    font-size: 16px;
    height: 50px;
    color: #fff;
    text-decoration: none;
    border: none;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
}

.form-group .fa {
    position: absolute;
    right: 15px;
    top: 17px;
    color: #999;
}

#or {
    color: #ccc;
}

.btn-link-1.btn-link-1-facebook {
    background: #4862a3;
}

.btn-link-1.btn-link-1-twitter {
    background: #55acee;
}

.btn-link-1.btn-link-1-google-plus {
    background: #dd4b39;
}

.btn-link-1 {
    display: inline-block;
    height: 50px;
    margin: 5px;
    padding: 16px 20px 0 20px;
    background: #4aaf51;
    font-size: 16px;
    font-weight: 300;
    line-height: 16px;
    color: #fff;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
}

.btn-link-1:hover, .btn-link-1:focus, .btn-link-1:active {
    outline: 0;
    opacity: 0.6;
    color: #fff;
}
</style>
<link rel="stylesheet prefetch" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<div class="panel panel-default">
    <div class="panel-body">
        <h1 id="signinid">
            Sign In
        </h1>

        <div id="alertLoginPanel" class="alert alert-danger" hidden="hidden">
            <a id="alertLoginClose" class="close" aria-label="close">&times;</a>
            <span id="alertLogin">Success!Indicates a successful or positive action.</span>
        </div>

        <form>
            <div class="form-group inner-addon left-addon">
                <input type="text" class="form-control" placeholder="Username" id="UserName" required>
                <i class="fa fa-user"></i>
            </div>

            <div class="form-group log-status">
                <input type="password" class="form-control" placeholder="Password" id="Passwod" required>
                <i class="fa fa-lock"></i>
            </div>
            <button id="loginButton" type="button" class="log-btn">Log in</button>
            <a id="passwordRecovery" href="#" data-toggle="modal" data-target="#forgotPassword">Forgot Password</a>

            <h3 id="or">...or login with:</h3>

            <div class="social-login-buttons">
                <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                    <i class="fa fa-facebook"></i> Facebook
                </a>
                <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                    <i class="fa fa-twitter"></i> Twitter
                </a>
                <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                    <i class="fa fa-google-plus"></i> Google Plus
                </a>
            </div>
        </form>
        <g:render template="/user/forgotPassword"/>
    </div>
</div>
<script>
    $("#loginButton").click(function () {
        var username = $("#UserName").val();
        var password = $("#Passwod").val();
        $.ajax({
            url: "/login/loginHandler",
            data: {"username": username, "password": password},
            method: "POST",
            success: function (data) {
                if (data.message == "Success") {
                    location.reload();
                }
                else {
                    $("#alertLogin").text(data.message);
                    $("#alertLoginPanel").fadeIn();
                }
            },
            error: function (data) {
                console.log(data);
                $("#alertLogin").text(data.status + "! " + data.statusText);
                $("#alertLoginPanel").fadeIn();
            }
        });
    });
    $("#alertLoginClose").click(function () {
        $("#alertLoginPanel").fadeOut();
    });
</script>