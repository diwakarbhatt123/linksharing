<div class="panel panel-default">
    <div class="panel-heading clearfix">
        <h5 class="panel-title pull-left"
            style="font-size:15px;padding-top:7.5px;"><strong>Top Posts</strong></h5>

        %{--<div class="btn-group pull-right">--}%
            %{--<button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Today<span--}%
                    %{--class="caret"></span></button>--}%
            %{--<ul class="dropdown-menu">--}%
                %{--<li><a href="#">Today</a></li>--}%
                %{--<li><a href="#">1 Week</a></li>--}%
                %{--<li><a href="#">1 Month</a></li>--}%
            %{--</ul>--}%
        %{--</div>--}%
    </div>

    <div class="panel-body">
        <g:if test="${topPosts.isEmpty()}">
            <p>No Top Posts</p>
        </g:if>
        <g:else>
            <g:each in="${topPosts}" var="resource">
                <div>
                    <div class="col-xs-2">
                        <g:if test="${resource[0].createdBy.imagePath}">
                            <ls:userImage userId="${resource[0].createdBy.id}"/>
                        </g:if>
                        <g:else>
                            <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                        </g:else>
                    </div>

                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="h5">${resource[0].createdBy}</span>
                                <small class="text-muted">@${resource[0].createdBy.username}</small>
                            </div>

                            <div class="col-xs-3">
                            </div>

                            <div class="col-xs-3">
                                <g:link controller="topic" action="show" id="${resource[0].topic.id}"
                                        class="text-left">${resource[0].topic}</g:link>
                            </div>
                        </div>

                        <p>${resource[0].description}</p>

                        <div class="row" style="padding-bottom:10px">
                            <div class="col-xs-1 fa fa-facebook-official"></div>

                            <div class="col-xs-1 fa fa-twitter"></div>

                            <div class="col-xs-1 fa fa-google-plus"></div>

                            <div class="col-xs-6"></div>

                            <div class="col-xs-3"><g:link controller="resource" action="show"
                                                          id="${resource[0].id}">View Post</g:link></div>
                        </div>
                    </div>
                </div>
            </g:each>
        </g:else>
    </div>
</div>