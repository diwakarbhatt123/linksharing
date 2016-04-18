<style>
section#signup {
    background-color: #3c4dbc;
}
#regPanel{
 width: 550px;
    margin-left: 370px;
}
#signupid{
    color: #ccc;
    text-align: center;
    font-size: 80px;
}
</style>
<div class="panel panel-default" id="regPanel">
    <div class="panel-body">
        <h1 id="signupid">
            Sign Up
        </h1>
        <g:uploadForm name="regForm" controller="login" action="register">
        <div class="form-group">
            <g:textField name="firstname" placeholder="First Name" class="form-control"/>
            <i class="fa fa-male"></i>
        </div>
        <div class="form-group">
            <g:textField name="lastname" placeholder="Last Name" class="form-control"/>
            <i class="fa fa-male"></i>
        </div>
        <div class="form-group">
            <g:field type="email" name="email" class="form-control" placeholder="E-Mail"/>
            <i class="fa fa-at"></i>
        </div>
        <div class="form-group">
            <g:textField name="username" placeholder="UserName" class="form-control"/>
            <i class="fa fa-user"></i>
        </div>
        <div class="form-group log-status">
            <g:passwordField name="password" placeholder="Password" class="form-control"/>
            <i class="fa fa-lock"></i>
        </div>
        <div class="form-group log-status">
            <g:passwordField name="confirmPassword" placeholder="Confirm Password" class="form-control"/>
            <i class="fa fa-lock"></i>
        </div>
        <div class="form-group log-status">
            <g:field type="file" accept=".jpg,.jpeg,.png" name="regPhoto" class="form-control"/>
            <i class="fa fa-file-picture-o"></i>
        </div>
            <g:submitButton name="regSubmit" value="Sign Up" class="log-btn"/>
        </g:uploadForm>
    </div>
</div>
<script>
    $("#regForm").validate({
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
                maxlength: 5
            },
            confirmPassword: {
                required: true,
                maxlength: 5,
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
                maxlength: "Too long!!We cannot count more than 5 digits."
            },
            confirmpassword: {
                required: "We know you're lazy but you do need to confirm your password",
                maxlength: "Too long!!We cannot count more than 5 digits.",
                equalTo: "Password do not match!! That is fishy!!"
            }
        }
    });

</script>