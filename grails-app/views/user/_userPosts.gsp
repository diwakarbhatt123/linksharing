<div class="panel panel-default">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-4">
                <strong>Posts</strong></div>
        </div>
    </div>

    <div class="panel-body" id="postsSection">
        <g:if test="${resources.empty}">
            <p>No Posts Found</p>
        </g:if>
        <g:else>
            <g:each in="${resources}" var="resource">
                <div>
                    <div class="row">
                        <div class="col-xs-2">
                            <g:if test="${resource.createdBy.imagePath}">
                                <ls:userImage userId="${resource.createdBy.id}"/>
                            </g:if>
                            <g:else>
                                <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                            </g:else>
                        </div>

                        <div class="col-xs-10">
                            <div class="row">
                                <div class="col-xs-12">
                                </div>
                            </div>

                            <p>${resource.description}</p>
                        </div>
                    </div>

                    <div class="row" style="padding-bottom:10px;padding-top:5px">
                        <div class="col-xs-1 fa fa-facebook-official"></div>

                        <div class="col-xs-1 fa fa-twitter"></div>

                        <div class="col-xs-1 fa fa-google-plus"></div>
                        <ls:documentOrLink resourceId="${resource.id}"/>
                        <div class="col-xs-3"><p class="text-nowrap"><ls:isRead resourceId="${resource.id}"/></p></div>

                        <div class="col-xs-3"><p><g:link controller="resource" action="show" class="text-nowrap"
                                                         id="${resource.id}">View Post</g:link></p></div>
                    </div>
                </div>
            </g:each>
        </g:else>
    </div>
</div>