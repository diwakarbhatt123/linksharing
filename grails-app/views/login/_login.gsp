<div class="panel panel-default">
    <div class="panel-heading"><strong>Login</strong></div>

    <div class="panel-body">
        <div class="alert alert-success collapse" hidden="hidden" id="responseMessage">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.</span>
        </div>

        <form class="form-horizontal" name="login form" id="loginform">

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
            <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
            </fb:login-button>

            <div id="status">
            </div>
        </form>
        <g:render template="/user/forgotPassword"/>
    </div>
</div>
<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
                    'into Facebook.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '982776161775775',
            cookie     : true,  // enable cookies to allow the server to access
                                // the session
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.5' // use graph api version 2.5
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=982776161775775";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function(response) {
            console.log('Successful login for: ' + response.email);
            document.getElementById('status').innerHTML =
                    'Thanks for logging in, ' + response.name + '!';
        });
    }

    $("#loginButton").click(function () {
        var username = $("#loginUsername").val();
        var password = $("#loginPassword").val();
        $.ajax({
            url: "/j_spring_security_check",
            data: {"j_username": username, "j_password": password},
            method: "POST",
            success: function (data) {
                console.log(data);
                if (data.success == true) {
                    location.reload();
                }
                else {
                    loadLoginpanel(function () {
                        $("#responseMessage").attr("class", "alert alert-danger").show();
                        $("#responseMessage > .visibilityText").text(data.error);
                    })
                }
            },
            error: function (data) {
                console.log("Failure");
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