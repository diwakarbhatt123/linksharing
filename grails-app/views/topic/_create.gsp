<div class="modal fade" id="createtopic" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <g:form controller="topic" action="save" class="form-horizontal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topic</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-xs-4">Name</label>
                        <div class="col-xs-8">
                            <g:textField name="topicName" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4">Visibility</label>
                        <div class="col-xs-8">
                        <g:select name="visibility" from="${["Public","Private"]}" class="form-control"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <g:submitButton name="savetopic" value="Save" class="btn btn-success"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
        </g:form>
    </div>
</div>