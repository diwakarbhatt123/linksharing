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
    <script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.js"></script>
    <asset:javascript src="jquery.form.js"/>
    <title>${session.user.fullName}</title>
</head>

<body>
<!-- Navigation Bar -->
<!-- ********************************************************* -->
<!-- Name Panel -->
<!--****************************************************************-->
<!-- Row 1 -->
<!-- *************************************************** -->
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Profile Settings
        </h1>
    </section>
<section class="content">
<div class="container">
    <div class="row">
        <div class="col-xs-6">
        <div class="row">
            <div class="col-xs-12">
                <!-- Name Panel -->
                <!-- ************************************************** -->
                <div class="box box-warning">
                    <div class="box-body">
                        <div>
                            <div class="col-xs-2">
                                <g:if test="${linksharing.User.read(session.user.id).imagePath}">
                                    <img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${session.user.id}")}' style="width: 100px;" class='img-circle' alt='User Image'>
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
                                        <small class="text-muted"
                                               style="font-size:15px">@${session.user.username}</small>
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
            </div>
           <div class="row">
               <div class="col-xs-12" id="createdTopicSection">
                   <!-- Subscription Panel-->
                   <!-- ************************************************************ -->
               </div>
           </div>
        </div>
        <div class="col-xs-6"><!-- Row 2 -->
        <div class="row">
            <div class="col-xs-12">
                <!-- Inbox Panel -->
                <!-- ************************************************ -->
                <g:render template="updateProfile"/>
            </div>
        </div>
            <div class="row">
            <div class="col-xs-12">
                <!-- Inbox Panel -->
                <!-- ************************************************ -->
                <g:render template="updatePassword"/>
            </div>
            </div>
        </div>
        </div>
    </div>
</section>
</div>
<script>
    loadCreatedTopics();
</script>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 2.3.0
    </div>
    <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
</footer>
</body>
</html>