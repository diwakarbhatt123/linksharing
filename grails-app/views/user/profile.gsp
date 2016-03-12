<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 12/3/16
  Time: 10:25 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>${session.user.fullName}</title>
</head>

<body>
<!-- Navigation Bar -->
<!-- ********************************************************* -->
<!-- Name Panel -->
<!--****************************************************************-->
<!-- Row 1 -->
<!-- *************************************************** -->
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <!-- Name Panel -->
            <!-- ************************************************** -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div>
                        <div class="col-xs-2">
                            <g:if test="${linksharing.User.read(session.user.id).imagePath}">
                                <ls:userImage userId="${session.user.id}"/>
                            </g:if>
                            <g:else>
                                <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                            </g:else>
                        </div>

                        <div class="col-xs-1"></div>

                        <div class="col-xs-9">
                            <span class="h3"><strong>${session.user.fullName}</strong></span>

                            <div class="row">
                                <div class="col-xs-6">
                                    <small class="text-muted" style="font-size:15px">@${session.user.username}</small>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4 text-muted">Subcription</div>

                                <div class="col-xs-6 text-muted">Topics</div>
                            </div>

                            <div class="row">
                                <div class="col-xs-4 text-primary"><p class="text-info"><ls:subscriptionCount
                                        user="${session.user}"/></p></div>

                                <div class="col-xs-6 text-primary"><p class="text-info"><ls:topicCount
                                        user="${session.user}"/></p></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xs-6">
            <!-- Inbox Panel -->
            <!-- ************************************************ -->
            <g:render template="updateProfile"/>
        </div>
    </div>
    <!-- Row 2 -->
    <div class="row">
        <div class="col-xs-6" id="createdTopicSection">
            <!-- Subscription Panel-->
            <!-- ************************************************************ -->

        </div>

        <div class="col-xs-6">
            <!-- Inbox Panel -->
            <!-- ************************************************ -->
            <g:render template="updatePassword"/>
        </div>
    </div>
</div>
<script>
 loadCreatedTopics();
</script>
</body>
</html>