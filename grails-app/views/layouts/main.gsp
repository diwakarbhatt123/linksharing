<%@ page import="linksharing.User" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" xmlns:z-index="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <asset:stylesheet href="bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <asset:stylesheet href="AdminLTE.min.css"/>
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <asset:stylesheet href="skins/skin-blue.min.css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- REQUIRED JS SCRIPTS -->
    <!-- jQuery 2.1.4 -->
    <asset:javascript src="jquery.min.js"/>
    <!-- Bootstrap 3.3.5 -->
    <asset:javascript src="bootstrap.min.js"/>
    <!-- AdminLTE App -->
    <asset:javascript src="app.min.js"/>
    <asset:javascript src="application.js"/>
    <!-- jQuery Validation -->
    <script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.js"></script>
    <!-- slim scroll -->
    <asset:javascript src="jquery.slimscroll.min.js"/>
    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <g:layoutHead/>
</head>

<body>
<!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
<body class="hold-transition skin-blue layout-top-nav sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="/" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>LS</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>LinkSharing</b></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown messages-menu">
                    <a class="glyphicon glyphicon-comment" style="color:white;font-size:30px; padding-top:14px;"
                       href="#" data-toggle="modal" data-target="#createtopic"></a></li>
                <!-- Notifications Menu -->
                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button -->
                    <a class="glyphicon glyphicon-envelope" style="color:white;font-size:30px; padding-top:14px;"
                       href="#" data-toggle="modal" data-target="#sendinvite"></a></li>
                    <!-- Tasks Menu -->
                    <li class="dropdown tasks-menu">
                    <a class="glyphicon glyphicon-link" style="color:white;font-size:30px; padding-top:14px;" href="#"
                       data-toggle="modal" data-target="#sharelink"></a></li>
                    <li class="dropdown tasks-menu">
                        <a class="glyphicon glyphicon-file" style="color:white;font-size:30px; padding-top:14px;" href="#"
                           data-toggle="modal" data-target="#sharedDocument"></a>
                    </li>
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                    <g:if test="${session.user.imagePath}">
                        <img src="/user/renderFromDirectory/${session.user.id}" class="img-circle" alt="User Image" style="float: left;
                        width: 25px;
                        height: 25px;
                        border-radius: 50%;
                        margin-right: 10px;
                        margin-top: -2px;">
                    </g:if>
                    <g:else>
                        <i class="glyphicon glyphicon-user"></i>
                    </g:else>
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">${session.user.fullName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                            <g:if test="${session.user.imagePath}">
                                <ls:userImage userId="${session.user.id}"/>
                            </g:if>
                            <g:else>
                                <i class="glyphicon glyphicon-user" style="font-size:100px;color: white;"></i>
                            </g:else>
                                <p>
                                    ${session.user.fullName}
                                    <small>Member since <g:formatDate date="${session.user.dateCreated}" format="MMM-yyyy"/></small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <g:link controller="login" action="logout" class="btn btn-default btn-flat">Sign out</g:link>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <g:if test="${session.user.imagePath}">
                        <ls:userImage userId="${session.user.id}"/>
                    </g:if>
                    <g:else>
                        <i class="glyphicon glyphicon-user" style="font-size:20px;color: white;padding-left:5px;"></i>
                    </g:else>
                </div>
                <div class="pull-left info">
                    <p>${session.user.fullName}</p>
                    %{--<!-- Status -->--}%
                    %{--<a href="#"><i class="fa fa-circle text-success"></i> Online</a>--}%
                </div>
            </div>

            <!-- search form (Optional) -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </form>
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="header">Menu</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="active"><a href="/"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                <li><a href="#"><i class="fa fa-th"></i> <span>Top Posts</span></a></li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-user"></i> <span>Profile</span> <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="#"><i class="fa fa-circle-o"></i>My Profile</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i>Account Setting</a></li>
                    </ul>
                </li>
            </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>
    <g:render template="/topic/create"/>
    <g:render template="/topic/email"/>
    <g:render template="/linkResource/create"/>
    <g:render template="/documentResource/create"/>
<g:layoutBody/>
</body>
</html>
