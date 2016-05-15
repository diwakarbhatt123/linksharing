<%@ page import="linksharing.Resource; linksharing.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
<<<<<<< HEAD
    <asset:stylesheet src="jquery.rateyo.min.css"/>
    <title>Resource Show</title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
          Post
        </h1>
    </section>
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-6">
                    <!-- Name Panel -->
                    <!-- ************************************************** -->
                    <div class="box box-warning">
                        <div class="box-body">
                            <div>
                                <div class="col-xs-2">
                                    <g:if test="${resource?.createdBy?.imagePath}">
                                        <img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${resource?.createdBy?.id}")}' style="width:90px;" class='img-circle' alt='User Image'>
                                    </g:if>
                                    <g:else>
                                        <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                                    </g:else>
=======
    <title>Resource</title>
</head>

<body>
%{--<div id="fb-root"></div>--}%
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
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157
                                </div>

                                <div class="col-xs-10">
                                    <div class="row" style="padding-bottom:5px">
                                        <div class="col-xs-6">
                                            <span class="h5">${resource?.createdBy}</span>
                                        </div>

                                        <div class="col-xs-3">
                                        </div>

<<<<<<< HEAD
                                        <div class="col-xs-3">
                                            <g:link controller="topic" action="show"
                                                    id="${resource.topic.id}"
                                                    class="text-left">${resource?.topic?.name}</g:link>
=======
                                <div class="col-xs-6 text-muted"><g:formatDate type="datetime" style="LONG"
                                                                               timeStyle="SHORT"
                                                                               date="${resource?.dateCreated}"/></div>
                            </div>
                            <g:if test="${session.user && linksharing.Subscription.countByUserAndTopic(session.user, resource?.topic)}">
                                <div class="row" style="padding-bottom:15px">
                                    <div class="col-xs-4"></div>

                                    <form name="ratingForm" class="form-horizontal">
                                        <div class="col-xs-4">
                                            <g:select
                                                    value="${linksharing.ResourceRating.findByUserAndResource(session.user, resource)}"
                                                    name="rating" from="${0..5}" class="form-control"/>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157
                                        </div>
                                    </div>

                                    <div class="row" style="padding-bottom:10px">
                                        <div class="col-xs-4">
<<<<<<< HEAD
                                            <small class="text-muted"><g:link controller="user" action="userProfile" params="${[username:resource.createdBy.username]}">@${resource?.createdBy?.username}</g:link></small>
                                        </div>

                                        <div class="col-xs-2"></div>

                                        <div class="col-xs-6 text-muted"><g:formatDate type="datetime" style="LONG"
                                                                                       timeStyle="SHORT"
                                                                                       date="${resource?.dateCreated}"/></div>
=======
                                            <input name="vote" id="vote" type="button" value="Vote"
                                                   class="btn btn-success"/>
                                        </div>
                                    </form>
                                </div>

                                <div class="row">
                                    <div class="alert alert-success" hidden="hidden" id="responseMessageRating">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.
                                        </span>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157
                                    </div>
                                    <g:if test="${session.user}">
                                        <div class="row" style="padding-bottom:15px">
                                            <div class="col-xs-4"></div>
                                            <div class="rateyo-readonly-widg jq-ry-container" style="margin-left: 145px;"></div>
                                            %{--<form name="ratingForm" class="form-horizontal">--}%
                                                %{--<div class="col-xs-4">--}%
                                                    %{--<g:select--}%
                                                            %{--value="${linksharing.ResourceRating.findByUserAndResource(session.user, resource)}"--}%
                                                            %{--name="rating" from="${0..5}" class="form-control"/>--}%
                                                %{--</div>--}%
                                                %{--<g:hiddenField name="id" value="${resource.id}"/>--}%
                                                %{--<div class="col-xs-4">--}%
                                                    %{--<input name="vote" id="vote" type="button" value="Vote"--}%
                                                           %{--class="btn btn-success"/>--}%
                                                %{--</div>--}%
                                            %{--</form>--}%
                                        </div>

                                        <div class="row">
                                            <div class="alert alert-success" hidden="hidden" id="responseMessageRating">
                                                <a href="#" id="alertDismiss" class="close" aria-label="close">&times;</a>
                                                <span class="visibilityText"><strong>Success!</strong> Indicates a successful or positive action.
                                                </span>
                                            </div>
                                        </div>
                                    </g:if>
                                    <p style="padding-bottom:5px">${resource?.description}</p>
                                </div>
<<<<<<< HEAD


                                <div class="row">
                                    <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                                    <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                                    <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                                    <div class="col-xs-2"></div>
=======
                            </g:if>
                            <p style="padding-bottom:10px">${resource?.description}</p>
                        </div>


                        <div class="row">
                            <div class="col-xs-2 fb-share-button"
                                 data-href="${request.requestURL.toString()}" data-layout="button"></div>

                            <div class="col-xs-2">
                                <a href="https://twitter.com/share" class="twitter-share-button"
                                   data-text="This post is quite usefull. Visit ${request.requestURL.toString()}" data-hashtags="linksharing">Tweet</a>
                                <script>!function (d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                                    if (!d.getElementById(id)) {
                                        js = d.createElement(s);
                                        js.id = id;
                                        js.src = p + '://platform.twitter.com/widgets.js';
                                        fjs.parentNode.insertBefore(js, fjs);
                                    }
                                }(document, 'script', 'twitter-wjs');</script>
                            </div>

                            <div class="col-xs-2">
                                <!-- Place this tag where you want the share button to render. -->
                                <div class="g-plus" data-action="share" data-annotation="none"
                                     data-href="${serverUrl}/resource/show/${resource.id}"></div>

                                <!-- Place this tag after the last share tag. -->
                                <script type="text/javascript">
                                    (function () {
                                        var po = document.createElement('script');
                                        po.type = 'text/javascript';
                                        po.async = true;
                                        po.src = 'https://apis.google.com/js/platform.js';
                                        var s = document.getElementsByTagName('script')[0];
                                        s.parentNode.insertBefore(po, s);
                                    })();
                                </script>
                            </div>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157

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

<<<<<<< HEAD
            <div class="row">
                <g:if test="${session.user && session.user.admin}">

                    <div class="col-xs-6">
                        <g:render template="editResource" model="[description: resource.description, id: resource.id]"/>
                    </div>

                </g:if>
            </div>
        </div>
        <asset:javascript src="jquery.rateyo.min.js"/>
        <script>
        console.log(${rating});
        $(".rateyo-readonly-widg").rateYo({
            rating: ${rating},
            halfStar: true,
            starWidth: "25px",
            onSet: function (score,rateYoInstance) {
                $.ajax({
                    url: "/resourceRating/saveRating",
                    data: {"id": $("#id").val(), "rating": score},
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
            }
        });
        $("#alertDismiss").click(function(){
            $("#responseMessageRating").fadeOut();
        });
        </script>
    </section>
</div>
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
</footer>
=======
    <div class="row">
        <g:if test="${session.user && session.user.admin}">

            <div class="col-xs-6">
                <g:render template="editResource" model="[description: resource.description, id: resource.id]"/>
            </div>

        </g:if>
    </div>
</div>
<script>
    $("#vote").click(function () {
        $.ajax({
            url: "/resourceRating/saveRating",
            data: {"id": $("#id").val(), "rating": $("#rating").val()},
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
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157
</body>
</html>