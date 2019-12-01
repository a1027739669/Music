<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta name="keywords" content="音乐,QQ音乐,在线听歌,音乐下载,音乐播放器,音乐网站,MV,巅峰榜,音乐排行榜,翻译歌曲,热门歌曲,经典老歌,无损音乐,无损曲库">
    <meta name="description"
          content="QQ音乐是腾讯公司推出的一款网络音乐服务产品，海量音乐在线试听、新歌热歌在线首发、歌词翻译、手机铃声下载、高品质无损音乐试听、海量无损曲库、正版音乐下载、空间背景音乐设置、MV观看等，是互联网音乐播放和下载的优选。">
    <title>QQ音乐-千万正版音乐海量无损曲库新歌热歌天天畅听的高品质音乐平台！</title>
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">


    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var k = !0;

            $(".loginmask").css("opacity", 0.8);

            if ($.browser.version <= 6) {
                $('#reg_setp,.loginmask').height($(document).height());
            }

            $(".thirdlogin ul li:odd").css({marginRight: 0});

            $("#openlogin").click(function () {
                k && "0px" != $("#loginalert").css("top") && ($("#loginalert").show(), $(".loginmask").fadeIn(500), $("#loginalert").animate({top: 0}, 400, "easeOutQuart"))
            });

            $(".loginmask,.closealert").click(function () {
                k && (k = !1, $("#loginalert").animate({top: -600}, 400, "easeOutQuart", function () {
                    $("#loginalert").hide();
                    k = !0
                }), $(".loginmask").fadeOut(500))
            });


            $("#sigup_now,.reg a").click(function () {
                $("#reg_setp,#setp_quicklogin").show();
                $("#reg_setp").animate({left: 0}, 500, "easeOutQuart");
            });

            $(".back_setp").click(function () {
                "block" == $("#setp_quicklogin").css("display") && $("#reg_setp").animate({left: "100%"}, 500, "easeOutQuart", function () {
                    $("#reg_setp,#setp_quicklogin").hide()
                })
            });

        });
    </script>

    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css"
          tppabs="https://y.gtimg.cn/mediastyle/yqq/layout_0412.css?max_age=25920000&v=20190312"/>
    <link rel="stylesheet" href="/mediastyle/yqq/singer.css-max_age=25920000&v=20170503.css"
          tppabs="https://y.gtimg.cn/mediastyle/yqq/singer.css?max_age=25920000&v=20170503"/>

</head>

<body>

<!-- 头部 S -->
<header class="header">
    <div class="header-box">
        <h1 class="header-title">
            <a href="javascript:;"><img class="logo-img" src="/image/logo.png" alt="QQ音乐"></a>
            <#--                <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>-->
        </h1>
        <ul class="header-top-nav">
            <li class="top-nav-item active"><a href="#" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="音乐号">排行榜</a></li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="音乐号">分类歌单</a></li>


        </ul>
        <ul class="header-sec-nav">
            <li class="sec-nav-item active"><a href="#" class="nav-link">首页</a></li>
            <li class="sec-nav-item"><a href="#" class="nav-link">歌手</a></li>
            <li class="sec-nav-item"><a href="#" class="nav-link">专辑</a></li>
        </ul>
        <div class="header-search">
            <div class="search-input ">
                <input type="text" placeholder="搜索音乐、MV、歌单、用户">
                <button class="search-btn">
                    <i class="icon-search sprite"></i>
                </button>
            </div>
            <div class="search-box">
                <div class="search-hot">
                    <dl>
                        <dt>热门搜索</dt>
                        <dd>
                            <#list hotSearch as hot>
                                <a href="/guest/detail?songId=${hot.song_id}" class="hot-link">
                                    <span class="hot-num">${hot_index+1}</span>
                                    <span class="hot-name">${hot.song_name}</span>
                                    <span class="hot-people">${(hot.getInfo().info_search/10000) ? int}w</span>
                                </a>
                            </#list>
                        </dd>
                    </dl>
                </div>
                <div class="search-history">
                    <dl class="history-list">
                        <dt class="history-tit">搜索历史
                            <a href="javascript:;" class="history-clear">
                                <i class="icon-clear sprite"></i>
                            </a>
                        </dt>
                    </dl>
                </div>
            </div>
        </div>
        <div class="header-opt">
            <#if Session["user"] ? exists>
                <!-- 未登录 -->
                <span class="mod_top_login">
		    <a class="top_login__link js_logined" href="//y.qq.com/portal/profile.html#stat=y_new.top.user_pic"
               style=""><img id="userImg"
                             src="http://thirdqq.qlogo.cn/g?b=sdk&amp;k=ZbfpT8QjY6vdqW4ePRkkIg&amp;s=140&amp;t=1558784273"
                             class="top_login__cover js_user_img"></a>
                </span>
                <!-- 用户信息 -->
                <div class="popup_user">

                    <div class="popup_user_toolbar">
                        <!--绿钻-->
                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit"><a href="//y.qq.com/portal/vipportal/index.html"
                                                                    target="_blank" rel="noopener">绿钻豪华版</a>
                            </div>
                            <div class="popup_user_toolbar__desc c_tx_thin">

                                2019-12-03 到期

                            </div>
                            <a class="mod_btn_green popup_user_toolbar__btn_vip js_openvip" href="javascript:;"
                               data-aid="music.pc.20318.newyqqhover" data-stat="music.20318.btnclick.pc">续费</a>
                        </div>

                        <!--付费包-->

                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit js_msgcenterdiv"><a
                                        href="//y.qq.com/portal/msg_center.html#stat=y_new.top.pop.msg_center"
                                        onclick="setStatCookie&amp;&amp;setStatCookie();">评论通知</a>
                            </div>
                        </div>
                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit"><a href="javascript:;" class="js_logout"
                                                                    data-stat="y_new.top.pop.logout">退出QQ登录</a>
                            </div>
                        </div>

                    </div>
                </div>
            <#else >
                <a href="javascript:;" class="h-login" id="openlogin">登录</a>
                <div class="login-mark"></div>
            </#if>
        </div>
    </div>
</header>
<!--main content-->

<div class="loginmask"></div>

<div id="loginalert">

    <div class="pd20 loginpd">
        <h3><i class="closealert fr"></i>
            <div class="clear"></div>
        </h3>
        <div class="loginwrap">
            <div class="loginh">
                <div class="fl">会员登录</div>
                <div class="fr">还没有账号<a id="sigup_now" href="javascript:void(0);">立即注册</a></div>
            </div>
            <h3><span class="fl">手机登录</span><span class="login_warning" style="display:none">用户名或密码错误</span>
                <div class="clear"></div>
            </h3>
            <form id="login_form">
                <div class="logininput">
                    <input type="text" name="username" class="loginusername" value="" placeholder="手机/用户名"/>
                    <input type="password" name="password" class="loginuserpasswordt" value="" placeholder="密码"/>
                </div>
                <div class="loginbtn">
                    <div class="loginsubmit fl"><input type="button" value="登录" class="btn" id="submit"/></div>
                    <div class="fl" style="margin:26px 0 0 0;"><input id="bcdl" type="checkbox" checked="true"/>保持登录
                    </div>
                    <div class="fr" style="margin:26px 0 0 0;"><a href="http://www.jb51.net/">忘记密码?</a></div>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>

    <#--    <div class="thirdlogin">-->
    <#--        <div class="pd50">-->
    <#--            <h4>用第三方帐号直接登录</h4>-->
    <#--            <ul>-->
    <#--                <li id="sinal"><a href="http://www.jb51.net">微博帐号注册</a></li>-->
    <#--                <li id="qql"><a href="http://www.jb51.net">QQ帐号注册</a></li>-->
    <#--            </ul>-->
    <#--            <div class="clear"></div>-->
    <#--        </div>-->
    <#--    </div>-->

</div>
<div id="reg_setp">
    <div class="back_setp">返回</div>
    <div class="blogo"></div>
    <div id="setp_quicklogin">
        <h3>您可以选择以下第三方帐号直接登录代码笔记，一分钟完成注册</h3>
        <ul class="quicklogin_socical">
            <li class="quicklogin_socical_weibo"><a href="http://www.jb51.net">微博帐号注册</a></li>
            <li class="quicklogin_socical_qq" style="margin:0;"><a href="http://www.jb51.net">QQ帐号注册</a></li>
        </ul>
    </div>
    <!-- 会员注册 -->
    <div id='regist_container' style="display: none;">
        <div id="lab1">
            <span id="lab_login">会员注册</span>
            <span id="lab_toLogin">
						&emsp;已有账号&nbsp;
						<span id='toLogin' style="color: #EB9316;cursor: pointer;">立即登录</span>
					</span>
        </div>
        <div id="form_container2" style="padding-top: 25px;">

            <input type="text" class="form-control" value="admin"  placeholder="用户名" id="regist_account"/>
            <input type="password" class="form-control" placeholder="密码" id="regist_password1" />
            <input type="password" class="form-control" placeholder="确认密码" id="regist_password2" />
            <input type="text" class="form-control" placeholder="手机号" id="regist_phone" />
            <input type="text" class="form-control" placeholder="验证码" id="regist_vcode" />
            <!--<button id="getVCode" type="button" class="btn btn-success" >获取验证码</button>-->
            <input id="getVCode" type="button" class="btn btn-success" value="点击发送验证码" onclick="sendCode(this)" />

        </div>
        <input type="button" value="注册" class="btn btn-success" id="regist_btn" />
    </div>
</div>
<!-- 头部 E -->

<div class="main" id="main">

</div>


</body>
<script type="text/javascript">
    $(function () {
        toList(1,"全部","全部","全部");
    });
    function toList(page,coun,sex,label) {
        $.ajax({
            url: '/guest/singertable',
            type: 'GET',
            data: {
                'country':coun,
                'sex': sex,
                'label':label,
                'pageId':page,
            },
            success: function (data) {
                $("#main").empty();
                $("#main").append(data);
            }
        });
    }
</script>
</html>