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
    <title>我的音乐</title>
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">


    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
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
    <link rel="stylesheet" href="/mediastyle/yqq/song_detail.css-max_age=2592000&v=20180803.css"
          tppabs="https://y.gtimg.cn/mediastyle/yqq/song_detail.css?max_age=2592000&v=20180803"/>


</head>
<body class="os_mac">
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
                            <#if Session['hotSearch'] ? exists>
                                <#list Session['hotSearch'] as hot>
                                    <a href="/guest/songDetail?songId=${hot.song_id}&pageId=1" class="hot-link">
                                        <span class="hot-num">${hot_index+1}</span>
                                        <span class="hot-name">${hot.song_name}</span>
                                        <span class="hot-people">${hot.getInfo().info_search/10000 ? int}w</span>
                                    </a>
                                </#list>
                            </#if>
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

            <input type="text" class="form-control" value="admin" placeholder="用户名" id="regist_account"/>
            <input type="password" class="form-control" placeholder="密码" id="regist_password1"/>
            <input type="password" class="form-control" placeholder="确认密码" id="regist_password2"/>
            <input type="text" class="form-control" placeholder="手机号" id="regist_phone"/>
            <input type="text" class="form-control" placeholder="验证码" id="regist_vcode"/>
            <!--<button id="getVCode" type="button" class="btn btn-success" >获取验证码</button>-->
            <input id="getVCode" type="button" class="btn btn-success" value="点击发送验证码" onclick="sendCode(this)"/>

        </div>
        <input type="button" value="注册" class="btn btn-success" id="regist_btn"/>
    </div>
</div>
<!-- 头部 E -->

<div class="main">
    <div class="mod_data" itemscope="" style="display:block;">
		    <span class="data__cover">

				<img src="/upload/${song.song_img}"
                     alt="重生" class="data__photo">

		    </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" title="${song.song_name}">${song.song_name}</h1>
            </div>


            <div class="data__singer" title="${song.getSinger().singerName}">
                <i class="icon_singer sprite"></i>


                <a href="//y.qq.com/n/yqq/singer/002nXp292LIOGV.html" data-mid="002nXp292LIOGV"
                   title="${song.getSinger().singerName}"
                   class="data__singer_txt js_singer" data-stat="y_new.song.header.singername" itemprop="byArtist">
                    ${song.getSinger().singerName} </a>


            </div>

            <ul class="data__info">

                <li class="data_info__item data_info__item--even">专辑：<a
                            href="//y.qq.com/n/yqq/album/001ag9vZ3zT8OM.html" itemprop="inAlbum" class="js_album"
                            data-stat="y_new.song.header.albumname" data-albummid="001ag9vZ3zT8OM"
                            data-albumid="9045596" title="你的答案">${song.getAlbum().album_name}</a></li>

                <li class="data_info__item js_lan" style="">语种：${song.song_languages}</li>
                <li class="data_info__item js_genre data_info__item--even" style="">标签：
                    <#list song.songLabel ? split(',') as label>${label},</#list></li>




                <li class="data_info__item js_public_time data_info__item--even" style="">上传时间：${song.song_release}</li>



            </ul>
            <div class="data__actions" role="toolbar">
                <a href="/guest/playSong?id=${song.song_id}" class="mod_btn_green js_all_play"><i
                            class="mod_btn_green__icon_play"></i>播放</a>
                <a class="mod_btn js_into_comment" data-stat="y_new.song.gotocomment" href="#comment_box"><i
                            class="mod_btn__icon_comment"></i>评论(${song.totalComNum})</a>
                <a href="javascript:;" class="mod_btn js_more" data-stat="y_new.song.header.more" data-id="244135851"
                   data-songtype="0" data-mid="003UAhhG2Bm3Nq"><i class="mod_btn__icon_menu"></i>更多</a>

            </div>
        </div>
    </div>


    <div class="detail_layout">
        <div class="detail_layout__main">

            <!--歌词_S-->
            <!--歌词_S-->
            <div class="mod_lyric">
                <input id="copy_content" style="display:none;">
                <div class="lyric__hd">
                    <h2 class="lyric__tit">歌词</h2><a class="btn_copy sprite" id="copy_link" href="javascript:;"
                                                     onclick="copyLyric('copy_content');"
                                                     data-clipboard-target="#copy_content" title="复制歌词"
                                                     data-clipboard-action="copy"><i class="icon_txt">复制</i></a>
                </div>
                <div class="lyric__cont">
                    <div class="lyric__cont_box" id="lrc_content"><p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <#if lyric ? exists>
                            <#list  lyric as line>
                                <p>${line}</p>
                                <p></p>
                            </#list>
                        <#else >
                            <p>暂无歌词</p>
                            <p></p>
                        </#if>

                    </div>
                </div>
            </div>
            <!--歌词_E-->
            <div class="mod_comment" id="comment_box">
            </div>
        </div>
        <div class="detail_layout__other">
            <div class="other_part" style="" id="song_playlist">
                <h3 class="other_part__tit">相关热门歌单</h3>
                <div class="mod_playlist">
                    <ul class="playlist__list">
                        <#if relativeSheet ? exists>
                            <#list relativeSheet as relative>
                        <li class="playlist__item"
                            onmouseover="this.className=(this.className+' playlist__item--hover')"
                            onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')"
                            data-disstid="7294974339">
                            <div class="playlist__item_box">
                                <div class="playlist__cover mod_cover"><a
                                            href=""
                                            onclick="" class="js_playlist"
                                            data-stat="y_new.song.hotgedan.click" data-disstid="7294974339"><img
                                                src="/upload/${relative.sheetImg}"
                                                alt="有料！不可错过的微视BGM" class="playlist__pic"><i
                                                class="mod_cover__icon_play js_play"
                                                data-stat="y_new.song.hotgedan.play"></i></a></div>
                                <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                                href="https://y.qq.com/n/yqq/playlist/7294974339.html#stat=y_new.song.hotgedan.click"
                                                onclick="setStatCookie&amp;&amp;setStatCookie();" class="js_playlist"
                                                data-stat="y_new.song.hotgedan.click" data-disstid="7294974339"
                                                title="有料！不可错过的微视BGM">${relative.sheetName}</a></span></h4>
                                <div class="playlist__author">
                                    ${relative.getUser().username}
                                </div>
                            </div>
                        </li>
                            </#list>
                        </#if>
                    </ul>
                </div>
            </div>


        </div>

    </div>

    <div class="mod_operate_menu" id="menu_menu" data-aria="popup" style="display:none;">
        <div class="operate_menu__cont">
            <ul role="menu" class="operate_menu__list">
                <li class="operate_menu__item">
                    <a href="javascript:;" class="operate_menu__link js_all_fav" data-target="menu_add"><i
                                class="operate_menu__icon_add sprite"></i>添加到<i
                                class="operate_menu__icon_arrow"></i></a>
                </li>
                <li class="operate_menu__item">
                    <a href="javascript:;" class="operate_menu__link js_all_share" data-target="menu_share"><i
                                class="operate_menu__icon_share sprite"></i>分享<i
                                class="operate_menu__icon_arrow"></i></a>
                </li>
                <li class="operate_menu__item">
                    <a href="javascript:;" class="operate_menu__link js_all_down"><i
                                class="operate_menu__icon_down sprite"></i>下载</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 跟头图保持一致 -->


<footer class="footer-container">
    <div class="section-container">
        <div class="footer-info">
            <div class="footer-download">
                <h3 class="footer-tit">下载QQ音乐客户端</h3>
                <ul class="download-list">
                    <li class="download-item">
                        <a href="javascript:;" class="download-link">
                            <i class="icon-pc footer"></i>
                            PC版
                        </a>
                    </li>
                    <li class="download-item">
                        <a href="javascript:;" class="download-link">
                            <i class="icon-mac footer"></i>
                            Mac版
                        </a>
                    </li>
                    <li class="download-item">
                        <a href="javascript:;" class="download-link">
                            <i class="icon-android footer"></i>
                            Android版
                        </a>
                    </li>
                    <li class="download-item">
                        <a href="javascript:;" class="download-link">
                            <i class="icon-iphone footer"></i>
                            iPhone版
                        </a>
                    </li>
                </ul>
            </div>
            <div class="footer-product">
                <h3 class="footer-tit">特色产品</h3>
                <ul class="product-list">
                    <li class="product-item product-img">
                        <a href="javascript:;" class="product-link">
                            <i class="icon-kg footer"></i>
                            全民K歌
                        </a>
                    </li>
                    <li class="product-item product-img">
                        <a href="javascript:;" class="product-link">
                            <i class="icon-super footer"></i>
                            Super Sound
                        </a>
                    </li>
                    <li class="product-item product-img">
                        <a href="javascript:;" class="product-link">
                            <i class="icon-qplay footer"></i>
                            QPlay
                        </a>
                    </li>
                    <li class="product-item">
                        <a href="javascript:;" class="product-link">车载互动</a>
                    </li>
                    <li class="product-item">
                        <a href="javascript:;" class="product-link">QQ演出</a>
                    </li>
                </ul>
            </div>

            <div class="footer-group">
                <h3 class="footer-tit">TME集团官网</h3>
                <ul class="group-list">
                    <li class="group-item">
                        <a href="javascript:;" class="group-link">腾讯音乐</a>
                    </li>
                </ul>
            </div>

            <div class="footer-link">
                <h3 class="footer-tit">合作链接</h3>
                <ul class="footer_link_list">
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">CJ ENM</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">腾讯视频</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">手机QQ空间</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">最新版QQ</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">腾讯社交广告</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">电脑管家</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">QQ浏览器</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">腾讯微云</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">腾讯云</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">企鹅FM</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">智能电视网</a>
                    </li>
                    <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">当贝市场</a>
                    </li>
                </ul>
            </div>

            <div class="footer-platform">
                <h3 class="footer-tit">开放平台</h3>
                <ul class="platform-list">
                    <li class="platform-item">
                        <a href="javascript:;" class="platform-link">腾讯音乐人</a>
                    </li>
                    <li class="platform-item">
                        <a href="javascript:;" class="platform-link">音乐号认证</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer-copyright">

            <p class="copyright-p">
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="关于腾讯">关于腾讯</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="About Tencent">About Tencent</a>
                |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="服务条款">服务条款</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="用户服务协议">用户服务协议</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="隐私政策">隐私政策</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="权利声明">权利声明</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="广告服务">广告服务</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="腾讯招聘">腾讯招聘</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="客服中心">客服中心</a> |
                <a href="javascript:;" class="copyright-p-link" target="_blank" title="网站导航">网站导航</a>
            </p>

            <p class="copyright-p">Copyright &copy; 1998 - <span id="copyYear">2019</span> Tencent. <a target="_blank"
                                                                                                       href="javascript:;"
                                                                                                       title="All Rights Reserved."
                                                                                                       class="copyright-p-link">All
                    Rights Reserved.</a></p>
            <p class="copyright-p">腾讯公司 <a class="copyright-p-link" target="_blank" href="javascript:;" title="版权所有">版权所有</a>
                <a target="_blank" href="javascript:;" class="copyright-p-link" title="腾讯网络文化经营许可证">腾讯网络文化经营许可证</a></p>
        </div>
    </div>

</footer>

</body>
<script type="text/javascript">
    var songId = "${song.song_id}";
    $(function () {
        toPage(1, songId);
    });

    function toPage(num, songId) {
        $.ajax({
            url: '/guest/songDetail',
            type: 'GET',
            data: {
                'songId': songId,
                'pageId': num,
            },
            success: function (data) {
                $("#comment_box").empty();
                $("#comment_box").append(data);
            }
        });
    }
</script>
<script type="text/javascript">
    function playAll() {
        window.open("/playAll");
    }

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $("#userImg").mouseout(function () {
            $('.popup_user').removeClass("drop");
        })
    });
</script>
<script type="text/javascript">
    $(function () {
        layui.use('layer', function () {
            var layer = layui.layer;
        });
        $('#submit').click(function () {
            var d = {};
            var t = $("#login_form").serializeArray(); // 默认是json 格式
            $.each(t, function () {
                //console.info(t)
                d[this.name] = this.value;
                console.info(d)
            });
            var username = d["username"];
            var password = d["password"];

            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "text",//预期服务器返回的数据类型
                url: "/guest/login",//url
                data: $('#login_form').serialize(),
                async: false,
                success: function (result) {
                    if (result != "登录成功") {
                        layer.alert(result);
                    } else {
                        location.reload();
                        layer.msg("登录成功!");
                    }
                },
                error: function () {
                    alert("异常！");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    function toHome() {
        <#if Session["user"] ? exists>
        window.location.href = "/user/home";
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        </#if>
    }
</script>
</html>