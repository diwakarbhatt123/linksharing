<div class="panel panel-default">
    <div class="panel-heading"><strong>Recent Shares</strong></div>

    <div class="panel-body">
        <g:each in="${recentPosts}" var="post">
            <div>
                <div class="col-xs-2">
                    <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                </div>

                <div class="col-xs-10">
                    <div class="row">
                        <div class="col-xs-6">
                            <span class="h5">${post.createdBy}</span>
                            <small class="text-muted">@${post.createdBy.username}</small>
                        </div>

                        <div class="col-xs-3">
                        </div>

                        <div class="col-xs-3">
                            <a href="#" class="text-left">${post.topic}</a>
                        </div>
                    </div>

                    <p>${post.description}</p>

                    <div class="row" style="padding-bottom:7.5px">
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