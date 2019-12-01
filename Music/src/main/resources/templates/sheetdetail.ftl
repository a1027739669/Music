<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript"  src="/layui/layui.js"></script>
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
    <script src="/bin/jquery-3.4.1.js"></script>
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
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

    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">

</head>
<body class="os_mac">
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
<div class="main">

    <div class="mod_data" itemscope="" itemtype="">
        <!-- 自建歌单用a标签 -->

        <span class="data__cover" id="logo">
                <img src="/upload/${sheetDetail.sheetImg}"
                     class="data__photo">
            </span>
        <div class="data__cont">
            <div class="data__name js_box" data-type="p_title">
                <h1 class="data__name_txt" title="玲珑骰子安红豆，入骨相思知不知？" id="p_name_show">${sheetDetail.sheetName}</h1><a
                        href="javascript:;" class="btn_edit sprite js_edit" style="display:none;"><i
                            class="icon_txt">编辑</i></a>
                <div class="mod_form_txt js_edit_box" style="display:none;">
                    <input type="text" value="玲珑骰子安红豆，入骨相思知不知？" class="form_txt__input" id="p_name"><span
                            class="form_txt__tips" id="name_leftnum">0</span>
                </div>
            </div>
            <div class="data__singer">
                <i class="icon_singer sprite"></i><a href="javascript:;" title="叶洛洛" data-singermid=""
                                                     data-singerid="162021" class="data__singer_txt js_singer"
                                                     data-stat="y_new.gedan.header.singername">${sheetDetail.getUser().nicheng}</a>
            </div>
            <ul class="data__info">
                <li class="data_info__item js_box" data-type="p_tags" style="display:block;">
                    <div class="data_tag_box">
                        标签：<span id="choosebox1">
                            <#list sheetDetail.labels ? split(",") as labelName>
                                <a href="javascript:;"
                                   class="data_info__tags js_jump"
                                   data-id="145">${labelName}</a>
                            </#list></span><a
                                href="javascript:;" class="btn_edit sprite js_edit" style="display:none;"><i
                                    class="icon_txt">编辑</i></a>
                    </div>
                </li>
                <li class="data_info__item">播放量：${sheetDetail.playCount}万</li>
                <li class="data_info__item">收藏量：${sheetDetail.support}万</li>
            </ul>

            <div class="data__actions" role="toolbar">
                <a href="javascript:;" class="mod_btn_green js_all_play" data-stat="y_new.gedan.header.playall"><i
                            class="mod_btn_green__icon_play"></i>播放全部</a>
                <a href="javascript:;" class="mod_btn js_more" data-stat="y_new.gedan.header.more" data-id="1189673367"><i
                            class="mod_btn__icon_menu"></i>更多</a>
            </div>
        </div>
    </div>

    <div class="detail_layout">
        <div class="detail_layout__main js_main">

            <div class="mod_songlist">
                <ul class="songlist__header">
                    <li class="songlist__edit songlist__edit--check sprite">
                        <input type="checkbox" class="songlist__checkbox js_check_all">
                    </li>
                    <li class="songlist__header_name">歌曲</li>
                    <li class="songlist__header_author">歌手</li>
                    <li class="songlist__header_album">专辑</li>
                    <li class="songlist__header_time">时长</li>
                </ul>

                <ul class="songlist__list">
                    <#list sheetDetail.getDetails() as detail>
                        <#if (detail_index%2==0)>
                            <li mid="245248358" ix="0">

                                <div class="songlist__item"
                                     onmouseover="this.className=(this.className+' songlist__item--hover')"
                                     onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                                    <div class="songlist__edit songlist__edit--check sprite">
                                        <input type="checkbox" class="songlist__checkbox">
                                    </div>
                                    <div class="songlist__number">${detail_index+1}</div>
                                    <div class="songlist__songname">


                                <span class="songlist__songname_txt"><a
                                            href="" class="js_song"
                                            title="子归 为你轻描一抹胭脂妆 满庭花香无人来赏">${detail.getSong().song_name}<span
                                                class="songlist__song_txt"></span></a></span>
                                        <div class="mod_list_menu">
                                            <a href="javascript:;" class="list_menu__item list_menu__play js_play"
                                               title="播放">
                                                <i class="list_menu__icon_play"></i>
                                                <span class="icon_txt">播放</span>
                                            </a>
                                            <a href="javascript:;" class="list_menu__item list_menu__add js_fav"
                                               title="添加到歌单"
                                               aria-haspopup="true" data-target="menu_add">
                                                <i class="list_menu__icon_add"></i>
                                                <span class="icon_txt">添加到歌单</span>
                                            </a>

                                            <a href="javascript:;" class="list_menu__item list_menu__down js_down"
                                               title="下载"
                                               aria-haspopup="true" data-target="menu_down">
                                                <i class="list_menu__icon_down"></i>
                                                <span class="icon_txt">下载</span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="songlist__artist" title="叶洛洛">


                                        <a href="https://y.qq.com/n/yqq/singer/003QznRR2ry01V.html"
                                           data-singermid="003QznRR2ry01V" data-singerid="162021" title="叶洛洛"
                                           class="singer_name">${detail.getSong().song_name}</a>

                                    </div>
                                    <div class="songlist__album">
                                        <a href="https://y.qq.com/n/yqq/album/001SCsj43L6kd5.html" title="叶洛洛の音乐电台"
                                           class="album_name" data-albummid="001SCsj43L6kd5"
                                           data-albumid="6938999">${detail.getSong().getAlbum().album_name}</a>
                                    </div>
                                    <div class="songlist__time">${detail.getSong().song_time}</div>
                                    <div class="songlist__other">

                                    </div>
                                    <a href="javascript:;" class="songlist__delete js_delete" data-confirm="1"
                                       title="删除"><span
                                                class="icon_txt">删除</span></a>
                                </div>
                            </li>
                        <#else >
                            <li mid="237527861" ix="1">

                                <div class="songlist__item songlist__item--even"
                                     onmouseover="this.className=(this.className+' songlist__item--hover')"
                                     onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                                    <div class="songlist__edit songlist__edit--check sprite">
                                        <input type="checkbox" class="songlist__checkbox">
                                    </div>
                                    <div class="songlist__number">${detail_index+1}</div>
                                    <div class="songlist__songname">

                                        <span class="songlist__songname_txt"><a
                                                    href="https://y.qq.com/n/yqq/song/001b9vZQ2XkXQ2.html"
                                                    class="js_song"
                                                    title="墨书 ">${detail.getSong().getSinger().singerName}<span
                                                        class="songlist__song_txt"></span></a></span>
                                        <div class="mod_list_menu">
                                            <a href="javascript:;" class="list_menu__item list_menu__play js_play"
                                               title="播放">
                                                <i class="list_menu__icon_play"></i>
                                                <span class="icon_txt">播放</span>
                                            </a>
                                            <a href="javascript:;" class="list_menu__item list_menu__add js_fav"
                                               title="添加到歌单"
                                               aria-haspopup="true" data-target="menu_add">
                                                <i class="list_menu__icon_add"></i>
                                                <span class="icon_txt">添加到歌单</span>
                                            </a>

                                            <a href="javascript:;" class="list_menu__item list_menu__down js_down"
                                               title="VIP下载"
                                               aria-haspopup="true" data-target="menu_down">
                                                <i class="list_menu__icon_down_vip"></i>
                                                <span class="icon_txt">VIP下载</span>
                                            </a>

                                            <a href="javascript:;" class="list_menu__item list_menu__share js_share"
                                               title="分享"
                                               aria-haspopup="true" data-aria="menu_share">
                                                <i class="list_menu__icon_share"></i>
                                                <span class="icon_txt">分享</span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="songlist__artist" title="叶洛洛">


                                        <a href="https://y.qq.com/n/yqq/singer/003QznRR2ry01V.html"
                                           data-singermid="003QznRR2ry01V" data-singerid="162021" title="叶洛洛"
                                           class="singer_name">${detail.getSong().getSinger().singerName}</a>

                                    </div>
                                    <div class="songlist__album">
                                        <a href="https://y.qq.com/n/yqq/album/000XkvmT3q6p3v.html" title="墨书"
                                           class="album_name"
                                           data-albummid="000XkvmT3q6p3v"
                                           data-albumid="7836997">${detail.getSong().getAlbum().album_name}</a>
                                    </div>
                                    <div class="songlist__time">${detail.getSong().song_time}</div>
                                    <div class="songlist__other">

                                    </div>
                                    <a href="javascript:;" class="songlist__delete js_delete" data-confirm="1"
                                       title="删除"><span
                                                class="icon_txt">删除</span></a>
                                </div>
                            </li>
                        </#if>
                    </#list>
                </ul>
            </div>
            <div class="mod_songlist_toolbar mod_songlist_toolbar--edit js_foot_batch" style="display:none;">
                <div class="songlist__edit songlist__edit--check sprite" style="display:none;">
                    <input type="checkbox" class="songlist__checkbox js_check_all">
                </div>
                <a href="javascript:;" class="mod_btn js_all_play" data-stat="y_new.gedan.songlist.playall"><i
                            class="mod_btn__icon_play"></i>播放全部</a>
                <a href="javascript:;" class="mod_btn js_all_fav"><i class="mod_btn__icon_add"></i>添加到</a>
                <a href="javascript:;" class="mod_btn js_all_down"><i class="mod_btn__icon_down"></i>下载</a>
                <a href="javascript:;" class="mod_btn js_all_delete" style="display:none;"><i
                            class="mod_btn__icon_delete"></i>删除</a>
                <a href="javascript:;" class="mod_btn js_batch"><i class="mod_btn__icon_batch"></i>批量操作</a>
            </div>

        </div>
        <div class="detail_layout__other">

            <div class="mod_about js_box" id="album_desc" style="display:block;">
                <h3 class="about__tit">简介</h3>
                <div class="about__cont">
                    <p>${sheetDetail.introduction} </p>
                </div>
            </div>
        </div>
        <!-- 专辑简介 -->
    </div>
    <div class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">该作者创建的其他歌单</h2>

            <a href="" class="part__more js_goto_tab"
               data-stat="y_new.singer.index.album_all" data-tab="album">全部<i class="icon_part_arrow sprite"></i></a>

        </div>
        <div class="mod_playlist">
            <ul class="playlist__list" id="albumlist">
                <#list others as other>
                    <li class="playlist__item" onmouseover="this.className=(this.className+' playlist__item--hover')"
                        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a
                                        href="" class="js_album"
                                        data-stat="y_new.singer.index.album_pic" data-albummid="004fXSyj3bWTMN"
                                ><img
                                            src="/upload/${other.sheetImg}"

                                            class="playlist__pic"><i class="mod_cover__icon_play js_play"
                                                                     data-stat="y_new.singer.index.album_play"></i></a>
                            </div>
                            <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                            href=""
                                            class="js_album" data-stat="y_new.singer.index.albumName"
                                            data-albummid="004fXSyj3bWTMN"
                                            data-albumid="9040723">${other.sheetName}</a></span>
                            </h4>
                            <div class="playlist__other">
                                ${other.createDate}
                            </div>
                            <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2"
                               data-mid="004fXSyj3bWTMN"><span class="icon_txt">更多</span></a>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <div class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">相似歌单</h2>


        </div>
        <div class="mod_playlist">
            <ul class="playlist__list" id="albumlist">
                <#list likes as like>
                    <li class="playlist__item" onmouseover="this.className=(this.className+' playlist__item--hover')"
                        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a
                                        href="" class="js_album"
                                        data-stat="y_new.singer.index.album_pic" data-albummid="004fXSyj3bWTMN"
                                ><img
                                            src="/upload/${like.sheetImg}"

                                            class="playlist__pic"><i class="mod_cover__icon_play js_play"
                                                                     data-stat="y_new.singer.index.album_play"></i></a>
                            </div>
                            <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                            href=""
                                            class="js_album" data-stat="y_new.singer.index.albumName"
                                            data-albummid="004fXSyj3bWTMN"
                                            data-albumid="9040723">${like.sheetName}</a></span>
                            </h4>
                            <div class="playlist__other">
                                ${like.createDate}
                            </div>
                            <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2"
                               data-mid="004fXSyj3bWTMN"><span class="icon_txt">更多</span></a>
                        </div>
                    </li>
                </#list>
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

<!-- 添加到 -->
<div class="mod_operate_menu" style="position: absolute; display: none; left: 445px; top: 645px;" id="fav_pop">
    <div class="operate_menu__cont">
        <a href="javascript:;" class="operate_menu__link js_addto_playlist">播放队列</a>
        <ul role="menu" class="operate_menu__list operate_menu__top_line operate_menu__bottom_line">

            <li class="operate_menu__item">
                <a href="javascript:;" class="operate_menu__link js_addto_taogelist operate_menu__link--disabled"
                   data-dirid="201" title="我喜欢 "><i class="operate_menu__icon_like"></i>我喜欢 </a>
            </li>

            <li class="operate_menu__item">
                <a href="javascript:;" class="operate_menu__link js_addto_taogelist" data-dirid="2"
                   title="2013-09-15试听列表 ">2013-09-15试听列表 </a>
            </li>

            <li class="operate_menu__item">
                <a href="javascript:;" class="operate_menu__link js_addto_taogelist" data-dirid="1"
                   title="one ">one </a>
            </li>

            <li class="operate_menu__item">
                <a href="javascript:;" class="operate_menu__link js_addto_taogelist" data-dirid="3" title="姓章的勿动的 ">姓章的勿动的 </a>
            </li>

        </ul>
        <a href="javascript:;" class="operate_menu__link js_addto_new"><i class="operate_menu__icon_add sprite"></i>添加到新歌单</a>
    </div>
</div>
</body>
<script type="text/javascript">


</script>
</html>
