<div class="box box-warning">
    <div class="box-header with-border"><strong class="box-title">Update Profile</strong></div>

    <div class="box-body">
        <g:uploadForm name="profileUpdateForm" controller="user" action="updateProfile" class="form-horizontal">
            <div class="form-group">
                <label class="col-xs-4">First Name</label>

                <div class="col-xs-8">
                    <g:textField value="${session.user.firstname}" name="firstname" type="text" class="form-control" id="fname"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Last Name</label>

                <div class="col-xs-8">
                    <g:textField value="${session.user.lastname}" name="lastname" type="text" class="form-control" id="lname"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Username</label>

                <div class="col-xs-8">
                    <g:textField value="${session.user.username}" name="username" type="text" class="form-control" id="username"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Photo</label>

                <div class="col-xs-5">
                <g:field name="photo" type="file" class="form-control" id="photo"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">City</label>

                <div class="col-xs-5">
                    <g:textField value="${session.user.city}" name="city" type="text" class="form-control" id="city"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Country</label>

                <div class="col-xs-5">
                    <g:textField value="${session.user.country}" name="country" type="text" class="form-control" id="country"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Bio</label>

                <div class="col-xs-5">
                    <g:textArea value="${session.user.bio}" name="bio" type="text" class="form-control" id="bio"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-10">
                    <g:submitButton name="updateProfile" value="Update" class="btn btn-primary"/>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>
<script>
    $("#profileUpdateForm").validate({
        rules: {
            firstname: "required",
            lastname: "required",
            username: {
                required : true
            }
        },
        messages: {
            firstname: "You do have a first name!! Right??",
            lastname: "We would love to know your last name. Please Fill in!!",
            username: {
                required :"we dont accept blank as username how unique it might be",
                remote : "Username already taken find a new one"
            }
        }
    });
</script>