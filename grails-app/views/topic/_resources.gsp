<div class="panel panel-default">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-4">
                <strong>Posts: "${topicName}"</strong></div>

            <div class="col-xs-4 pull-right">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="srch-term" id="postSearch">

                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-body" id="postsSection">
            <g:render template="resourcepanelbody" model="[resources: resources]"/>
    </div>
</div>
