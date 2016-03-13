<div class="panel panel-default">
    <div class="panel-heading"><strong>Topic: "${topic.name}"</strong></div>

    <div class="panel-body">
        <div class="row" id="alertPanelSection">
            <div id="alertPanel">
            <div class="alert alert-success" hidden="hidden" id="responseMessage">
                <a href="#" id="alertDismiss" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.</span>
            </div>
            </div>
        </div>

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
                        <div class="col-xs-7">
                        </div>

                        <div class="col-xs-4">
                            <g:select name="seriousness" from="${linksharing.Seriousness.values()}"
                                      class="form-control"
                                      onchange="changeSeriouness(this.value,${topic.id})"
                                      id="Seriousness"/>
                        </div>

                        <div><a href="javascript:void(0);" data-toggle="modal" data-target="#sendinvite"><i
                                class="glyphicon glyphicon-envelope col-xs-1"
                                style="font-size:20px;"></i></a></div>
                    </div>
                </g:if>
            </div>
        </div>
    </div>
</div>