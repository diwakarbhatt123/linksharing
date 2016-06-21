<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
    <meta content="main" name="layout">
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
                        <div id="datepicker" style="
                        font-size: 28px;
                        padding-bottom: 20px;
                        padding-left: 50px;
                        "></div>
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
            $( "#datepicker" ).datepicker({
             autoSize: true
            });
        </script>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
