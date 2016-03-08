<%@ page import="linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="main" name="layout">
    <title>LinkSharing</title>
</head>

<body>
<!-- Navigation Bar -->
<!-- ********************************************************* -->

<!-- Row 1 -->
<!-- *************************************************** -->
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <!-- Recent Shares -->
            <!-- ************************************************** -->
            <g:render template="recentshares" model="${[recentPosts:recentPosts]}"/>
        </div>
        <div class="col-xs-6">
            <!-- Login Panel -->
            <!-- ************************************************ -->
            <g:render template="login"/>
            </div>
        </div>
    <!-- Row 2 -->
    <div class="row">
        <div class="col-xs-6">
            <!-- Top Posts Panel-->
            <!-- ************************************************************ -->
        <ls:topPosts/>
         </div>

        <div class="col-xs-6">
            <!-- Register Panel -->
            <!-- ************************************************************ -->
            <g:render template="register"/>
        </div>
    </div>
</div>
</body>
</html>