<div class="modal fade" id="sharedocument" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Share Document</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-xs-4">Document</label>
                        <div class="col-xs-5">
                            <input type="text" class="form-control">
                        </div>
                        <div class="col-xs-3">
                            <button type="button" class="btn btn-info">Browse</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4">Description</label>
                        <div class="col-xs-8">
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-4">Topic</label>
                        <div class="col-xs-8">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default">Public</button>
                                <button type="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Public</a></li>
                                    <li><a href="#">Private</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info">Share</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
