<div class="panel panel-default">
    <div class="panel-heading">
        <div class="row">
            <div class="col-xs-4">
                <strong>Posts: "${topicName}"</strong></div>
            <div class="col-xs-4 pull-right">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <g:each in="${resources}" var="resource">
        <div>
            <div class="col-xs-2">
                <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
            </div>
            <div class="col-xs-10">
                <div class="row">
                    <div class="col-xs-12">
                    </div>
                </div>
                <p>${resource.description}</p>
                <div class="row" style="padding-bottom:10px">
                    <div class="col-xs-1 fa fa-facebook-official"></div>
                    <div class="col-xs-1 fa fa-twitter"></div>
                    <div class="col-xs-1 fa fa-google-plus"></div>
                    <div class="col-xs-2"><small><a href="#">Download</a></small></div>
                    <div class="col-xs-3"><small><a href="#">View Full Site</a></small></div>
                    <div class="col-xs-2"><small><ls:isRead resource="${resource}"/></small></div>
                    <div class="col-xs-2"><small><g:link controller="resource" action="show" id="${resource.id}">View Post</g:link></small></div>
                </div>
            </div>
        </div>
        </g:each>
    </div>
</div>