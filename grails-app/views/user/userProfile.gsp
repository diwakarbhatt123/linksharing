<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 14/5/16
  Time: 7:39 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>${user.fullName}'s Profile</title>
</head>
<body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            User Profile
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-3">

                <!-- Profile Image -->
                <div class="box box-primary">
                <div class="box-body box-profile">
                %{--<img class="profile-user-img img-responsive img-circle" src="../../dist/img/user4-128x128.jpg" alt="User profile picture">--}%
                    <g:if test="${user.imagePath}">
                        <img src="${createLink(controller: "user", action: "renderFromDirectory", id: "${user.id}")}" class='profile-user-img img-responsive img-circle' alt='User profile picture'>
                        </g:if>
                        <g:else>
                            <i class="glyphicon glyphicon-user" style="font-size:60px;color: black;padding-right: inherit;"></i>
                        </g:else>
                        <span class="profile-username text-center">${user.fullName}</span>
                        <p class="text-muted text-center">@${user.username}</p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>Topics</b> <a class="pull-right"><ls:topicCount user="${user}"/></a>
                            </li>
                            <li class="list-group-item">
                                <b>Posts</b> <a class="pull-right"><ls:resourceCount user="${user}"/></a>
                            </li>
                            <li class="list-group-item">
                                <b>Subscriptions</b> <a class="pull-right"><ls:subscriptionCount user="${user}"/></a>
                            </li>
                        </ul>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->

            <!-- About Me Box -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">About Me</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <strong><i class="fa fa-envelope margin-r-5"></i>Email</strong>
                        <p class="text-muted">
                            ${user.email}
                        </p>

                        <hr>

                        <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>
                        <p class="text-muted">${user.city}, ${user.country}</p>

                        <hr>

                        <strong><i class="fa fa-pencil margin-r-5"></i> Topics</strong>
                        <p>
                            <g:each in="${topic}" var="createdTopic">
                            <span class="label label-success">${createdTopic.name}</span>
                            </g:each>
                        </p>

                        <hr>

                        <strong><i class="fa fa-file-text-o margin-r-5"></i> Bio</strong>
                        <p>${user.bio}</p>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-md-1"></div>
            <div class="col-md-8" id="createdPostsSection">
                %{--<g:render template=""--}%
            </div><!-- /.col -->
        </div><!-- /.row -->

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script>
    loadCreatedPosts(${user.id});
</script>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 2.3.0
    </div>
    <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
</footer>
</body>
</html>