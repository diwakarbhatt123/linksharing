<div class="panel panel-default">
    <div class="panel-heading"><strong>Register</strong></div>

    <div class="panel-body">
        <g:uploadForm name="profileUpdateForm" controller="user" action="updateProfile" class="form-horizontal">
            <div class="form-group">
                <label class="col-xs-4">First Name</label>

                <div class="col-xs-8">
                    <g:textField name="firstname" type="text" class="form-control" id="fname"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Last Name</label>

                <div class="col-xs-8">
                    <g:textField name="lastname" type="text" class="form-control" id="lname"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Username</label>

                <div class="col-xs-8">
                    <g:textField name="username" type="text" class="form-control" id="username"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Photo</label>

                <div class="col-xs-5">
                <g:field name="photo" type="file" class="form-control" id="photo"/>
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