<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:javascript src="application.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:stylesheet href="bootstrap.css"/>
    %{--<asset:stylesheet href="font-awesome.min.css"/>--}%
    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <g:link class="navbar-brand " controller="user" action="index">Link Sharing</g:link>
        </div>
        <!-- Search Bar -->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <g:form controller="resource" action="search" class="navbar-form">
                    <div class="input-group">
                        <g:textField type="text" class="form-control" placeholder="Search" name="q" id="srch-term"/>
                        <div class="input-group-btn">
                            <g:submitButton name="searchsubmit" class="btn btn-default" type="submit" value="Search"/>
                        </div>
                    </div>
                </g:form>
            </li>
            <g:if test="${session.user}">
                <li><a class="glyphicon glyphicon-comment" style="color:white;font-size:30px; padding-top:14px;"
                       href="#" data-toggle="modal" data-target="#createtopic"></a></li>
                <g:render template="/topic/create"/>
                <li><a class="glyphicon glyphicon-envelope" style="color:white;font-size:30px; padding-top:14px;"
                       href="#" data-toggle="modal" data-target="#sendinvite"></a></li>
                <g:render template="/topic/email"/>
                <li><a class="glyphicon glyphicon-link" style="color:white;font-size:30px; padding-top:14px;" href="#"
                       data-toggle="modal" data-target="#sharelink"></a></li>
                <g:render template="/linkResource/create"/>
                <li>
                    <a class="glyphicon glyphicon-file" style="color:white;font-size:30px; padding-top:14px;" href="#"
                       data-toggle="modal" data-target="#xyz"></a>
                </li>
                <g:render template="/documentResource/create"/>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">${session.user}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Profile</a></li>
                        <li class="divider"></li>
                        <g:if test="${session.user.admin}">
                            <li><g:link controller="user" action="usershow">Users</g:link></li>
                            <li class="divider"></li>
                        </g:if>
                        <li><g:link controller="login" action="logout">Logout</g:link></li>
                    </ul>
                </li>
            </g:if>
        </ul>
    </div>
</nav>
<g:layoutBody/>
</body>
</html>
