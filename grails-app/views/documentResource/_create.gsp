<div class="modal fade" id="sharedDocument" role="dialog" aria-hidden="true">
    <div class="modal-dialog">

    <!-- Modal content-->
        <g:uploadForm name="saveDocumentForm" controller="documentResource" action="save" class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Document</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-xs-4">Document</label>

                            <div class="col-xs-8">
                                <g:field type="file" accept=".doc,.docx,.pdf" name="document" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-4">Description</label>

                            <div class="col-xs-8">
                                <g:textArea name="description" class="form-control" rows="5" cols="40"/>
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
                    <g:submitButton name="saveDocumentResource" value="Share" class="btn btn-info"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </g:uploadForm>
    </div>
</div>
<script>
    $("#saveDocumentForm").validate({
        rules: {
            document:
            {
                required:true,
                //extension :"pdf"
            },
            description: "required",
            topic: "required"
        },
        messages:{
            document: {
               required: "You are uploading a document and you do not have a document!!",
                //extension : "Documents can only be of PDF, DOCX or txt Format!!"
            },
            description: "Description should be provided",
            topic: "Topic is required"
        }
    });
</script>