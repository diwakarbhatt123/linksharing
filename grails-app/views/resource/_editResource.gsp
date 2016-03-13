<div class="modal fade" id="editResource" role="dialog" aria-hidden="true">
    <div class="modal-dialog">

    <!-- Modal content-->
        <g:form controller="resource" action="update" class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Description</h4>
                </div>

                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-xs-4">Description</label>

                            <div class="col-xs-8">
                                <g:textArea name="description" value="${description}" class="form-control" rows="5" cols="40"/>
                               <g:hiddenField name="id" value="${id}"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <g:submitButton name="saveDescription" value="Save" class="btn btn-success"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </g:form>
    </div>
</div>