<%@ page import="linksharing.Resource" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout">
    <title>Search</title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header">
        <h1>
            Search
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-6">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- Topic Panel -->
                        <!-- ************************************************** -->
                        <g:render template="/user/trendingtopics"
                                  model="${[trendingTopics: linksharing.Topic.trendingTopic]}"/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <!-- Subscription Panel-->
                        <!-- ************************************************************ -->
                        <g:render template="/login/toppost" model="${[topPosts: linksharing.Resource.topPosts()]}"/>
                    </div>
                </div>
            </div>

            <div class="col-xs-6">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-warning">
                            <div class="box-header with-border">
                                <strong class="box-title">Search for "${query}"</strong>

                                 <div class="box-tools pull-right">
                                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                                 </div>
                            </div>
                            <div class="box-body">
                                <div id="search-Scrollable">
                                    <g:if test="${searchResources?.empty}">
                                        <p>No Result Found</p>
                                    </g:if>
                                    <g:else>
                                        <g:each in="${searchResources}" var="resource">
                                            <div>
                                                <div class="col-xs-2">
                                                    <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                                                </div>

                                                <div class="col-xs-10">
                                                    <div class="row">
                                                        <div class="col-xs-6">
                                                            <span class="h5">${resource.createdBy.fullName}</span>
                                                            <small class="text-muted">@${resource.createdBy.username}</small>
                                                        </div>

                                                        <div class="col-xs-3">
                                                        </div>

                                                        <div class="col-xs-3">
                                                            <a href="#" class="text-left">${resource.topic.name}</a>
                                                        </div>
                                                    </div>

                                                    <p>${resource.description}</p>

                                                    <div class="row">
                                                        <div class="col-xs-1 fa fa-facebook-official"></div>

                                                        <div class="col-xs-1 fa fa-twitter"></div>

                                                        <div class="col-xs-1 fa fa-google-plus"></div>

                                                        <div class="col-xs-2"><small><a href="#">Download</a></small>
                                                        </div>

                                                        <div class="col-xs-3"><small><a href="#">View Full Site</a>
                                                        </small>
                                                        </div>

                                                        <div class="col-xs-2"><small><a href="#">Mark as Read</a>
                                                        </small>
                                                        </div>

                                                        <div class="col-xs-2"><small><a href="#">View Post</a></small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </g:each>
                                    </g:else>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    $("#search-Scrollable").slimScroll({
        height: '326px'
    });
</script>
</body>
</html>