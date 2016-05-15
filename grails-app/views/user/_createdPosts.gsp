<div class="box box-warning">
    <div class="box-header with-border">
        <strong class="box-title">Posts</strong>

        <div class="box-tools pull-right">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        </div>
    </div>

    <div class="box-body">
        <div id="createdTopic-scrollable">
            <g:if test="${createdPosts.empty}">
                <p>No Posts</p>
            </g:if>
            <g:else>
                <g:each in="${createdPosts}" var="post">
                    <div>
                        <div class="row" style="padding-left: 21px;">
                            <div class="col-xs-2">
                                <g:if test="${post.createdBy.imagePath}">
                                    <img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${session.user.id}")}' style="width:80px;" class='img-circle' alt='User Image'>
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

                        <div class="row" style="padding-bottom:10px;padding-top:5px;padding-left: 21px;">
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
</div>
<script>
    $("#createdTopic-scrollable").slimScroll({
        height : '575px'
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