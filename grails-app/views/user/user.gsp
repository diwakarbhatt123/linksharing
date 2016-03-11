<%@ page import="linksharing.Topic; linksharing.Subscription; linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>${session.user}'s Dashboard</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <!-- Name Panel -->
            <!-- ************************************************** -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div>
                        <div class="col-xs-2">
                            <g:if test="${session.user.imagePath}">
                                <ls:userImage userId="${session.user.id}"/>
                            </g:if>
                            <g:else>
                                <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                            </g:else>
                        </div>

                        <div class="col-xs-10">
                            <span class="h5"><strong>${session.user.fullName}</strong></span>
                            <small class="text-muted">@${session.user.username}</small>

                            <div class="row"><div class="col-xs-12"></div></div>

                            <div class="row">
                                <div class="col-xs-4 text-muted">Subcriptions</div>

                                <div class="col-xs-6 text-muted">Topics</div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4 text-primary"><ls:subscriptionCount user="${session.user}"/></div>

                                <div class="col-xs-6 text-primary"><ls:topicCount user="${session.user}"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-6">
            <!-- Inbox Panel -->
            <!-- ************************************************ -->
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Inbox</strong></div>

                <div class="panel-body">
                    <div>
                        <div class="col-xs-2">
                            <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                        </div>

                        <div class="col-xs-10">
                            <div class="row">
                                <div class="col-xs-6">
                                    <span class="h5">Diwakar Bhatt</span>
                                    <small class="text-muted">@diwakarbhatt</small>
                                </div>

                                <div class="col-xs-3">
                                </div>

                                <div class="col-xs-3">
                                    <a href="#" class="text-left">Grails</a>
                                </div>
                            </div>

                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mi risus, mollis sit amet purus vitae, rutrum commodo erat.</p>

                            <div class="row">
                                <div class="col-xs-1 fa fa-facebook-official"></div>

                                <div class="col-xs-1 fa fa-twitter"></div>

                                <div class="col-xs-1 fa fa-google-plus"></div>

                                <div class="col-xs-6"></div>

                                <div class="col-xs-3"><a href="#">View Post</a></div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="col-xs-2">
                            <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                        </div>

                        <div class="col-xs-10">
                            <div class="row">
                                <div class="col-xs-6">
                                    <span class="h5">Diwakar Bhatt</span>
                                    <small class="text-muted">@diwakarbhatt</small>
                                </div>

                                <div class="col-xs-3">
                                </div>

                                <div class="col-xs-3">
                                    <a href="#" class="text-left">Grails</a>
                                </div>
                            </div>

                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mi risus, mollis sit amet purus vitae, rutrum commodo erat.</p>

                            <div class="row">
                                <div class="col-xs-1 fa fa-facebook-official"></div>

                                <div class="col-xs-1 fa fa-twitter"></div>

                                <div class="col-xs-1 fa fa-google-plus"></div>

                                <div class="col-xs-6"></div>

                                <div class="col-xs-3"><a href="#">View Post</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Row 2 -->
    <div class="row">
        <div class="col-xs-6">
            <!-- Subscription Panel-->
            <!-- ************************************************************ -->
            <div class="panel panel-default">
                <div class="panel-heading clearfix">
                    <h5 class="panel-title pull-left"
                        style="font-size:15px;padding-top:7.5px;"><strong>Subscription</strong></h5>

                    <div class="btn-group pull-right">
                        <a href="#">View All</a>
                    </div>
                </div>

                <div class="panel-body">
                    <g:each in="${session.user.subscribedTopics}" var="topic">
                        <div>
                            <div class="col-xs-2">
                                <g:if test="${topic.createdBy.imagePath}">
                                    <ls:userImage userId="${topic.createdBy.id}"/>
                                </g:if>
                                <g:else>
                                    <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                                </g:else>
                            </div>

                            <div class="col-xs-10">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <g:link controller="topic" action="show" id="${topic.id}"
                                                class="text-left">${topic.name}</g:link>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-3">
                                        <small class="text-muted">@${topic.createdBy.username}</small>
                                    </div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><small class="text-muted">Subscription</small></div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><small class="text-muted">Posts</small></div>

                                    <div class="col-xs-1"></div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-3"><a href="#">Unsubscribe</a></div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><p class="text-info"><ls:subscriptionCount
                                            topicId="${topic.id}"/></p></div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><p class="text-info"><ls:resourceCount
                                            topicId="${topic.id}"/></p></div>

                                    <div class="col-xs-1"></div>
                                </div>

                                <div style="visibility: ${visibility}; padding-bottom:7.5px" class="row">
                                    <div class="col-xs-4">
                                        <select class="form-control" id="SeriousnessSubs">
                                            <option>Serious</option>
                                            <option>Very Serious</option>
                                            <option>Casual</option>
                                        </select>
                                    </div>

                                    <div class="col-xs-4">
                                        <select class="form-control" id="VisibilitySubs">
                                            <option>Public</option>
                                            <option>Private</option>
                                        </select>
                                    </div>

                                    <div><a class="glyphicon glyphicon-envelope col-xs-1" style="font-size:20px;"
                                            href="#"></a></div>

                                    <div><a class="glyphicon glyphicon-file col-xs-1" style="font-size:20px;"
                                            href="#"></a></div>

                                    <div><a class="glyphicon glyphicon-trash col-xs-1" style="font-size:20px;"
                                            href="#"></a></div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>
        </div>

        <div class="col-xs-6" id="trendingTopicsSection">
            <!-- Subscription Panel-->
            <!-- ************************************************************ -->
            %{--<ls:trendingTopics/>--}%
        </div>
    </div>
</div>
<script>
    loadTrendingTopics();
</script>
</body>
</html>