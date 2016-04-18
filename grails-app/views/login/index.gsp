<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LinkSharing</title>
    <!-- jQuery -->
    <asset:javascript src="jquery.js"/>
    <!-- jQuery Validation -->
    <script type="text/javascript" src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.js"></script>
    <!-- Bootstrap Core CSS -->
    <asset:stylesheet href="bootstrap.min.css"/>

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
          rel='stylesheet' type='text/css'>
    %{--<asset:link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css"/>--}%
    <style rel="stylesheet" href="/assets/fonts/font-awesome/css/font-awesome.min.css"></style>
    <!-- Plugin CSS -->
    <asset:stylesheet href="animate.min.css"/>


    <!-- Custom CSS -->
    <asset:stylesheet href="creative.css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>

    </style>
</head>

<body id="page-top">

<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">LinkSharing</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="#login">Login</a>
                </li>
                <li>
                    <a class="page-scroll" href="#signup">SignUp</a>
                </li>
                <li>
                    <a class="page-scroll" href="#trending">What's Trending?</a>
                </li>
                <li>
                    <a class="page-scroll" href="#contact">Contact Us</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<header>
    <div class="header-content">
        <div class="header-content-inner">
            <h1>Your Favorite Source of Free Bootstrap Themes</h1>
            <hr>

            <p>Start Bootstrap can help you build better websites using the Bootstrap CSS framework! Just download your template and start going, no strings attached!</p>
            <a href="#signup" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
        </div>
    </div>
</header>

<section class="bg-primary" id="login">
    <g:render template="login"/>
</section>

<section id="signup">
    <g:render template="register"/>
</section>

<section class="no-padding" id="trending">
    <div class="container-fluid">
        <div class="row no-gutter">
            <g:set var="pic" value="${1}"/>
            <g:each in="${linksharing.Topic.trendingTopic}" var="topic">
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <g:img src="portfolio/${pic++}.jpg" class="img-responsive"/>

                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    @${topic.createdBy.username}
                                </div>

                                <div class="project-name">
                                    ${topic.name}
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </g:each>
        </div>
    </div>
</section>

<aside class="bg-dark">
    <div class="container text-center">
        <div class="call-to-action">
            <h2>Join in the Trend!</h2>
            <a href="#signup" class="btn btn-default btn-xl wow tada page-scroll">Sign Up Now!</a>
        </div>
    </div>
</aside>

<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">Let's Get In Touch!</h2>
                <hr class="primary">

                <p>Have a query or a Feedback? Shoot us a Mail!</p>
            </div>

            <div class="col-lg-12 text-center">
                <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>

                <p><a href="mailto:diwakarbhatt68@gmail.com">diwakarbhatt68@gmail.com</a></p>
            </div>
        </div>
    </div>
</section>
<!-- Bootstrap Core JavaScript -->
<asset:javascript src="bootstrap.min.js"/>
<!-- Plugin JavaScript -->
<asset:javascript src="wow.min.js"/>
<asset:javascript src="jquery.fittext.js"/>
<asset:javascript src="jquery.easing.min.js"/>
<!-- Custom Theme JavaScript -->
<asset:javascript src="creative.js"/>
</body>

</html>
