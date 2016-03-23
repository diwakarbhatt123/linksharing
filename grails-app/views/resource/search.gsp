<%@ page import="linksharing.Topic; linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Search</title>
    <asset:javascript src="jquery-ui.js"/>
    <asset:stylesheet href="jquery-ui.css"/>
    <script>
        $(function () {
            $("#accordian").accordion({
                heightStyle : "content"
            });
        });
    </script>
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
                            <div class="row">
                                <div class="alert alert-success" hidden="hidden" id="responseMessage">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.
                                    </span>
                                </div>
                            </div>
                            <div id="accordian">
                                <h3>Topics</h3>

                                <div>
                                    <g:if test="${searchTopics?.empty}">
                                        <p>No Matching Topics Found</p>
                                    </g:if>
                                    <g:else>
                                    <g:set var="iteration" value="${0}"/>
                                    <g:each in="${searchTopics}" var="topic">
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
                                                        <g:if test="${session.user && (session.user.admin || session.user.id == topic.createdBy.id)}">
                                                            <div class="form-group" style="padding-bottom:25px" hidden="hidden"
                                                                 id="searcheditTopic${iteration}">
                                                                <div class="col-xs-5">
                                                                    <input type="text" placeholder="Grails" class="form-control"
                                                                           id="searchtopicEditBox${iteration}" value="${topic.name}">
                                                                </div>

                                                                <div class="col-xs-2">
                                                                    <button type="button" class="btn btn-success buttonSave"
                                                                            id="searchtopicsaveButton${iteration}"
                                                                            onclick="saveTopicName(${topic.id}, this.id)">Save</button>
                                                                </div>

                                                                <div class="col-xs-2">
                                                                    <button type="button" class="btn btn-danger buttonCancel"
                                                                            id="searchtopicCancelButton${iteration}">Cancel</button>
                                                                </div>
                                                            </div>
                                                            <g:link controller="topic" elementId="topicName${iteration}" action="show"
                                                                    id="${topic.id}"
                                                                    class="text-left">${topic.name}</g:link>
                                                        </g:if>
                                                        <g:else>
                                                            <g:link controller="topic" action="show"
                                                                    id="${topic.id}"
                                                                    class="text-left">${topic.name}</g:link>
                                                        </g:else>
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
                                                    <div class="col-xs-3"><ls:showSubscribe topicId="${topic.id}"/></div>

                                                    <div class="col-xs-1"></div>

                                                    <div class="col-xs-3"><p class="text-info"><ls:subscriptionCount
                                                            topicId="${topic.id}"/></p>
                                                    </div>

                                                    <div class="col-xs-1"></div>

                                                    <div class="col-xs-3"><p class="text-info"><ls:resourceCount
                                                            topicId="${topic.id}"/></p>
                                                    </div>

                                                    <div class="col-xs-1"></div>
                                                </div>

                                                <div style="padding-bottom:7.5px" class="row">
                                                    <div class="col-xs-5">
                                                        <g:if test="${session.user && linksharing.Subscription.countByUserAndTopic(session.user, linksharing.Topic.read(topic.id))}">
                                                            <ls:showSeriousness topicId="${topic.id}" panelName="trendingTopics"/>
                                                        %{--<g:select name="seriousness" from="${com.intelligrape.linksharing.Seriousness.values()}"--}%
                                                        %{--class="form-control"--}%
                                                        %{--onchange="changeSeriouness(this.value,${trendingTopic.id},'trendingTopics')"--}%
                                                        %{--id="Seriousness"/>--}%
                                                        </g:if>
                                                    </div>

                                                    <div class="col-xs-4">
                                                        <g:if test="${session.user && (session.user.admin || session.user.id == topic.createdBy.id)}">
                                                            <ls:showVisibility topicId="${topic.id}" panelName="trendingTopics"/>
                                                        %{--<g:select name="visibility" from="${com.intelligrape.linksharing.Visibility.values()}"--}%
                                                        %{--onchange="changeVisibility(this.value,${trendingTopic.id},'trendingTopics')"--}%
                                                        %{--class="form-control"--}%
                                                        %{--id="Visibility"/>--}%
                                                        </g:if>
                                                    </div>
                                                    <g:if test="${linksharing.Subscription.countByUserAndTopic(session.user, Topic.read(topic.id))}">
                                                        <div><a href="javascript:void(0);" data-toggle="modal" data-target="#sendinvite"><i
                                                                class="glyphicon glyphicon-envelope col-xs-1"
                                                                style="font-size:20px;"></i></a></div>
                                                    </g:if>
                                                    <g:if test="${session.user && (session.user.admin || session.user.id == topic.createdBy.id)}">

                                                        <div><a href="javascript:void(0);" class="editButton"
                                                                id="editTopicIcon${iteration++}"><i
                                                                    class="glyphicon glyphicon-file col-xs-1"
                                                                    style="font-size:20px;"></i></a></div>

                                                        <div><a href="javascript:void(0);"
                                                                onclick="deleteTopic(${topic.id}, 'trendingTopics')"><i
                                                                    class="glyphicon glyphicon-trash col-xs-1"
                                                                    style="font-size:20px;"></i></a></div>
                                                    </g:if>
                                                </div>
                                            </div>
                                        </div>
                                    </g:each>
                                    </g:else>
                                </div>

                                <h3>Resources</h3>

                                <div>
                                    <g:if test="${searchResources?.empty}">
                                        <p>No Matching Resource Found</p>
                                    </g:if>
                                    <g:else>
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
                                                            <g:link controller="topic" action="show"
                                                                    id="${resource.topic.id}"
                                                                    class="text-left">${resource.topic.name}</g:link>
                                                        </div>
                                                    </div>

                                                    <p>${resource.description}</p>

                                                    <div class="row">
                                                        <div class="col-xs-1 fa fa-facebook-official"></div>

                                                        <div class="col-xs-1 fa fa-twitter"></div>

                                                        <div class="col-xs-1 fa fa-google-plus"></div>

                                                        <ls:documentOrLink resourceId="${resource.id}"/>
                                                        <div class="col-xs-3"><p class="text-nowrap"><ls:isRead
                                                                resourceId="${resource.id}"/></p></div>

                                                        <div class="col-xs-2"><p><g:link controller="resource"
                                                                                         action="show"
                                                                                         class="text-nowrap"
                                                                                         id="${resource.id}">View Post</g:link></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </g:each>
                                    </g:else>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(".editButton").click(function () {
        var currentElementId = (this.id).substr(13);
        console.log(currentElementId);
        $("#editTopic" + currentElementId).show();
        $("#topicName" + currentElementId).hide();
    });
    $(".buttonCancel").click(function () {
        var currentElementId = (this.id).substr(17);
        console.log(currentElementId);
        $("#editTopic" + currentElementId).hide();
        $("#topicName" + currentElementId).show();
    });
    function saveTopicName(topicId, buttonId) {
        console.log("This was called");
        var buttonClicked = $(".buttonSave > " + buttonId);
        var currentElementId = buttonId.substr(15);
        $("#editTopic" + currentElementId).hide();
        $("#topicName" + currentElementId).show();
        $.ajax({
            url: "/topic/updateTopicName",
            data: {"id": topicId, "topic": $("#topicEditBox" + currentElementId).val()},
            method: "POST",
            success: function (data) {
                var response = data.message;
                if (response == "Topic Updated") {
                    loadTrendingTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
                        loadSubscription();
                    })
                }
                else {
                    $("#responseMessage").attr("class", "alert alert-danger").show();
                    $("#responseMessage > .visibilityText").text(response);
                }

            },
            error: function (data) {
                $("#responseMessage").attr("class", "alert alert-danger").show();
                $("#responseMessage > .visibilityText").text(data.statusText);
            }
        });
    }
</script>
</body>
</html>