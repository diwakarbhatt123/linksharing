<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Subscribed Users</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <div class="row">
                <div class="col-xs-12">
                    <!-- Topic Panel -->
                    <!-- ************************************************** -->
                    <g:render template="topicnamepanel" model="[topic:topic]"/>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <!-- Subscription Panel-->
                    <!-- ************************************************************ -->
                    <g:render template="subscribers" model="${[subscribers: subscribedUsers, topicName: topic.name]}"/>
                </div>
            </div>
        </div>

        <div class="col-xs-6">
            <div class="col-xs-12">
                <!-- Topic Posts Panel -->
                <!-- ************************************************ -->
                <g:render template="resources" model="${[resources: topicResources, topicName: topic.name]}"/>
            </div>
        </div>
    </div>
</div>
<script>
$("#postSearch").keyup(function(){
   $("#postsSection").load("/topic/postSearch",{"id":${topic.id},"q":$("#postSearch").val()})
});
</script>
</body>
</html>