<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 6/3/16
  Time: 11:36 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Subscribed Users</title>
</head>

<body>
<g:render template="/user/show" model="${[users:subscribedUsers]}"/>
</body>
</html>