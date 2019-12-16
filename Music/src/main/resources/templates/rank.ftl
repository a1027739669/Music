<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <title>我的音乐</title>
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">

    <link rel="stylesheet" href="/mystatic/kuwocss.css">
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <link rel="stylesheet" href="/css/head.css">
    <link rel="stylesheet" href="/mediastyle/yqq/toplist_ae95fdcf.css-max_age=25920000.css"/>

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
            <li class="top-nav-item"><a href="/guest/index" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
            <li class="top-nav-item active"><a href="/guest/rank" class="tnav-link" title="音乐号">排行榜</a></li>
            <li class="top-nav-item"><a href="/guest/sheetlist" class="tnav-link" title="音乐号">分类歌单</a></li>


        </ul>
        <ul class="header-sec-nav">
            <li class="sec-nav-item active"><a href="/guest/index" class="nav-link">首页</a></li>
            <li class="sec-nav-item"><a href="/guest/singerlist" class="nav-link">歌手</a></li>
            <li class="sec-nav-item"><a href="/guest/albumlist" class="nav-link">专辑</a></li>
        </ul>
        <div class="header-search">
            <div class="search-input ">
                <input type="text" id="info" placeholder="搜索音乐、MV、歌单、用户">
                <button class="search-btn" id="searchbutton">
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
		    <a class="top_login__link js_logined"
               style=""><img id="userImg"
                             src="/upload/${user.user_image}"
                             class="top_login__cover js_user_img"></a>
                </span>
                <!-- 用户信息 -->
                <div class="popup_user">

                    <div class="popup_user_toolbar">
                        <!--绿钻-->
                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit"><a href="/user/userinfo"
                                                                    target="_blank" rel="noopener">个人信息</a>
                            </div>
                        </div>

                        <!--付费包-->

                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit js_msgcenterdiv"><a
                                        onclick="stertfind()">修改密码</a>
                            </div>
                        </div>
                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit"><a href="/user/loginout" class="js_logout"
                                                                    data-stat="y_new.top.pop.logout">退出登录</a>
                            </div>
                        </div>

                    </div>
                </div>
            <#else >
                <a href="javascript:;" class="h-login" id="openlogin">登录</a>
                <a href="javascript:;" class="h-login" id="aregister">注册</a>
                <div class="login-mark"></div>
            </#if>
        </div>
    </div>
</header>
<!--main content-->

<!-- 头部 E -->

<div class="main">


    <div class="toplist_nav">

        <dl class="toplist_nav__list">
            <dt class="toplist_nav__tit" id="rankName2">巅峰榜</dt>



            <dd class="toplist_nav__item"><a onclick="change(this,1,2,'播放榜')"
                                             class="toplist_nav__link toplist_nav__link--current">播放榜</a>
            </dd>
            <dd class="toplist_nav__item"><a
                        onclick="change(this,1,1,'热搜榜')"
                        class="toplist_nav__link">热搜榜</a></dd>
            <dd class="toplist_nav__item"><a onclick="change(this,1,3,'下载榜')"

                                             class="toplist_nav__link">下载榜</a>
            </dd>

        </dl>

        <dl class="toplist_nav__list">
            <dt class="toplist_nav__tit">地区榜</dt>

            <dd class="toplist_nav__item"><a

                        onclick="change(this,1,4,'内地榜')" class="toplist_nav__link">内地榜</a>
            </dd>

            <dd class="toplist_nav__item"><a

                        onclick="change(this,1,5,'港台榜')"
                        class="toplist_nav__link">港台榜</a></dd>


            <dd class="toplist_nav__item"><a

                        onclick="change(this,1,6,'欧美榜')" class="toplist_nav__link">欧美榜</a>
            </dd>

            <dd class="toplist_nav__item"><a

                        onclick="change(this,1,7,'韩国榜')" class="toplist_nav__link">韩国榜</a>
            </dd>

            <dd class="toplist_nav__item"><a

                        onclick="change(this,1,8,'韩国榜')" class="toplist_nav__link">日本榜</a>
            </dd>

        </dl>


    </div>


    <div class="mod_toplist">
        <div class="toplist__hd" id="classRank">播放榜</h1>
        </div>
        <div class="mod_songlist_toolbar">
            <a onclick="playAllRank()"
               class="mod_btn_green js_all_play"
               data-stat="y_new.toplist.playall"><i class="mod_btn_green__icon_play"></i>播放全部</a>
            <a onclick="AllAddToSheet(this)" class="mod_btn js_all_fav" data-stat="y_new.toplist.addall"><i
                        class="mod_btn__icon_add"></i>添加到</a>
            <a onclick="alldownsong()" class="mod_btn js_all_down" data-stat="y_new.toplist.downloadall"><i
                        class="mod_btn__icon_down"></i>下载</a>
            <a id="batchope" class="mod_btn js_batch"><i
                        class="mod_btn__icon_batch"></i>批量操作</a>
        </div>

        <div class="mod_songlist" id="songList">

        </div>


    </div>


</div>
<#include "publiclogin.ftl">
<#include "footer.ftl">

</body>

<script type="text/javascript">
    $(function () {
        toPage(1, 2);
    });

    function playAllRank() {
        var songIdList = [];
        $("#list li").each(function (index, item) {
            if (typeof ($(item).attr("ix")) != "undefined") {
                songIdList.push($(item).attr("ix"));
            }
        });
        window.open("/guest/playAllRank?ids=" + songIdList);
    }

    function addtonewsheet(){
        window.open("/user/create");
    }

    function toPage(num, classId) {
        $.ajax({
            url: '/guest/rankDetail',
            type: 'GET',
            data: {
                'rankClassId': classId,
                'pageId': num,
            },
            success: function (data) {
                $("#songList").empty();
                $("#songList").append(data);
            }
        });
    }

    function change(t, num, classId, rankName) {
        $("dd a").each(function (index, item) {
            $(item).removeClass("toplist_nav__link--current");
        });
        $(t).addClass("toplist_nav__link--current");
        toPage(num, classId);
        $("#classRank").html(rankName);
        window.location.hash = "#rankName2";
    }
</script>

<script type="text/javascript">
    function singledown(songId){
        <#if Session['user'] ? exists>
        window.location.href="/user/downsinglesong?id="+songId;
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>
    }

    function alldownsong() {
        var songIdList = [];
        <#if Session['user'] ? exists>
        if($("#songList").hasClass("mod_songlist--edit")) {
            $("#songList li").each(function (index, item) {
                if (typeof ($(item).attr("ix")) != "undefined") {
                    if ($(item).find(".sprite").hasClass("songlist__edit--check"))
                        songIdList.push($(item).attr("ix"));
                }
            });
        }
        if(songIdList.length===0){
            layer.msg("请先进行批量操作");
            return;
        }
        else {
            window.location.href = "/user/downsongbyids?ids="+songIdList;
        }

        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>

    }


    function AllAddToSheet(t) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;
        var songIdList = [];
        <#if Session['user'] ? exists>
        $("#fav_pop").css("left", left + 15 + "px");
        $("#fav_pop").css("top", top + 20 + "px");
        $("#fav_pop").css("display", "block");
        $("#fav_pop").data("songId", songIdList);
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>
        if($("#songList").hasClass("mod_songlist--edit")) {
            $("#songList li").each(function (index, item) {
                if (typeof ($(item).attr("ix")) != "undefined") {
                    if ($(item).find(".sprite").hasClass("songlist__edit--check"))
                        songIdList.push($(item).attr("ix"));
                }
            });
        }
        if(songIdList.length===0){
            layer.msg("请先进行批量操作");
            return;
        }
    }

    function addtosheet(t, songId) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;
        <#if Session['user'] ? exists>
        $("#fav_pop").css("left", left + 15 + "px");
        $("#fav_pop").css("top", top + 20 + "px");
        $("#fav_pop").css("display", "block");
        $("#fav_pop").data("songId", songId);
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        </#if>
    }

    function toAdd(sheetId) {
        var songId = $("#fav_pop").data("songId");
        $.ajax({
            url: '/user/addtosheet',
            type: 'GET',
            traditional: true,
            data: {
                'sheetId': sheetId,
                'songId': songId,
            },
            success: function (data) {
                layer.msg(data);
            }
        });
    }

    function playSong(songId) {
        window.open("/guest/playSong?id=" + songId);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#batchope").click(function () {
            if ($("#batchope").text() === "批量操作") {
                $("#batchope").text("取消批量操作");
                $("#songList").addClass("mod_songlist--edit");
            } else {
                $("#batchope").text("批量操作");
                $("#songList").removeClass("mod_songlist--edit");
            }
        });
    });

    function allclick(t) {
       if($(t).parent(".songlist__edit").hasClass("songlist__edit--check")){
           $(t).parent(".songlist__edit").removeClass("songlist__edit--check");
           $(".songlist__edit").each(
               function (index,item) {
                   $(item).removeClass("songlist__edit--check");
               }
           );
       }
       else {
           $(t).parent(".songlist__edit").addClass("songlist__edit--check");
           $(".songlist__edit").each(
               function (index,item) {
                   $(item).addClass("songlist__edit--check");
               }
           );
       }
    }

    function changestate(t) {
        if($(t).parent(".songlist__edit").hasClass("songlist__edit--check")){
            $(t).parent(".songlist__edit").removeClass("songlist__edit--check");
        }
        else
        {
            $(t).parent(".songlist__edit").addClass("songlist__edit--check");
        }
    }

</script>
</html>