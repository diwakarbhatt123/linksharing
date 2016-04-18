<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
    <meta content="main" name="layout">
    <asset:javascript src="bootstrap-datepicker.js"/>
    <asset:stylesheet src="datepicker3.css"/>
</head>

<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Dashboard
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3><ls:subscriptionCount user="${session.user}"/></h3>

                            <p>Subscription</p>
                        </div>

                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3><ls:topicCount user="${session.user}"/></h3>

                            <p>Topics Created</p>
                        </div>

                        <div class="icon">
                            <i class="ion ion-android-document"></i>
                        </div>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner">
                            <h3><ls:resourceCount user="${session.user}"/></h3>

                            <p>Posts</p>
                        </div>

                        <div class="icon">
                            <i class="ion ion-compose"></i>
                        </div>
                    </div>
                </div><!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner">
                            <h3><ls:readingItemCount user="${session.user}"/></h3>

                            <p>Reading Items</p>
                        </div>

                        <div class="icon">
                            <i class="ion ion-ios-book"></i>
                        </div>
                    </div>
                </div><!-- ./col -->
            </div>

            <div class="row">
                <div class="col-xs-6">
                    <div class="row">
                        <div class="col-xs-12" id="inboxSection">
                            <!-- Inbox Panel -->
                            <!-- ************************************************ -->
                            %{--<g:render template="inbox"/>--}%
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12" id="subscriptionPanel">
                            <!-- Subscription Panel-->
                            <!-- ************************************************************ -->

                        </div>
                    </div>
                </div>
                <!-- Row 2 -->
                <div class="col-xs-6">
                    <div class="row">
                        <div class="box box-solid bg-green-gradient">
                            <div class="box-header">
                                <i class="fa fa-calendar"></i>

                                <h3 class="box-title">Calendar</h3>
                                <!-- tools box -->
                                <div class="pull-right box-tools">
                                    <!-- button with a dropdown -->
                                    <div class="btn-group">
                                        <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i
                                                class="fa fa-bars"></i></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="#">Add new event</a></li>
                                            <li><a href="#">Clear events</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">View calendar</a></li>
                                        </ul>
                                    </div>
                                    <button class="btn btn-success btn-sm" data-widget="collapse"><i
                                            class="fa fa-minus"></i></button>
                                    <button class="btn btn-success btn-sm" data-widget="remove"><i
                                            class="fa fa-times"></i></button>
                                </div><!-- /. tools -->
                            </div><!-- /.box-header -->
                            <div class="box-body no-padding">
                                <!--The calendar -->
                                <div id="calendar" style="width: 100%"></div>
                            </div><!-- /.box-body -->
                            <div class="box-footer text-black">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- Progress bars -->
                                        <div class="clearfix">
                                            <span class="pull-left">Task #1</span>
                                            <small class="pull-right">90%</small>
                                        </div>

                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                                        </div>

                                        <div class="clearfix">
                                            <span class="pull-left">Task #2</span>
                                            <small class="pull-right">70%</small>
                                        </div>

                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                                        </div>
                                    </div><!-- /.col -->
                                    <div class="col-sm-6">
                                        <div class="clearfix">
                                            <span class="pull-left">Task #3</span>
                                            <small class="pull-right">60%</small>
                                        </div>

                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                                        </div>

                                        <div class="clearfix">
                                            <span class="pull-left">Task #4</span>
                                            <small class="pull-right">40%</small>
                                        </div>

                                        <div class="progress xs">
                                            <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                                        </div>
                                    </div><!-- /.col -->
                                </div><!-- /.row -->
                            </div>
                        </div>
                    </div>

                    <div class="row">
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
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
</footer>
</body>
</html>
