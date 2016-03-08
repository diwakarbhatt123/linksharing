<%@ page import="linksharing.Subscription; linksharing.Topic" %>
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
                            <g:link controller="topic" action="show"
                                    id="${linksharing.Topic.findByName(trendingTopic.name).id}"
                                    class="text-left">${trendingTopic.name}</g:link>
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
                        <div class="col-xs-3"><ls:showSubscribe topicId="${trendingTopic.id}"/></div>

                        <div class="col-xs-1"></div>

                        <div class="col-xs-3"><p class="text-info"><ls:subscriptionCount topicId="${trendingTopic.id}"/></p>
                        </div>

                        <div class="col-xs-1"></div>

                        <div class="col-xs-3"><p class="text-info"><ls:resourceCount topicId="${trendingTopic.id}"/></p>
                        </div>

                        <div class="col-xs-1"></div>
                    </div>

                    <div style="padding-bottom:7.5px" class="row">
                        <div class="col-xs-4">
                            <g:if test="${session.user.admin || session.user.id == trendingTopic.createdBy.id}">
                                <select class="form-control" id="Seriousness">
                                    <option>Serious</option>
                                    <option>Very Serious</option>
                                    <option>Casual</option>
                                </select>
                            </g:if>
                        </div>

                        <div class="col-xs-4">
                            <select class="form-control" id="Visibility">
                                <option>Public</option>
                                <option>Private</option>
                            </select>
                        </div>

                        <div><a class="glyphicon glyphicon-envelope col-xs-1" style="font-size:20px;"
                                href="#"></a></div>
                        <g:if test="${session.user.admin || session.user.id == trendingTopic.createdBy.id}">

                            <div><a class="glyphicon glyphicon-file col-xs-1" style="font-size:20px;"
                                    href="#"></a></div>

                            <div><a class="glyphicon glyphicon-trash col-xs-1" style="font-size:20px;"
                                    href="#"></a></div>
                        </g:if>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>