<%@ page import="linksharing.Topic; linksharing.Subscription; linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>${session.user}'s Dashboard</title>
</head>

<body>
<div class="container">
    <div class="row">
    <div class="col-xs-6">
     <div class="row" >
         <div class="col-xs-12">
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

                         <div class="col-xs-10">
                             <span class="h5"><strong>${session.user.fullName}</strong></span>
                             <small class="text-muted">@${session.user.username}</small>

                             <div class="row"><div class="col-xs-12"></div></div>

                             <div class="row">
                                 <div class="col-xs-4 text-muted">Subcriptions</div>

                                 <div class="col-xs-6 text-muted">Topics</div>
                             </div>

                             <div class="row">
                                 <div class="col-xs-4 text-primary"><ls:subscriptionCount user="${session.user}"/></div>

                                 <div class="col-xs-6 text-primary"><ls:topicCount user="${session.user}"/></div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <div class="row" >
         <div class="col-xs-12" id="subscriptionPanel">
             <!-- Subscription Panel-->
             <!-- ************************************************************ -->

         </div>
     </div>
    </div>
    <!-- Row 2 -->
        <div class="col-xs-6">
        <div class="row" >
            <div class="col-xs-12" id="inboxSection">
            <!-- Inbox Panel -->
            <!-- ************************************************ -->
            %{--<g:render template="inbox"/>--}%
        </div>
        </div>
        <div class="row" >
            <div class="col-xs-12" id="trendingTopicsSection">
                <!-- Subscription Panel-->
                <!-- ************************************************************ -->
                %{--<ls:trendingTopics/>--}%
            </div>
        </div>
    </div>
    </div>
</div>
<script>
    loadTrendingTopics();
    loadInbox();
    loadSubscription();
</script>
</body>
</html>