<div id="resource-scrollable">
<g:if test="${resources.empty}">
    <p>No Posts Found</p>
</g:if>
<g:else>
<g:each in="${resources}" var="resource">
    <div>
        <div class="row">
            <div class="col-xs-2">
                <g:if test="${resource.createdBy.imagePath}">
                    <img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${resource.createdBy.id}")}' style="width:80px;" class='img-circle' alt='User Image'>
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