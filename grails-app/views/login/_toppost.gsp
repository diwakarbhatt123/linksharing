<div class="panel panel-default">
    <div class="panel-heading clearfix">
        <h5 class="panel-title pull-left"
            style="font-size:15px;padding-top:7.5px;"><strong>Top Posts</strong></h5>

        <div class="btn-group pull-right">
            <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Today<span
                    class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><a href="#">Today</a></li>
                <li><a href="#">1 Week</a></li>
                <li><a href="#">1 Month</a></li>
            </ul>
        </div>
    </div>

    <div class="panel-body">
        <g:each in="${topPosts}" var="resource">
            <div>
                <div class="col-xs-2">
                    <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                </div>

                <div class="col-xs-10">
                    <div class="row">
                        <div class="col-xs-6">
                            <span class="h5">${resource[0].createdBy}</span>
                            <small class="text-muted">@${resource[0].createdBy.username}</small>
                        </div>

                        <div class="col-xs-3">
                        </div>

                        <div class="col-xs-3">
                            <a href="#" class="text-left">${resource[0].topic}</a>
                        </div>
                    </div>

                    <p>${resource[0].description}</p>

                    <div class="row" style="padding-bottom:10px">
                        <div class="col-xs-1 fa fa-facebook-official"></div>

                        <div class="col-xs-1 fa fa-twitter"></div>

                        <div class="col-xs-1 fa fa-google-plus"></div>

                        <div class="col-xs-6"></div>

                        <div class="col-xs-3"><a href="#">View Post</a></div>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>