<%@ page import="linksharing.Resource; linksharing.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Resource Show</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <!-- Name Panel -->
            <!-- ************************************************** -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div>
                        <div class="col-xs-2">
                            <g:if test="${resource?.createdBy?.imagePath}">
                                <ls:userImage userId="${resource?.createdBy?.id}"/>
                            </g:if>
                            <g:else>
                                <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                            </g:else>
                        </div>

                        <div class="col-xs-10">
                            <div class="row" style="padding-bottom:5px">
                                <div class="col-xs-6">
                                    <span class="h5">${resource?.createdBy}</span>
                                </div>

                                <div class="col-xs-3">
                                </div>

                                <div class="col-xs-3">
                                    <g:link controller="topic" action="show"
                                            id="${resource.topic.id}"
                                            class="text-left">${resource?.topic?.name}</g:link>
                                </div>
                            </div>

                            <div class="row" style="padding-bottom:10px">
                                <div class="col-xs-4">
                                    <small class="text-muted">@${resource?.createdBy?.username}</small>
                                </div>

                                <div class="col-xs-2"></div>

                                <div class="col-xs-6 text-muted"><g:formatDate type="datetime" style="LONG" timeStyle="SHORT" date="${resource?.dateCreated}"/></div>
                            </div>
                            <g:if test="${session.user}">
                                <div class="row" style="padding-bottom:15px">
                                    <div class="col-xs-4"></div>
                                    <form name="ratingForm" class="form-horizontal">
                                        <div class="col-xs-4">
                                            <g:select value="${linksharing.ResourceRating.findByUserAndResource(session.user,resource)}" name="rating" from="${0..5}" class="form-control"/>
                                        </div>
                                        <g:hiddenField name="id" value="${resource.id}"/>
                                        <div class="col-xs-4">
                                            <input name="vote" id="vote" type="button" value="Vote"
                                                            class="btn btn-success"/>
                                        </div>
                                    </form>
                                </div>
                                <div class="row">
                                    <div class="alert alert-success" hidden="hidden" id="responseMessageRating">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.</span>
                                    </div>
                                </div>
                            </g:if>
                            <p style="padding-bottom:5px">${resource?.description}</p>
                        </div>


                        <div class="row">
                            <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                            <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                            <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                            <div class="col-xs-2"></div>

                            <div class="col-xs-1"><ls:canDeleteResouce resource="${resource}"/></div>
                            <g:if test="${session.user && session.user.admin}">
                                <div class="col-xs-1"><a href='#' data-toggle='modal'
                                                         data-target='#editResource'>Edit</a>

                                </div>
                            </g:if>
                            <ls:documentOrLink resourceId="${resource.id}"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-6" id="trendingTopicsSection">
            <!-- Trending Topics Panel -->
            <!-- ************************************************ -->
            <g:if test="${session.user}">
                <ls:trendingTopics/>
            </g:if>
            <g:else>
                <g:render template="/login/register"/>
            </g:else>
        </div>
    </div>

    <div class="row">
    <g:if test="${session.user && session.user.admin}">

    <div class="col-xs-6">
    <g:render template="editResource" model="[description: resource.description, id: resource.id]"/>
    </div>

    </g:if>
    </div>
</div>
<script>
  $("#vote").click(function(){
      $.ajax({
          url: "/resourceRating/saveRating",
          data: {"id":$("#id").val(), "rating":$("#rating").val()},
          method: "POST",
          success: function (data) {
              var response = data.message;
              if (response == "Success") {
                  $("#responseMessageRating").attr("class", "alert alert-success").show();
                  $("#responseMessageRating > .visibilityText").text(response);
              }
              else {
                  $("#responseMessageRating").attr("class", "alert alert-danger").show();
                  $("#responseMessageRating > .visibilityText").text(response);
              }

          },
          error: function (data) {
              $("#responseMessageRating").attr("class", "alert alert-danger").show();
              $("#responseMessageRating > .visibilityText").text(data.statusText);
          }
      });
  });
</script>
</body>
</html>