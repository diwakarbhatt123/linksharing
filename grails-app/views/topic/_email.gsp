<div class="modal fade" id="sendinvite" role="dialog">
    <div class="modal-dialog">

    <!-- Modal content-->
        <g:form name="sendInvite" controller="topic" action="invite" class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Send Invitation</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-xs-4">Email</label>

                            <div class="col-xs-8">
                                <g:field type="email" name="email" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-4">Topic</label>

                            <div class="col-xs-8">
                                <g:select name="topic" from="${session.user.subscribedTopics}" class="form-control"/>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <g:submitButton name="inviteUser" value="Invite" class="btn btn-info"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </g:form>
    </div>
</div>
<script>
    $("#sendInvite").validate({
        rules: {
            email: {
              required : true,
              email : true
            },
            topic: "required"
        },
        messages:{
            email: {
                required : "Email is Required",
                email : "That doesn't look like a Valid Email"
            },
            topic: "Topic is required"
        }
    });
</script>
