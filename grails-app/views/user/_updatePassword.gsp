<div class="panel panel-default">
    <div class="panel-heading"><strong>Change Password</strong></div>

    <div class="panel-body">
        <div class="alert alert-success" hidden="hidden" id="responseMessagePassword">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.</span>
        </div>
        <g:form class="form-horizontal" elementId="updatePasswordForm">
            <div class="form-group">
                <label class="col-xs-4">Password</label>

                <div class="col-xs-8">
                    <input name="password" type="password" class="form-control" id="password">
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Confirm Password</label>

                <div class="col-xs-8">
                    <input name="confirmPassword" type="password" class="form-control" id="confirmPassword">
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-10">
                    <button type="button" class="btn btn-primary" onclick="changePassword()">Update</button>
                </div>
            </div>
        </g:form>
    </div>
</div>
<script>
$("#updatePasswordForm").validate({
    rules: {
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
        password: {
            required: "Password is required",
            minlength: "Password should have atleast 5 characters."
        },
        confirmpassword: {
            required: "We know you're lazy but you do need to confirm your password",
            minlength: "Password should have atleast 5 characters.",
            equalTo: "Password do not match!! That is fishy!!"
        }
    }
});
</script>