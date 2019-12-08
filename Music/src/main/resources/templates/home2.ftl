<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Language" content="zh-cn">



    <meta name="applicable-device" content="pc">
    <title>个人主页</title>
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
    <script src="/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/mediastyle/yqq/playlist.css-max_age=2592000.css"/>

    <link rel="stylesheet" href="/css/head2.css">
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
    <link type="text/css" rel="stylesheet" href="/kuwocss/style4.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/kuwocss/styles.css">
</head>
<header class="header">
    <div class="header-box">
        <h1 class="header-title">
            <a href="javascript:;"><img class="logo-img" src="/image/logo.png" alt="QQ音乐"></a>
            <#--                <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>-->
        </h1>
        <ul class="header-top-nav">
            <li class="top-nav-item"><a href="/guest/index" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item  active"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
            <li class="top-nav-item"><a href="/guest/rank" class="tnav-link" title="音乐号">排行榜</a></li>
            <li class="top-nav-item"><a href="/guest/sheetlist" class="tnav-link" title="音乐号">分类歌单</a></li>


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
                             src="/upload/${Session["user"].user_image}"
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


<body data-spm="12028041">
<div id="app">
    <div class="page-container">
        <div class="content-wrapper">
            <div class="my-music-view">
                <div class="sticky-leftbar is-affixed" data-spm="leftbar" style="position: relative;">
                    <div class="leftbar-inner"
                         style="position: fixed; top: 0px; left: 96.6667px; width: 265px; transform: translate3d(0px, 0px, 0px);">
                        <div class="leftbar-content">
                            <div class="personal-panel">
                                <div class="avatar"
                                     style="opacity: 1; background-image: url('/upload/${user.user_image}');"></div>
                                <div class="name">
                                    ${user.nicheng}
                                </div>
                                <div class="tag clearfix">
                                    <div class="iconfont levelTag"></div>
                                </div>
                                <div class="visitor-action">

                                    <div class="button unselectable iconfont chat"><span class="ripple"
                                                                                          style="height: 40px; width: 40px; top: 0px; left: 0px;"></span>
                                    </div>
                                    <div class="button unselectable iconfont more"><span class="ripple"
                                                                                          style="height: 40px; width: 40px; top: 0px; left: 0px;"></span>
                                    </div>
                                </div>
                                <div class="talentDes"></div>
                                <div class="signature">${user.introduction}</div>
                                <div class="description">来自宇宙深处的，${user.create_date}加入</div>
                                <div class="info-count"><a href="">
                                        <div class="item">
                                            <div class="item-count"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="view-body">
                    <div class="count-list" style="margin-top: 0px;">
                        <div class="count-item"><a href="/user/recentplay">
                                <div class="count-wrap">
                                    <div class="iconfont"></div>
                                    <div class="content">
                                        <div class="count">${recentPlay ? size}</div>
                                        <div class="name">最近播放</div>
                                    </div>
                                </div>
                            </a></div>
                        <div class="count-item"><a href="/user/mycollection">
                                <div class="count-wrap">
                                    <div class="iconfont"></div>
                                    <div class="content">
                                        <div class="count">0</div>
                                        <div class="name">所有收藏</div>
                                    </div>
                                </div>
                            </a></div>
                    </div>
                    <div class="collect-list">
                        <div class="block-title unselectable"><h2>创建的歌单</h2>
                            <div class="external">
                                <a href="/user/create" class="mod_btn js_follow"><i class="mod_btn__icon_more"
                                                                                    data-status="0"></i>新建歌单</a>
                                <a
                                        href="/user/usercreated?userId=${user.id}">
                                    <div class="action" >|全部
                                        <div class="button unselectable action round">
                                            <div class="iconfont"></div>
                                            <span class="ripple"
                                                  style="height: 40px; width: 40px; top: 0px; left: 0px;"></span></div>
                                    </div>
                                </a></div>
                        </div>
                        <div>
                            <div class="adaptive-list" style="opacity: 1;">
                                <#if myCreate ? exists>
                                    <#list myCreate as create>
                                        <div class="collect-item unselectable" style="flex: 0 0 20%; max-width: 20%;">
                                            <div class="wrapper"><a href="">
                                                    <div class="cover"
                                                         style="background-image: url('/upload/${create.sheetImg}');">
                                                        <div class="count"><i class="iconfont"></i>${create.support}
                                                        </div>
                                                    </div>
                                                </a></div>
                                            <div class="info">
                                                <div class="name"><a href="">${create.sheetName}</a>
                                                </div>
                                                <div class="song-tags" data-spm="songtags">
                                                    <#list create.labels ? split(',') as label>
                                                        <span class="tag-tag"><a
                                                                    href="">${label}</a></span>
                                                    </#list>

                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                    <#else >
                                        <div class="none_txt">
                                            <i class="none_txt__symbol"></i>
                                            <p>什么都没有</p>
                                        </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                    <div class="collect-list">
                        <div class="block-title unselectable"><h2>收藏的歌单</h2>
                            <div class="external"><a
                                        href="/user/usercollections?userId=${user.id}">
                                    <div class="action">全部
                                        <div class="button unselectable action round">
                                            <div class="iconfont"></div>
                                            <span class="ripple"
                                                  style="height: 40px; width: 40px; top: 0px; left: 0px;"></span></div>
                                    </div>
                                </a></div>
                        </div>
                        <div>
                            <div class="adaptive-list" style="opacity: 1;">
                                <#if myCollection ? exists>
                                    <#list myCollection as collection>
                                        <div class="collect-item unselectable" style="flex: 0 0 20%; max-width: 20%;">
                                            <div class="wrapper"><a href="https://www.xiami.com/collect/365764247">
                                                    <div class="cover"
                                                         style="background-image: url('/upload/${collection.sheetImg}');">
                                                        <div class="count"><i
                                                                    class="iconfont"></i>${collection.getSongSheet().support}</div>
                                                        <div class="action">
                                                            <button class="play"><i class="iconfont"></i></button>
                                                        </div>
                                                    </div>
                                                </a></div>
                                            <div class="info">
                                                <div class="name"><a
                                                            href="https://www.xiami.com/collect/365764247">${collection.getSongSheet().sheetName}</a>
                                                </div>
                                                <div class="author"><a
                                                            href="https://www.xiami.com/user/52300480">${collection.getSongSheet().getUser().nicheng}</a>
                                                </div>
                                                <div class="song-tags" data-spm="songtags">
                                                    <#list collection.labels ? split(',') as label>
                                                        <span class="tag-tag"><a
                                                                    href="">${label}</a></span>
                                                    </#list>

                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                    <#else >
                                        <div class="none_txt">
                                            <i class="none_txt__symbol"></i>
                                            <p>什么都没有</p>
                                        </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>


        <div class="back-to-top" data-spm="back2top">
            <div class="button unselectable invisible iconfont round"><span class="ripple"
                                                                             style="height: 40px; width: 40px; top: 0px; left: 0px;"></span>
            </div>
        </div>
    </div>
</div>


<div class="modal-wrapper">
    <div class="modal opened" id="loginmodel">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel1"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-login-wrapper">
                            <div id="login-container">
                                <div class="login-tab"><span class="current"
                                    >账户登录</span><span
                                            class=""
                                            data-spm-anchor-id="a2oj1.12028025.0.i1.54776ee1fdgM1B">手机验证码</span></div>
                                <form id="loginform">
                                    <div class="account-login">
                                        <div class="form-block"><label for="account">账号</label><input id="username"
                                                                                                      type="text"
                                                                                                      placeholder="请输入邮箱或手机"
                                                                                                      autocomplete="off"
                                                                                                      autocorrect="off"
                                                                                                      autocapitalize="off"
                                                                                                      spellcheck="false"
                                                                                                      class=""></div>
                                        <div class="form-block"><label for="password">密码</label><input id="password"
                                                                                                       type="password"
                                                                                                       placeholder="请输入密码">
                                        </div>
                                        <div class="form-block form-action">
                                            <button id="account-login-submit" type="button">登录</button>
                                        </div>
                                        <div class="form-block form-extra"><a class="right"
                                                                              onclick="stertfind()">忘记密码？</a><a
                                                    id="loginregister">注册</a></div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-wrapper">
    <div class="modal opened" id="registermodel">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel2"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-register-wrapper">
                            <div id="agreement-container">
                                <div class="agreement-title">新用户注册<em>轻松两步即可完成注册</em></div>
                                <form id="registerform">
                                    <div class="agreement-content">
                                        <div class="form-block"><label for="telephone">手机号</label>
                                            <div class="form-input-inline">
                                                <input id="telephone" name="telephone" type="tel" placeholder="请输入手机号"
                                                       autocomplete="off"
                                                       autocorrect="off" autocapitalize="off" spellcheck="false"
                                                       maxlength="11" class=""></div>
                                        </div>
                                        <div class="form-block"><label>验证码</label>
                                            <div class="form-input-inline"><input id="smsCode" type="text"
                                                                                  placeholder="请输入验证码" maxlength="6"
                                                                                  pattern="\d*" class="" value="">
                                                <div class="sms-code">
                                                    <button id="sms_code">发送验证码</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-block form-action">
                                            <button id="agreement-submit" onclick="nextstep()" type="button">下一步
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                <div class="step-notice"><a id="returnlogin">返回登录</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-wrapper">
    <div class="modal opened" id="secondstep">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel3"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-register-wrapper">
                            <div id="register-container">
                                <div class="register-title">设置密码<em>请输入6-12位密码</em></div>
                                <form id="last">
                                    <div class="register-pwd">
                                        <div class="form-block"><label for="newpassword">密码</label><input
                                                    id="newpassword" name="newpassword"
                                                    type="password"
                                                    placeholder="请输入你要设定的密码"
                                                    autocomplete="off"
                                                    class=""></div>
                                        <div class="form-block"><label for="pw2">重复密码</label><input id="pw2"
                                                                                                    name="pw2"
                                                                                                    type="password"
                                                                                                    placeholder="再输入一次你设定的密码"
                                                                                                    autocomplete="off"
                                                                                                    class=""></div>
                                        <div class="form-block form-action">
                                            <button id="register-submit">完成</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="step-notice"><a id="laststep">返回上一步</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal-wrapper">
    <div class="modal opened" id="findmodel">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel4"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-register-wrapper">
                            <div id="agreement-container">
                                <div class="agreement-title">找回密码<em></em></div>
                                <form id="findform">
                                    <div class="agreement-content">
                                        <div class="form-block"><label for="findmobile">手机号</label>
                                            <div class="form-input-inline">
                                                <input id="findmobile" name="findmobile" type="tel" placeholder="请输入手机号"
                                                       autocomplete="off"
                                                       autocorrect="off" autocapitalize="off" spellcheck="false"
                                                       maxlength="11" class=""></div>
                                        </div>
                                        <div class="form-block"><label>验证码</label>
                                            <div class="form-input-inline"><input id="findsms" type="text"
                                                                                  placeholder="请输入验证码" maxlength="6"
                                                                                  pattern="\d*" class="" value="">
                                                <div class="sms-code">
                                                    <button id="findbutton">发送验证码</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-block form-action">
                                            <button onclick="nextstep2()" type="button">下一步</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-wrapper">
    <div class="modal  opened" id="lastfindmodel">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel5"></span>
            <div class="setting-modal">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="set-password">
                            <div class="setting-form set-password">
                                <div class="title">设置密码</div>
                                <form id="lastfindform">
                                    <div class="form-block"><label>密码</label><input type="password"
                                                                                    placeholder="输入6-12位数字或英文密码"
                                                                                    class="" maxlength="12" value=""
                                                                                    id="lastfindpassword"
                                                                                    name="lastfindpassword"
                                        >
                                    </div>
                                    <div class="form-block"><label>重复密码</label><input type="password"
                                                                                      placeholder="再输入一遍你设定的密码" class=""
                                                                                      maxlength="12" value=""
                                                                                      id="lastfindpw2"
                                                                                      name="lastfindpw2"
                                        ></div>
                                </form>
                                <div class="button unselectable submit-button" onclick="finish()">完成设置<span
                                            onclick="finish()" class="ripple"
                                            style="height: 280px; width: 280px; top: 0px; left: 0px;"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
<script type="text/javascript">

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $("#userImg").mouse(function () {
            $('.popup_user').removeClass("drop");
        })
        $(".popup_user").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $(".popup_user").mouseleave(function () {
            $('.popup_user').removeClass("drop");
        })
        $("#searchbutton").click(function () {
            var key = $("#info").val();
            window.location.href = "/guest/search?info=" + key;
        });
    });

    function toAllCreate(userId) {
        window.location.href="/user/usercreated?userId="+userId;
    }

</script>
<script type="text/javascript">
    function playAll() {
        window.open("/guest/playAll");
    }

    function playAllSheet(sheetId) {
        window.open("/guest/playSheet?sheetId=" + sheetId);
    }

    function playAllAlbum(albumId) {
        window.open("/guest/playAlbum?albumId=" + albumId);
    }

    function playSong(songId) {
        window.open("/guest/playSong?id=" + songId);
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
</html>