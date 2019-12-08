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
        <div class="toplist__hd">播放榜</h1>
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

    <!-- 专辑简介 -->
    <div class="popup_data_detail" id="popup_data_detail" data-aria="popup" style="display:none;z-index:10000000000;">
        <div class="popup_data_detail__cont">
            <h3 class="popup_data_detail__tit">榜单规则</h3>
            追踪全球音乐流行趋势，乐坛最热门歌曲，网络蹿红歌曲根据地。展示QQ音乐用户的关注热度，体现歌曲飙升程度的潮流音乐排行榜。<br><br>更新时间：每天更新<br>歌曲数量：100首<br>统计算法：QQ音乐库内全部歌曲，根据综合数据7天前的涨幅进行排序，取前100名<br>综合数据：登录用户在QQ音乐播放/分享/下载数据
        </div>
        <i class="popup_data_detail__arrow"></i>
    </div>
</div>

<footer class="footer-container">
    <div class="section-container">
        <div class="footer-copyright">
            <p class="copyright-p">
            <h3  target="_blank" title="隐私政策">我的音乐</h3>
            </p>
        </div>
    </div>
</footer>
<div class="mod_operate_menu" style="position: absolute; display: none; left: 434px; top: 594px;" id="fav_pop">
    <div class="operate_menu__cont">
        <a href="javascript:;" class="operate_menu__link js_addto_playlist">播放队列</a>
        <ul role="menu" class="operate_menu__list operate_menu__top_line operate_menu__bottom_line">
            <#if Session['loginusersheet'] ? exists>
                <#list Session['loginusersheet'] as tempsheet>
                    <li class="operate_menu__item">
                        <a onclick="toAdd(${tempsheet.id})"
                           class="operate_menu__link js_addto_taogelist"
                           data-dirid="201" title="${tempsheet.sheetName}"><i
                                    class="operate_menu__icon_like"></i>${tempsheet.sheetName} </a>
                    </li>
                </#list>
            </#if>
        </ul>
        <a onclick="addtonewsheet()" class="operate_menu__link js_addto_new"><i
                    class="operate_menu__icon_add sprite"></i>创建新歌单</a>
    </div>
</div>

</body>
<script type="text/javascript">

    $("#aregister").click(function () {
        $("#registermodel").addClass("active");
    });

    $("#findbutton").click(function () {
        $("#findform").validate({
            debug: false,
            rules: {
                findmobile: {
                    required: true,
                    isMobile: true,
                },
            },
            messages: {
                findmobile: "请输入正确手机号",
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element.parent());
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                setSMS();
            }
        });
    });

    function setSMS() {
        var telephone = $("#findmobile").val();

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/SMSVerification",//url
            data: {"telephone": telephone},
            async: false,
            success: function (result) {
                if (result == "手机号已注册") {
                    layer.msg(result);
                    return;
                }
            },

        });

        var count = 60;
        var countdown = setInterval(CountDown, 1000);

        function CountDown() {
            $("#findbutton").attr("disabled", true);
            $("#findbutton").text(count);
            if (count == 0) {
                $("#findbutton").text("发送验证码").removeAttr("disabled");
                clearInterval(countdown);
            }
            count--;
        }
    }

    function nextstep2() {
        var frontcode = $("#findsms").val();
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/modify",//url
            data: {"frontcode": frontcode},
            async: false,
            success: function (result) {
                if (result == "OK") {
                    $("#findmodel").removeClass("active");
                    $("#lastfindmodel").addClass("active");
                } else {
                    layer.msg("验证码错误");
                }
            },

        });
    }

    function finish() {
        var password1 = $("#lastfindpassword").val();
        var password2 = $("#lastfindpw2").val();
        if (password1 == "") {
            layer.msg("请输入密码");
            return;
        }
        else if (password1.length<=6) {
            layer.msg("密码应大于6位");
            return;
        }
        else if (password2 == "") {
            layer.msg("请再次输入密码");
            return;
        }
        else if (password1 != password2) {
            layer.msg("两次密码不一致");
            return;
        }
        else {
            toRegister2();
        }
    }


    function toRegister2() {
        var password = $("#lastfindpassword").val();
        var telephone = "11111111111";
        <#if Session['usertele'] ? exists>
        telephone = "${Session['usertele']}";
        </#if>
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/modifypass",//url
            data: {"password": password, "telephone": telephone},
            async: false,
            success: function (result) {
                if (result == "OK") {
                    layer.msg("成功");
                    location.reload();
                } else {
                    layer.msg("失败");
                }
            },

        });
    }


    $("#sms_code").click(function () {
        $("#registerform").validate({
            debug: false,
            rules: {
                telephone: {
                    required: true,
                    isMobile: true,
                },
            },
            messages: {
                telephone: "请输入正确手机号",
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element.parent());
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                getSMSCode();
            }
        });
    });



    $("#register-submit").click(function () {

        var password1 = $("#newpassword").val();
        var password2 = $("#pw2").val();
        if (password1 == "") {
            layer.msg("请输入密码");
            return;
        }
        else if (password1.length<=6) {
            layer.msg("密码应大于6位");
            return;
        }
        else if (password2 == "") {
            layer.msg("请再次输入密码");
            return;
        }
        else if (password1 != password2) {
            layer.msg("两次密码不一致");
            return;
        }
        else {
            toRegister();
        }
    });

    function getSMSCode() {
        var telephone = $("#telephone").val();

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/guest/SMSVerification",//url
            data: {"telephone": telephone},
            async: false,
            success: function (result) {
                if (result == "手机号已注册") {
                    layer.msg(result);
                    return;
                }
            },

        });

        var count = 60;
        var countdown = setInterval(CountDown, 1000);

        function CountDown() {
            $("#sms_code").attr("disabled", true);
            $("#sms_code").text(count);
            if (count == 0) {
                $("#sms_code").text("发送验证码").removeAttr("disabled");
                clearInterval(countdown);
            }
            count--;
        }
    }

    function nextstep() {
        var frontcode = $("#smsCode").val();
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/guest/vertify",//url
            data: {"frontcode": frontcode},
            async: false,
            success: function (result) {
                if (result == "OK") {
                    $("#registermodel").removeClass("active");
                    $("#secondstep").addClass("active");
                } else {
                    layer.msg("验证码错误");
                }
            },

        });
    }

    function toRegister() {
        var password = $("#newpassword").val();
        var telephone = "11111111111";
        <#if Session['teleph'] ? exists>
        telephone = "${Session['teleph']}";
        </#if>
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/guest/register",//url
            data: {"password": password, "telephone": telephone},
            async: false,
            success: function (result) {
                if (result == "OK") {
                    layer.msg("注册成功");
                    location.reload();
                } else {
                    layer.msg("注册失败");
                }
            },

        });
    }

    function stertfind() {
        $("#findmodel").addClass("active");
    }
</script>
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
        $("h1").html(rankName);
        window.location.hash = "#rankName2";
    }
</script>
<script type="text/javascript">
    $(function () {
        layui.use('layer', function () {
            var layer = layui.layer;
        });
        $('#account-login-submit').click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "text",//预期服务器返回的数据类型
                url: "/guest/login",//url
                data: {"username": username, "password": password},
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
    $(function () {
        $('#account-login-submit').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                $("#account-login-submit").click();
            }
        });

    });
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

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        });
        $(".popup_user").mouseleave(function () {
            $('.popup_user').removeClass("drop");
        })
        $("#fav_pop").mouseleave(function () {
            $("#fav_pop").css("display", "none");
        });
        $("#searchbutton").click(function () {
            var key = $("#info").val();
            window.location.href = "/guest/search?info=" + key;
        });
    });

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
<script type="text/javascript">
    function toHome() {
        <#if Session["user"] ? exists>
        window.location.href = "/user/home";
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        </#if>
    }

    function platindexrank(id) {
        window.open("/guest/playindexrank?id="+id);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#openlogin").click(function () {
            $("#loginmodel").addClass("active");
        });
        $("#loginregister").click(function () {
            $("#loginmodel").removeClass("active");
            $("#registermodel").addClass("active");
        });
        $("#returnlogin").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").addClass("active");
        });
        $("#cancel1").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
            $("#secondstep").removeClass("active");
            $("#findmodel").removeClass("active");
            $("#lastfindmodel").removeClass("active");
        });
        $("#cancel2").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
            $("#secondstep").removeClass("active");
            $("#findmodel").removeClass("active");
            $("#lastfindmodel").removeClass("active");
        });

        $("#cancel3").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
            $("#secondstep").removeClass("active");
            $("#findmodel").removeClass("active");
            $("#lastfindmodel").removeClass("active");
        });

        $("#cancel4").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
            $("#secondstep").removeClass("active");
            $("#findmodel").removeClass("active");
            $("#lastfindmodel").removeClass("active");
        });

        $("#cancel5").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
            $("#secondstep").removeClass("active");
            $("#findmodel").removeClass("active");
            $("#lastfindmodel").removeClass("active");
        });
    });
</script>
</html>