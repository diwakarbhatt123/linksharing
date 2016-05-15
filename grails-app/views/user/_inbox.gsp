<div class="box box-warning">
    <div class="box-header with-border">
        <strong class="box-title">Inbox</strong>

        <div class="box-tools pull-right">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
        </div>
    </div>

    <div class="box-body">
        <div id="inbox-scrollable">
            <g:if test="${unreadPosts.isEmpty()}">
                <p>No Unread Items</p>
            </g:if>
            <g:else>
                <g:each in="${unreadPosts}" var="post">
                    <div>
                        <div class="row">
                            <div class="col-xs-2">
                                <g:if test="${post.createdBy.imagePath}">
                                    <img src='${createLink(controller: "user", action: "renderFromDirectory", id: "${session.user.id}")}' style="width:80px;" class='img-circle' alt='User Image'>
                                </g:if>
                                <g:else>
                                    <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
                                </g:else>
                            </div>

                            <div class="col-xs-10">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <span class="h5">${post.createdBy.fullName}</span>
                                        <small class="text-muted"><g:link controller="user" action="userProfile" params="${[username:post.createdBy.username]}">@${post.createdBy.username}</g:link></small>
                                    </div>

                                    <div class="col-xs-3">
                                    </div>

                                    <div class="col-xs-3">
                                        <g:link controller="topic" action="show"
                                                id="${post.topic.id}"
                                                class="text-left">${post.topic.name}</g:link>
                                    </div>
                                </div>

                                <p>${post.description}</p>
                            </div>
                        </div>

<<<<<<< HEAD
                        <div class="row" style="padding-bottom:10px;padding-top:5px">
                            <div class="col-xs-1 fa fa-facebook-official"></div>

                            <div class="col-xs-1 fa fa-twitter"></div>

                            <div class="col-xs-1 fa fa-google-plus"></div>
                            <ls:documentOrLink resourceId="${post.id}"/>
                            <div class="col-xs-3"><p class="text-nowrap"><ls:isRead resourceId="${post.id}"/></p></div>
=======
                    <div class="row" style="padding-bottom:10px;padding-top:5px">
                        %{--<div class="col-xs-1 fa fa-facebook-official"></div>--}%

                        %{--<div class="col-xs-1 fa fa-twitter"></div>--}%

                        %{--<div class="col-xs-1 fa fa-google-plus"></div>--}%
                        <div class="col-xs-2 fb-share-button"
                             data-href="http://www.linksharing.com/resource/show/${post.id}" data-layout="button"></div>
                        <script>
                            (function(d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=982776161775775";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));

                        </script>

                        <div class="col-xs-2">
                            <a href="https://twitter.com/share" class="twitter-share-button"
                               data-text="This post is quite usefull.Visit!!" data-url="http://www.linksharing.com/resource/show/${post.id}" data-hashtags="linksharing">Tweet</a>
                            <script>!function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                                if (!d.getElementById(id)) {
                                    js = d.createElement(s);
                                    js.id = id;
                                    js.src = p + '://platform.twitter.com/widgets.js';
                                    fjs.parentNode.insertBefore(js, fjs);
                                }
                            }(document, 'script', 'twitter-wjs');</script>
                        </div>

                        <div class="col-xs-2">
                            <!-- Place this tag where you want the share button to render. -->
                            <div class="g-plus" data-action="share" data-annotation="none"
                                 data-href="http://www.linksharing.com/resource/show/${post.id}"></div>

                            <!-- Place this tag after the last share tag. -->
                            <script type="text/javascript">
                                (function () {
                                    var po = document.createElement('script');
                                    po.type = 'text/javascript';
                                    po.async = true;
                                    po.src = 'https://apis.google.com/js/platform.js';
                                    var s = document.getElementsByTagName('script')[0];
                                    s.parentNode.insertBefore(po, s);
                                })();
                            </script>
                        </div>
                        <ls:documentOrLink resourceId="${post.id}"/>
                        <div class="col-xs-3"><p class="text-nowrap"><ls:isRead resourceId="${post.id}"/></p></div>
>>>>>>> bd373b2f550e42a7ecaf10cc8e86241ba9b8d157

                            <div class="col-xs-2"><p><g:link controller="resource" action="show" class="text-nowrap"
                                                             id="${post.id}">View Post</g:link></p></div>
                        </div>
                    </div>
                </g:each>
            </g:else>
        </div>
    </div>
</div>
<script>
    $("#inbox-scrollable").slimScroll({
        height : '326px'
    });
</script>
