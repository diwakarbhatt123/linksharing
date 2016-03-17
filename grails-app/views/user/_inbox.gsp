<div class="panel panel-default">
    <div class="panel-heading"><strong>Inbox</strong></div>

    <div class="panel-body">
        <g:if test="${unreadPosts.isEmpty()}">
            <p>No Unread Items</p>
        </g:if>
        <g:else>
            <g:each in="${unreadPosts}" var="post">
                <div>
                    <div class="row">
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
                                    <span class="h5">${post.createdBy.fullName}</span>
                                    <small class="text-muted">@${post.createdBy.username}</small>
                                </div>

                                <div class="col-xs-3">
                                </div>

                                <div class="col-xs-3">
                                    <g:link controller="topic" action="show"
                                            id="${post.topic.id}"
                                            class="text-left">${post.topic.name}</g:link>
                                </div>
                            </div>

                            <p>${post.description}</p>
                        </div>
                    </div>

                    <div class="row" style="padding-bottom:10px;padding-top:5px">
                        <div class="col-xs-1 fa fa-facebook-official"></div>

                        <div class="col-xs-1 fa fa-twitter"></div>

                        <div class="col-xs-1 fa fa-google-plus"></div>
                        <ls:documentOrLink resourceId="${post.id}"/>
                        <div class="col-xs-3"><p class="text-nowrap"><ls:isRead resourceId="${post.id}"/></p></div>

                        <div class="col-xs-2"><p><g:link controller="resource" action="show" class="text-nowrap"
                                                             id="${post.id}">View Post</g:link></p></div>
                    </div>
                </div>
            </g:each>
        </g:else>
    </div>
</div>