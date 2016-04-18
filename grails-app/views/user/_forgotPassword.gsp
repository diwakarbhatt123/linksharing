<!-- Modal -->
<style xmlns="http://www.w3.org/1999/html">
.modal-title{
    color: black;
}
#modalContent{
    color: black;
}
    #modalLabel{
        color: black;
    }
#recoveryemail{
    height: 40px;
}
</style>
<div id="forgotPassword" class="modal fade" role="dialog">
    <div class="modal-dialog">

    <!-- Modal content-->
        <g:form controller="user" action="forgotPassword" class="form-horizontal" name="forgotpasswordform">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Forgot Password</h4>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row" style="padding-bottom:10px;">
                            <p id="modalContent" class="col-xs-12">Enter your Email Address Below. We'll Send you your password in </br> specified mail.</p>
                        </div>

                        <div class="row" style="padding-bottom:10px;">
                            <div class="form-group">
                                <label id="modalLabel" class="col-xs-1">Email:</label>

                                <div class="col-xs-4">
                                    <g:field name="recoveryemail" type="email" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <g:submitButton name="sendRecoveryEmail" value="Send" class="btn btn-info"/>
                </div>
            </div>
        </g:form>
    </div>
</div>