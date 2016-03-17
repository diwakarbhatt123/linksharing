<div class="panel panel-default">
    <div class="panel-heading"><strong>Recent Shares</strong></div>

    <div class="panel-body">
        <g:if test="${recentPosts.isEmpty()}">
            <p>No Recent Posts</p>
        </g:if>
        <g:else>
            <g:each in="${recentPosts}" var="post">
                <div>
                    <div class="col-xs-2">
                        <g:if test="${post.createdBy.imagePath}">
                            <ls:userImage userId="${post.createdBy.id}"/>
                        </g:if>
                        <g:else>
                            <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                        </g:else>
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
                                <g:link class="text-left" controller="topic" action="show"
                                        id="${post.topic.id}">${post.topic}</g:link>
                            </div>
                        </div>

                        <p>${post.description}</p>

                        <div class="row" style="padding-bottom:7.5px">
                            <div class="col-xs-1 fa fa-facebook-official"></div>

                            <div class="col-xs-1 fa fa-twitter"></div>

                            <div class="col-xs-1 fa fa-google-plus"></div>

                            <div class="col-xs-6"></div>

                            <div class="col-xs-3"><g:link controller="resource" action="show"
                                                          id="${post.id}">View Post</g:link></div>
                        </div>
                    </div>
                </div>
            </g:each>
        </g:else>
    </div>
</div>