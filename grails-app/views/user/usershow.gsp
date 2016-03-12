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
<table class="table">
    <thead>
    <tr>
        <th>#</th>
        <th>Username</th>
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Active</th>
        <th>Manage</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstname}</td>
            <td>${user.lastname}</td>
            <td>
                <g:if test="${user.active}">
                    Yes
                </g:if>
                <g:else>
                    NO
                </g:else>
            </td>
            <td><g:if test="${user.active}">
                <a href="#">Deactivate</a>
            </g:if>
                <g:else>
                    <a href="#">Activate</a>
                </g:else></td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>