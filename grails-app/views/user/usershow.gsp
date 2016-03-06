<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 6/3/16
  Time: 11:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Users</title>
</head>

<body>
<g:render template="show" model="${[users:userList]}"/>
</body>
</html>