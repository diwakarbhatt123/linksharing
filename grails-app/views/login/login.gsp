<%@ page import="linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="main" name="layout">
    <script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.js"></script>

    <title>LinkSharing</title>
</head>

<body>
<!-- Navigation Bar -->
<!-- ********************************************************* -->

<!-- Row 1 -->
<!-- *************************************************** -->
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <!-- Recent Shares -->
            <!-- ************************************************** -->
            <g:render template="recentshares" model="[recentPosts: recentPosts]"/>
        </div>

        <div class="col-xs-6" id="loginSection">
            <!-- Login Panel -->
            <!-- ************************************************ -->
            <g:render template="login"/>
        </div>
    </div>
    <!-- Row 2 -->
    <div class="row">
        <div class="col-xs-6">
            <!-- Top Posts Panel-->
            <!-- ************************************************************ -->
            <ls:topPosts/>
        </div>

        <div class="col-xs-6">
            <!-- Register Panel -->
            <!-- ************************************************************ -->
            <g:render template="register"/>
        </div>
    </div>
</div>
<script>
    $("#registrationForm").validate({
        rules: {
            firstname: "required",
            lastname: "required",
            email: {
                required: true,
                email: true,
                remote: {
                    type: 'post',
                    url: 'user/uniqueEmail',
                    data: {
                        email: console.log(function(){
                           return $('#registrationForm > #email').val()})
                    }
                }
                },
                username: {
                    required : true,
                    remote: {
                        type: 'post',
                        url: 'user/uniqueUsername',
                        data: {
                            username: console.log(function(){
                                return $('#registrationForm > #username').val()})
                        }
                    }
                },
                password: {
                    required: true,
                    minlength: 5
                },
                confirmPassword: {
                    required: true,
                    minlength: 5,
                    equalTo: "#password"
                }
            },
        messages: {
            firstname: "You do have a first name!! Right??",
            lastname: "We would love to know your last name. Please Fill in!!",
            email: {
                required: "Email-Id is Required",
                email: "That doesn't look like a Valid Email",
                remote : "Not unique!! Are you sure you haven't registered already!!"
            },
            username: {
                required :"we dont accept blank as username how unique it might be",
                remote : "Username already taken find a new one"
            },
            password: {
                required: "Password is required",
                minlength: "Password should have atleast 5 characters"
            },
            confirmpassword: {
                required: "We know you're lazy but you do need to confirm your password",
                minlength: "Password should have atleast 5 characters.",
                equalTo: "Password do not match!! That is fishy!!"
            }
        }
    });

</script>
</body>
</html>