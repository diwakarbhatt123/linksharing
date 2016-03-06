<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Subscribed Users</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <!-- Topic Panel -->
            <!-- ************************************************** -->
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Topic: "${topic.name}"</strong></div>

                <div class="panel-body">
                    <div>
                        <div class="col-xs-2">
                            <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                        </div>

                        <div class="col-xs-10">
                            <div class="row">
                                <div class="col-xs-12">
                                    <a href="#" class="text-left">${topic.name}</a>
                                    <small class="text-muted">(${topic.visibility})</small>
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
                                <div class="col-xs-3"><a href="#">Subscribe</a></div>

                                <div class="col-xs-1"></div>

                                <div class="col-xs-3"><p class="text-info">${topic.subscribers}</p></div>

                                <div class="col-xs-1"></div>

                                <div class="col-xs-3"><p class="text-info">${topic.count}</p></div>

                                <div class="col-xs-1"></div>
                            </div>

                            <div class="row">
                                <div class="col-xs-7">
                                </div>

                                <div class="col-xs-4">
                                    <select class="form-control" id="sel1">
                                        <option>Serious</option>
                                        <option>Very Serious</option>
                                        <option>Casual</option>
                                    </select>
                                </div>

                                <div><a class="glyphicon glyphicon-envelope col-xs-1"
                                        style="font-size:20px; padding-top:5px;" href="#"></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-6">
            <!-- Topic Posts Panel -->
            <!-- ************************************************ -->
           <g:render template="resources" model="${[resources:topicResources,topicName:topic.name]}"/>
        </div>
        <!-- Row 2 -->
        <div class="row">
            <div class="col-xs-6">
                <!-- Subscription Panel-->
                <!-- ************************************************************ -->
                <g:render template="subscribers" model="${[subscribers:subscribedUsers,topicName:topic.name]}"/>
            </div>
</body>
</html>