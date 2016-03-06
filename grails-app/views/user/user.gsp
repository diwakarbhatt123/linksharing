<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 4/3/16
  Time: 11:18 AM
--%>

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
                            <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                        </div>

                        <div class="col-xs-10">
                            <span class="h5"><strong>Diwakar Bhatt</strong></span>
                            <small class="text-muted">@diwakarbhatt</small>

                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mi risus, mollis sit amet purus vitae, rutrum commodo erat.</p>

                            <div class="row">
                                <div class="col-xs-4 text-muted">Subcription</div>

                                <div class="col-xs-6 text-muted">Topics</div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4 text-primary">50</div>

                                <div class="col-xs-6 text-primary">30</div>
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
                                <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                            </div>

                            <div class="col-xs-10">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <g:link controller="topic" action="show" id="${topic.id}" class="text-left">${topic.name}</g:link>
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

                                    <div class="col-xs-3"><p class="text-info">${Subscription.countByTopic(topic)}</p>
                                    </div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><p class="text-info">${Resource.countByTopic(topic)}</p></div>

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

        <div class="col-xs-6">
            <!-- Subscription Panel-->
            <!-- ************************************************************ -->
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Trending Topics</strong></div>

                <div class="panel-body">
                    <g:each in="${trendingTopics}" var="trendingTopic">
                        <div>
                            <div class="col-xs-2">
                                <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                            </div>

                            <div class="col-xs-10">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <g:link controller="topic" action="show" id="${Topic.findByName(trendingTopic.name).id}" class="text-left">${trendingTopic.name}</g:link>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-3">
                                        <small class="text-muted">@${trendingTopic.createdBy.username}</small>
                                    </div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><small class="text-muted">Subscription</small></div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><small class="text-muted">Posts</small></div>

                                    <div class="col-xs-1"></div>
                                </div>

                                <div class="row">
                                    <g:if test="${linksharing.Subscription.countByTopicAndUser(linksharing.Topic.findByName(trendingTopic.name), session.user)}">
                                        <g:set var="visibility" value="visible"/>
                                        <div class="col-xs-3"><a href="#">Unsubscribe</a></div>
                                    </g:if>
                                    <g:else>
                                        <div class="col-xs-3"><a href="#">Subscribe</a></div>
                                        <g:set var="visibility" value="hidden"/>
                                    </g:else>
                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><p
                                            class="text-info">${Subscription.countByTopic(Topic.findByName(trendingTopic.name))}</p>
                                    </div>

                                    <div class="col-xs-1"></div>

                                    <div class="col-xs-3"><p class="text-info">${trendingTopic.count}</p></div>

                                    <div class="col-xs-1"></div>
                                </div>

                                <div style="visibility: ${visibility}; padding-bottom:7.5px" class="row">
                                    <div class="col-xs-4">
                                        <select class="form-control" id="Seriousness">
                                            <option>Serious</option>
                                            <option>Very Serious</option>
                                            <option>Casual</option>
                                        </select>
                                    </div>

                                    <div class="col-xs-4">
                                        <select class="form-control" id="Visibility">
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
    </div>
     </div>
</body>
</html>