<%@ page import="linksharing.Topic" %>
<div class="box box-warning">
    <div class="box-header with-border"><strong class="box-title">Topic: "${topic.name}"</strong></div>

    <div class="box-body">
        <div class="row" id="alertPanelSection">
                <div class="alert alert-success" hidden="hidden" id="responseMessage">
                    <a href="#" id="alertDismiss" class="close" aria-label="close">&times;</a>
                    <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.
                    </span>
                </div>
        </div>

        <div>
            <div class="col-xs-2">
                <g:if test="${topic.createdBy.imagePath}">
                    <img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${topic.createdBy.id}")}' style="width:80px;" class='img-circle' alt='User Image'>
                </g:if>
                <g:else>
                    <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                </g:else>
            </div>

            <div class="col-xs-10">
                <div class="row">
                    <div class="col-xs-12">
                        <a href="javascript:void(0);" class="text-left">${topic.name}</a>
                        <small class="text-muted">(${topic.visibility})</small>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-3">
                        <small class="text-muted"><g:link controller="user" action="userProfile" params="${[username:topic.createdBy.username]}">@${topic.createdBy.username}</g:link></small>
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
                            topicId="${topic.id}"/></p></div>

                    <div class="col-xs-1"></div>

                    <div class="col-xs-3"><p class="text-info"><ls:resourceCount
                            topicId="${topic.id}"/></p>
                    </div>

                    <div class="col-xs-1"></div>
                </div>
                <g:if test="${session.user}">
                    <div class="row">
                        <div class="col-xs-6">
                        </div>

                        <div class="col-xs-5">
                            <ls:showSeriousness topicId="${topic.id}"/>
                            %{--<g:select name="seriousness" from="${com.intelligrape.linksharing.Seriousness.values()}"--}%
                            %{--class="form-control"--}%
                            %{--onchange="changeSeriouness(this.value,${topic.id})"--}%
                            %{--id="Seriousness"/>--}%
                        </div>

                        <div>
                            <g:if test="${linksharing.Subscription.countByUserAndTopic(session.user, linksharing.Topic.read(topic.id))}">
                                <a href="javascript:void(0);" data-toggle="modal" data-target="#sendinvite">
                                    <i class="glyphicon glyphicon-envelope col-xs-1"
                                       style="font-size:20px;"></i>
                                </a>
                            </g:if>
                        </div>
                    </div>
                </g:if>
            </div>
        </div>
    </div>
</div>
<script>
$("#alertDismiss").click(function(){
  $("#responseMessage").fadeOut();
});
</script>