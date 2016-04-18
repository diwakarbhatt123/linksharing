<div class="box box-warning">
    <div class="box-header with-border">
        <div class="row">
            <div class="col-xs-4">
                <strong class="box-title">Posts: "${topicName}"</strong></div>

            <div class="col-xs-4 pull-right">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="srch-term" id="postSearch">

                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
    </div>

    <div class="box-body" id="postsSection">
            <g:render template="resourcepanelbody" model="[resources: resources]"/>
    </div>
</div>
<script>
    $("#resource-scrollable").slimScroll({
        height : '434px'
    });
</script>
