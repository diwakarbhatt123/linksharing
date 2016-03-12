<div class="panel panel-default">
    <div class="panel-heading"><strong>Change Password</strong></div>

    <div class="panel-body">
        <div class="alert alert-success" hidden="hidden" id="responseMessagePassword">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.</span>
        </div>
        <g:form class="form-horizontal">
            <div class="form-group">
                <label class="col-xs-4">Password</label>

                <div class="col-xs-8">
                    <input type="password" class="form-control" id="password">
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Confirm Password</label>

                <div class="col-xs-8">
                    <input type="password" class="form-control" id="confirmPassword">
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