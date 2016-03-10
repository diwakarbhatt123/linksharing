<div class="panel panel-default">
    <div class="panel-heading"><strong>Login</strong></div>

    <div class="panel-body">
        <g:form class="form-horizontal" controller="login" action="loginHandler" name="login form">

            <div class="form-group">
                <label class="col-xs-4">Email/Username</label>

                <div class="col-xs-8">
                    <g:textField name="username" type="email" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-xs-4">Password</label>

                <div class="col-xs-8">
                    <g:passwordField name="password" type="password" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-offset-3 col-xs-10">
                    <a href="#"data-toggle="modal" data-target="#forgotPassword">Forgot Password</a>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-10">
                    <g:submitButton class="btn btn-primary" name="login" value="Login"/>
                </div>
            </div>
        </g:form>
        <g:render template="/user/forgotPassword"/>
    </div>
</div>