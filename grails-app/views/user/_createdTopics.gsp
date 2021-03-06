<div class="box box-warning">
    <div class="box-header with-border">
        <strong class="box-title">Topic</strong>

        <div class="box-tools pull-right">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        </div>
    </div>

    <div class="box-body">
        <div id="createdTopic-scrollable">
            <g:if test="${createdTopics.empty}">
                <p>No Created Topics</p>
            </g:if>
            <g:else>
                <div class="row">
                    <div class="alert alert-success" hidden="hidden" id="responseMessage">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.
                        </span>
                    </div>
                </div>
                <g:set var="iteration" value="${0}"/>
                <g:each in="${createdTopics}" var="topic">
                    <div>
                        <div class="col-xs-2">
                            <g:if test="${session.user.imagePath}">
                                <ls:userImage userId="${session.user.createdBy.id}"/>
                            </g:if>
                            <g:else>
                                <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                            </g:else>
                        </div>

                        <div class="col-xs-10">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group" style="padding-bottom:25px" hidden="hidden"
                                         id="editTopic${iteration}">
                                        <div class="col-xs-5">
                                            <input type="text" placeholder="Grails" class="form-control"
                                                   id="topicEditBox${iteration}" value="${topic.name}">
                                        </div>

                                        <div class="col-xs-2">
                                            <button type="button" class="btn btn-success buttonSave"
                                                    id="topicsaveButton${iteration}"
                                                    onclick="saveTopicName(${topic.id}, this.id)">Save</button>
                                        </div>

                                        <div class="col-xs-2">
                                            <button type="button" class="btn btn-danger buttonCancel"
                                                    id="topicCancelButton${iteration}">Cancel</button>
                                        </div>
                                    </div>
                                    <g:link controller="topic" action="show"
                                            id="${topic.id}"
                                            class="text-left" elementId="topicName${iteration}">${topic.name}</g:link>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-3">
                                </div>

                                <div class="col-xs-1"></div>

                                <div class="col-xs-3"><small class="text-muted">Subscription</small></div>

                                <div class="col-xs-1"></div>

                                <div class="col-xs-3"><small class="text-muted">Posts</small></div>

                                <div class="col-xs-1"></div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4">
                                    <small class="text-muted">@${topic.createdBy.username}</small>
                                </div>

<<<<<<< HEAD
                                <div class="col-xs-4"><p class="text-info"><ls:subscriptionCount
                                        user="${session.user}"/></p>
                                </div>
=======
                        <div class="col-xs-4"><p class="text-info"><ls:subscriptionCount topicId="${topic.id}"/></p>
                        </div>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157


                                <div class="col-xs-4"><p class="text-info"><ls:resourceCount topicId="${topic.id}"/></p>
                                </div>
                            </div>

                            <div style="padding-bottom:15px" class="row">
                                <div class="col-xs-5">
                                    <ls:showSeriousness topicId="${topic.id}" panelName="createdTopics"/>
                                    %{--<g:select name="seriousness" from="${com.intelligrape.linksharing.Seriousness.values()}"--}%
                                    %{--class="form-control"--}%
                                    %{--onchange="changeSeriouness(this.value,${topic.id},'createdTopics')"--}%
                                    %{--id="Seriousness"/>--}%
                                </div>

                                <div class="col-xs-4">
                                    <ls:showVisibility topicId="${topic.id}" panelName="createdTopics"/>
                                    %{--<g:select name="visibility" from="${com.intelligrape.linksharing.Visibility.values()}"--}%
                                    %{--onchange="changeVisibility(this.value,${topic.id},'createdTopics')"--}%
                                    %{--class="form-control"--}%
                                    %{--id="Visibility"/>--}%
                                </div>

                                <div><a href="javascript:void(0);" data-toggle="modal" data-target="#sendinvite"><i
                                        class="glyphicon glyphicon-envelope col-xs-1"
                                        style="font-size:20px;"></i></a></div>

                                <div><a href="javascript:void(0);" class="editButton"
                                        id="editTopicIcon${iteration++}"><i
                                            class="glyphicon glyphicon-file col-xs-1"
                                            style="font-size:20px;"></i></a></div>

                                <div><a href="javascript:void(0);"
                                        onclick="deleteTopic(${topic.id}, 'createdTopics')"><i
                                            class="glyphicon glyphicon-trash col-xs-1"
                                            style="font-size:20px;"></i></a></div>
                            </div>
                        </div>
                    </div>
                </g:each>
            </g:else>
        </div>
    </div>
</div>
<script>
    $("#createdTopic-scrollable").slimScroll({
        height : '354px'
    });
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
                    loadCreatedTopics(function () {
                        $("#responseMessage").attr("class", "alert alert-success").show();
                        $("#responseMessage > .visibilityText").text(response);
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