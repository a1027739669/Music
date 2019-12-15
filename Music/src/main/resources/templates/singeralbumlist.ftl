<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript"  src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta name="applicable-device" content="pc">
    <title>专辑库</title>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <script src="/bin/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/album.css-max_age=2592000&v=20160831.css">
    <link rel="stylesheet" href="/mediastyle/yqq/popup_login.css?max_age=25920000">
    <style type="text/css">.emojicon-m {
            min-height: 1em !important;
            min-width: 1em !important;
            max-height: 1em !important;
            max-width: 1em !important;
            vertical-align: middle !important;
            float: none !important;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: contain;
            display: inline-block;
        }</style>
    <link rel="stylesheet" type="text/css"
          href="/mediastyle/yqq/qb-ie-remind.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">
    <script src="/js/jquery.min.js"></script>
</head>
<body class="page_album_all os_mac">
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
            <li class="sec-nav-item"><a href="/guest/singerlist" class="nav-link">歌手</a></li>
            <li class="sec-nav-item"><a href="/guest/albumlist" class="nav-link">专辑</a></li>
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
                                <a href="/guest/detail?songId=${hot.songId}" class="hot-link">
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


<div class="mod_loading" id="before_page" style="display: none;"><i class="icon_txt">加载中</i></div>
<div class="main" style="" id="main">
    <!-- 标签筛选 -->



    <div class="part_detail__hd">
        <h2 class="part_detail__tit">${singer.singerName}的所有专辑</h2>
    </div>
    <div class="mod_part_detail" id="allalbum">
        <#if albumlist? exists>
            <div class="mod_playlist mod_playlist--all">
                <ul class="playlist__list" id="album_list">
                    <#list albumlist as album>
                        <li class="playlist__item"
                            onmouseover="this.className=(this.className+' playlist__item--hover')"
                            onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                            <div class="playlist__item_box">
                                <div class="playlist__cover mod_cover" style="visibility: visible;">
                                    <a class="js_album" onclick="playAllAlbum(${album.albumId})"
                                       data-stat="y_new.album_lib.album_pic">
                                        <img src="/upload/${album.album_img}"
                                             alt="此情此景" class="playlist__pic"
                                             style="display: block; visibility: visible;">
                                        <i class="mod_cover__icon_play js_play"
                                           data-stat="y_new.album_lib.album_play"></i>
                                    </a>
                                </div>
                                <h4 class="playlist__title">
			<span class="playlist__title_txt">
				<a href="/guest/albumDetail?albumId=${album.albumId}"
                   onclick="" class="js_album"
                   data-stat="y_new.album_lib.album_name" data-albummid="002rmKH83FOcnD"
                   title="此情此景">${album.albumName}</a>
			</span>
                                </h4>
                                <div class="playlist__author" title="李佳璐">


                                    <#--                    <a href="" class="js_singer"-->
                                    <#--                       data-singermid="000kIeH91GinlQ">${album.getSinger().singerName}</a>-->


                                </div>
                                <div class="playlist__other">
                                    ${album.album_release}
                                </div>
                            </div>
                        </li>
                    </#list>
                </ul>
            </div>
        <#else >
            <div class="none_txt">
                <i class="none_txt__symbol"></i>
                <p>什么都没有</p>
            </div>
        </#if>
    </div>
</div>
<#include "footer.ftl">
</body>

</html>