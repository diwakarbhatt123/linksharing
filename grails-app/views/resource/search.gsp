<%@ page import="linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Search</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <div class="row">
                <div class="col-xs-12">
                    <!-- Topic Panel -->
                    <!-- ************************************************** -->
                    <g:render template="/user/trendingtopics"
                              model="${[trendingTopics: linksharing.Topic.trendingTopic]}"/>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <!-- Subscription Panel-->
                    <!-- ************************************************************ -->
                    <g:render template="/login/toppost" model="${[topPosts: linksharing.Resource.topPosts()]}"/>
                </div>
            </div>
        </div>

        <div class="col-xs-6">
            <div class="row">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-4">
                                    <strong>Search for "${query}"</strong></div>
                            </div>
                        </div>

                        <div class="panel-body">
                            <g:each in="${searchResources}" var="resource">
                                <div>
                                    <div class="col-xs-2">
                                        <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                                    </div>

                                    <div class="col-xs-10">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <span class="h5">${resource.createdBy.fullName}</span>
                                                <small class="text-muted">@${resource.createdBy.username}</small>
                                            </div>

                                            <div class="col-xs-3">
                                            </div>

                                            <div class="col-xs-3">
                                                <a href="#" class="text-left">${resource.topic.name}</a>
                                            </div>
                                        </div>

                                        <p>${resource.description}</p>

                                        <div class="row">
                                            <div class="col-xs-1 fa fa-facebook-official"></div>

                                            <div class="col-xs-1 fa fa-twitter"></div>

                                            <div class="col-xs-1 fa fa-google-plus"></div>

                                            <div class="col-xs-2"><small><a href="#">Download</a></small></div>

                                            <div class="col-xs-3"><small><a href="#">View Full Site</a></small></div>

                                            <div class="col-xs-2"><small><a href="#">Mark as Read</a></small></div>

                                            <div class="col-xs-2"><small><a href="#">View Post</a></small></div>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>