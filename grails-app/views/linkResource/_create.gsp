
<div class="modal fade" id="sharelink" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <g:form name="linkResourceForm" controller="linkResource" action="save" class="form-horizontal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Link</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-xs-4">Link</label>
                        <div class="col-xs-8">
                            <g:field type="url" name="url" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4">Description</label>
                        <div class="col-xs-8">
                            <g:textArea name="description" class="form-control"/>
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
                <g:submitButton name="saveLinkResource" value="Share" class="btn btn-info"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
        </g:form>
    </div>
</div>
<script>
    $("#linkResourceForm").validate({
        rules: {
            url: {
                required : true,
              url : true
            },
            description: "required",
            topic: "required"
        },
        messages:{
            url: {
              required : "You are Sharing a link and you have not provided a Link!!",
              url : "This is not a valid url"
            },
                description: "Description should be provided",
            topic: "Topic is required"
        }
    });
</script>