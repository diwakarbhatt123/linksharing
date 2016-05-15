<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>${topic.name}</title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            ${topic.name}
        </h1>
    </section>
    <section class="content">
        <div class="container">
            <div class="row">
<<<<<<< HEAD
                <div class="col-xs-6">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Topic Panel -->
                            <!-- ************************************************** -->
                            <g:render template="topicnamepanel" model="[topic: topic]"/>
                        </div>
                    </div>
=======
                <div class="col-xs-12" id="topicNameSection">
                    <!-- Topic Panel -->
                    <!-- ************************************************** -->
                    <g:render template="topicnamepanel" model="[topic:topic]"/>
                </div>
            </div>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Subscription Panel-->
                            <!-- ************************************************************ -->
                            <g:render template="subscribers"
                                      model="${[subscribers: subscribedUsers, topicName: topic.name]}"/>
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
            $("#postSearch").keyup(function () {
                $("#postsSection").load("/topic/postSearch", {"id":${topic.id}, "q": $("#postSearch").val()})
            });
        </script>
    </section>
</div>
<<<<<<< HEAD
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
</footer>

=======
<script>
// loadTopicNamePanel(topic.id);
$("#postSearch").keyup(function(){
   $("#postsSection").load("/topic/postSearch",{"id":${topic.id},"q":$("#postSearch").val()})
});
</script>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157
</body>
</html>