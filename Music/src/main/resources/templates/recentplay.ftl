<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta name="applicable-device" content="pc">
    <title>最近播放</title>
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

<body data-spm="12028340">
<div id="app">
    <div class="page-container">
        <div class="content-wrapper">
            <div class="recent-view view-without-leftbar">
                <div class="recent-header"><h2>最近播放</h2>
                    <div class="tabs unselectable">
                        <div class="tab active">歌曲
                            <#if recentPlay ?exists>
                                ${recentPlay ?size}
                            </#if>
                        </div>
                    </div>
                </div>
                <div class="recent-action" data-spm-anchor-id="a2oj1.12028364.0.i0.2bca279109pyWD">
                    <div class="button unselectable random remarkable" onclick="recentAllPlay()"><span class="iconfont"></span>全部播放<span
                                class="ripple" style="height: 130px; width: 130px; top: 0px; left: 0px;"></span></div>
                    <div class="button unselectable" onclick="alldown()">全部下载<span class="ripple"
                                                                                   style="height: 105px; width: 105px; top: 0px; left: 0px;"></span>
                    </div>
                </div>
                <#if recentPlay? exists>
                    <div class="recent-content">
                        <div class="table idle song-table">
                            <div class="table-container">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="th-index" style="width: 8%;">#</th>
                                        <th class="th-songName" style="width: 23%;">歌曲</th>
                                        <th class="th-artist" style="width: 23%;">歌手</th>
                                        <th class="th-album" style="width: 23%;">专辑</th>
                                        <th class="th-duration" style="width: 23%;">时长</th>
                                    </tr>
                                    <tr class="division">
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if recentPlay? exists>
                                        <#list recentPlay as recent>
                                            <#if (recent_index%2==0)>
                                                <tr class="even">
                                                    <td>
                                                        <div class="index-container"><span
                                                                    class="em index">${recent_index+1}</span>
                                                            <div class="audio-icon unselectable">
                                                                <div class="column paused"
                                                                     style="animation-delay: -1.2s;"></div>
                                                                <div class="column paused"></div>
                                                                <div class="column paused"
                                                                     style="animation-delay: -1.5s;"></div>
                                                                <div class="column paused"
                                                                     style="animation-delay: -0.9s;"></div>
                                                                <div class="column paused"
                                                                     style="animation-delay: -0.6s;"></div>
                                                            </div>
                                                            <div class="iconfont play-btn"
                                                                 onclick="playSong(${recent.songId})">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="songName-container">
                                                            <div class="with-mv-icon">
                                                                <div class="custom-content">
                                                                    <div class="song-name em"><a
                                                                                href="/guest/songDetail?songId=${recent.songId}">${recent.song_name}</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="artist-container">
                                                            <div class="singers"><a
                                                                        href="/guest/singerDetail?singerId=${recent.getSinger().id}">${recent.getSinger().singerName}</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="album-container">
                                                            <div class="album"><a
                                                                        href="/guest/albumDetail?albumId=${recent.getAlbum().albumId}">${recent.getAlbum().albumName}</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="duration-container ops-container"><span
                                                                    class="duration">${recent.song_time}</span>
                                                            <div class="operations ops-right">
                                                                <div class="ops-item">
                                                                    <div class="iconfont"
                                                                         onclick="downSingle(${recent.songId})">
                                                                    </div>
                                                                </div>
                                                                <div class="ops-item">
                                                                    <div class="iconfont"
                                                                         onclick="addtosheet(this,${recent.songId})">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <#else >
                                                <tr class="odd">
                                                    <td>
                                                        <div class="index-container"><span
                                                                    class="em index">${recent_index+1}</span>
                                                            <div class="audio-icon unselectable">
                                                                <div class="column paused"
                                                                     style="animation-delay: -1.2s;"></div>
                                                                <div class="column paused"></div>
                                                                <div class="column paused"
                                                                     style="animation-delay: -1.5s;"></div>
                                                                <div class="column paused"
                                                                     style="animation-delay: -0.9s;"></div>
                                                                <div class="column paused"
                                                                     style="animation-delay: -0.6s;"></div>
                                                            </div>
                                                            <div class="iconfont play-btn"
                                                                 onclick="playSong(${recent.songId})">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="songName-container">
                                                            <div class="with-mv-icon">
                                                                <div class="custom-content">
                                                                    <div class="song-name em"><a
                                                                                href="/guest/songDetail?songId=${recent.songId}">${recent.song_name}</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="artist-container">
                                                            <div class="singers"><a
                                                                        href="/guest/singerDetail?singerId=${recent.getSinger().id}">${recent.getSinger().singerName}</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="album-container">
                                                            <div class="album"><a
                                                                        href="/guest/albumDetail?albumId=${recent.getAlbum().albumId}">${recent.getAlbum().getAlbumName()}</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="duration-container ops-container"><span
                                                                    class="duration">${recent.song_time}</span>
                                                            <div class="operations ops-right">
                                                                <div class="ops-item">
                                                                    <div class="iconfont"
                                                                         onclick="downSingle(${recent.songId})">
                                                                    </div>
                                                                </div>
                                                                <div class="ops-item">
                                                                    <div class="iconfont"
                                                                         onclick="addtosheet(this,${recent.songId})">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </#if>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <#else >
                    <div class="none_txt" style="display:block;">
                        <i class="none_txt__symbol"></i>
                        <p>什么都没有</p>
                    </div>
                </#if>

            </div>
            <div style="clear:both"></div>
        </div>

    </div>

    <footer class="footer-container">
        <div class="section-container">
            <div class="footer-copyright">
                <p class="copyright-p">
                <h3 target="_blank" title="隐私政策">我的音乐</h3>
                </p>
            </div>
        </div>
    </footer>
</div>
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
                    class="operate_menu__icon_add sprite"></i>添加到新歌单</a>
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
<#include "footer.ftl">
</body>
<script type="text/javascript">
    function playSong(songId) {
        window.open("/guest/playSong?id=" + songId);
    }

    function recentAllPlay() {
        window.open("/user/recentallplay");
    }
</script>
<script type="text/javascript">
    function alldown() {
        //获取所有被选的图片的名称与绝对路径放入数组
        var imgNameList = [];
        var imgUrlList = [];
        <#if recentPlay ? exists>
        <#list recentPlay as collection>
        var tempname = '${collection.getSong_file()}';
        var temp = tempname.split('.');
        var suffix = temp[temp.length - 1];
        imgNameList.push('${collection.song_name}' + '.' + suffix);
        imgUrlList.push("D:/MUSICRESOURCE/yinpin/" + '${collection.song_file}');
        </#list>
        </#if>

        <#--       -->
        var paths = encodeURI(encodeURI(imgUrlList));
        var names = encodeURI(encodeURI(imgNameList));
        //将名称传入后台
        window.location.href = "/user/downsong?names=" + names + "&paths=" + paths;
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
            data: {
                'sheetId': sheetId,
                'songId': songId,
            },
            success: function (data) {
                layer.msg(data);
            }
        });
    }

    function downSingle(id) {
        <#if Session["user"] ? exists>
        window.location.href = "/user/downsinglesong?id=" + id;
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        </#if>
    }

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $(".popup_user").mouseleave(function () {
            $('.popup_user').removeClass("drop");
        })
        $("#searchbutton").click(function () {
            var key = $("#info").val();
            window.location.href = "/guest/search?info=" + key;
        });

        $("#fav_pop").mouseleave(function () {
            $("#fav_pop").css("display", 'none');
        });
    });

</script>


</html>
