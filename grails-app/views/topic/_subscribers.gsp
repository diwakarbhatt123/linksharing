<div class="box box-warning">
    <div class="box-header with-border">
        <strong class="box-title">Subscribers: "${topicName}"</strong>

        <div class="box-tools pull-right">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        </div>
    </div>

    <div class="box-body">
        <div id="subscriber-scrollable">
            <g:each in="${subscribers}" var="subscriber">
                <div>
                    <div class="col-xs-2">
                        <g:if test="${subscriber.imagePath}">
                            <ls:userImage userId="${subscriber.id}"/>
                        </g:if>
                        <g:else>
                            <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                        </g:else>
                    </div>

                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-12">
                                <span class="h3"><strong>${subscriber.fullName}</strong></span>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-3">
                                <small class="text-muted">@${subscriber.username}</small>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-3"><small class="text-muted">Subscriptions</small></div>

                            <div class="col-xs-1"></div>

                            <div class="col-xs-3"><small class="text-muted">Topics</small></div>

                            <div class="col-xs-1"></div>
                        </div>

                        <div class="row">
                            <div class="col-xs-3"><p class="text-info"><ls:subscriptionCount user="${subscriber}"/></p>
                            </div>

                            <div class="col-xs-1"></div>

                            <div class="col-xs-3"><p class="text-info"><ls:topicCount user="${subscriber}"/></p></div>

                            <div class="col-xs-1"></div>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</div>
<script>
    $("#subscriber-scrollable").slimScroll({
        height : '260px'
    });
</script>