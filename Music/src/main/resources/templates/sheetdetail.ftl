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
    <link rel="stylesheet" href="/css/head2.css">
    <link rel="stylesheet" href="/mystatic/kuwocss.css">

    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.min.js"></script>
</head>
<body>

<!--header start-->
<header class="header">
    <div class="header-box">
        <h1 class="header-title">
            <a href="javascript:;"><img class="logo-img" src="/image/logo.png" alt="QQ音乐"></a>
            <#--                <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>-->
        </h1>
        <ul class="header-top-nav">
            <li class="top-nav-item active"><a href="/guest/index" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
            <li class="top-nav-item"><a href="/guest/rank" class="tnav-link" title="音乐号">排行榜</a></li>
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

<div class="main">

    <div class="mod_data" itemscope="" itemtype="">
        <!-- 自建歌单用a标签 -->

        <span class="data__cover" id="logo">
                <img src="/upload/${sheetDetail.sheetImg}"
                     class="data__photo">
            </span>
        <div class="data__cont">
            <div class="data__name js_box" data-type="p_title">
                <h1 title="" id="p_name_show">${sheetDetail.sheetName}</h1>
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
                <li class="data_info__item">播放量：
                    <#if (sheetDetail.playCount>=10000)>
                    ${(sheetDetail.playCount/10000)? int}万
                </li>
                <#else >
                    ${sheetDetail.playCount}</li>
                </#if>
                <li class="data_info__item">收藏量：
                    <#if (sheetDetail.support>=10000)>
                    ${(sheetDetail.support/10000)? int}万
                </li>
            <#else >
                ${sheetDetail.support}</li>
                </#if>
                </li>
            </ul>

            <div class="data__actions" role="toolbar">
                <a onclick="playAllSheet(${sheetDetail.id})" class="mod_btn_green js_all_play"
                   data-stat="y_new.gedan.header.playall"><i
                            class="mod_btn_green__icon_play"></i>播放全部</a>
                <a onclick="moreope(this)" class="mod_btn js_more" data-stat="y_new.gedan.header.more"
                   data-id="1189673367"><i
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
                    <#if sheetsonglist ?exists>
                    <#list sheetDetail as detail>
                        <#if (detail_index%2==0)>
                            <li ix="${detail.getSong().getSongId()}">

                                <div class="songlist__item"
                                     onmouseover="this.className=(this.className+' songlist__item--hover')"
                                     onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                                    <div class="songlist__edit songlist__edit--check sprite">
                                        <input type="checkbox" class="songlist__checkbox">
                                    </div>
                                    <div class="songlist__number">${detail_index+1}</div>
                                    <div class="songlist__songname">


                                <span class="songlist__songname_txt"><a
                                            href="/guest/songDetail?songId=${detail.getSong().songId}" class="js_song"
                                    >${detail.getSong().song_name}<span
                                                class="songlist__song_txt"></span></a></span>
                                        <div class="mod_list_menu">
                                            <a class="list_menu__item list_menu__play js_play"
                                               title="播放">
                                                <i class="list_menu__icon_play"
                                                   onclick="playSong(${detail.getSong().songId})"></i>
                                                <span class="icon_txt">播放</span>
                                            </a>
                                            <a onclick="addtosheet(this)" class="list_menu__item list_menu__add js_fav"
                                               title="添加到歌单"
                                               aria-haspopup="true" data-target="menu_add">
                                                <i class="list_menu__icon_add"></i>
                                                <span class="icon_txt">添加到歌单</span>
                                            </a>

                                            <a onclick="singledown(${detail.getSong().songId})"
                                               class="list_menu__item list_menu__down js_down"
                                               title="下载"
                                               aria-haspopup="true" data-target="menu_down">
                                                <i class="list_menu__icon_down"
                                                   onclick="singledown(${detail.getSong().songId})"></i>
                                                <span class="icon_txt">下载</span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="songlist__artist">


                                        <a href="/guest/singerDetail?singerId=${detail.getSong().getSinger().id}"
                                           data-singermid="003QznRR2ry01V" data-singerid="162021" title="叶洛洛"
                                           class="singer_name">${detail.getSong().getSinger().singerName}</a>

                                    </div>
                                    <div class="songlist__album">
                                        <a href="/guest/albumDetail?albumId=${detail.getSong().getAlbum().albumId}"
                                           title="叶洛洛の音乐电台"
                                           class="album_name" data-albummid="001SCsj43L6kd5"
                                           data-albumid="6938999">${detail.getSong().getAlbum().albumName}</a>
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
                            <li ix="${detail.getSong().getSongId()}">

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
                                                    title="墨书 ">${detail.getSong().song_name}<span
                                                        class="songlist__song_txt"></span></a></span>
                                        <div class="mod_list_menu">
                                            <a onclick="playSong(${detail.getSong().songId})"
                                               class="list_menu__item list_menu__play js_play"
                                               title="播放">
                                                <i class="list_menu__icon_play"
                                                   onclick="playSong(${detail.getSong().songId})"></i>
                                                <span class="icon_txt">播放</span>
                                            </a>
                                            <a onclick="addtosheet(this,${detail.getSong().songId})"
                                               class="list_menu__item list_menu__add js_fav"
                                               title="添加到歌单"
                                               aria-haspopup="true" data-target="menu_add">
                                                <i class="list_menu__icon_add"></i>
                                                <span class="icon_txt">添加到歌单</span>
                                            </a>

                                            <a href="javascript:;" class="list_menu__item list_menu__down js_down"
                                               title="下载"
                                               aria-haspopup="true" data-target="menu_down">
                                                <i class="list_menu__icon_down"
                                                   onclick="download(${detail.getSong().songId})"></i>
                                                <span class="icon_txt">下载</span>
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
                                           data-albumid="7836997">${detail.getSong().getAlbum().albumName}</a>
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
                        <#else >
                            <div class="none_txt">
                                <i class="none_txt__symbol"></i>
                                <p>什么都没有</p>
                            </div>
                    </#if>
                </ul>
            </div>


        </div>
        <div class="detail_layout__other">

            <div class="mod_about js_box" id="album_desc" style="display:block;">
                <h3 class="about__tit">简介</h3>
                <div >
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
                <#if others ? exists>
                <#list others as other>
                    <li class="playlist__item" onmouseover="this.className=(this.className+' playlist__item--hover')"
                        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a
                                        onclick="playAllSheet(${other.id})" class="js_album"
                                        data-stat="y_new.singer.index.album_pic" data-albummid="004fXSyj3bWTMN"
                                ><img
                                            src="/upload/${other.sheetImg}"

                                            class="playlist__pic"><i class="mod_cover__icon_play js_play"
                                                                     data-stat="y_new.singer.index.album_play"></i></a>
                            </div>
                            <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                            href="/guest/sheetDetail?sheetId=${other.id}"
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
                    <#else >
                        <div class="none_txt">
                            <i class="none_txt__symbol"></i>
                            <p>什么都没有</p>
                        </div>
                </#if>
            </ul>
        </div>
    </div>
    <div class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">相似歌单</h2>


        </div>
        <div class="mod_playlist">
            <ul class="playlist__list" id="albumlist">
                <#if likes ? exists>
                <#list likes as like>
                    <li class="playlist__item" onmouseover="this.className=(this.className+' playlist__item--hover')"
                        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover"><a
                                        onclick="playAllSheet(${like.id})" class="js_album"
                                        data-stat="y_new.singer.index.album_pic" data-albummid="004fXSyj3bWTMN"
                                ><img
                                            src="/upload/${like.sheetImg}"

                                            class="playlist__pic"><i class="mod_cover__icon_play js_play"
                                                                     data-stat="y_new.singer.index.album_play"></i></a>
                            </div>
                            <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                            href="/guest/detail?sheetId=${like.id}"
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
                    <#else >
                        <div class="none_txt">
                            <i class="none_txt__symbol"></i>
                            <p>什么都没有</p>
                        </div>
                </#if>
            </ul>
        </div>
    </div>
</div>


<!-- 跟头图保持一致 -->
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
                                        <div class="form-block form-extra"><a class="right">忘记密码？</a><a
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
                                <form>
                                    <div class="agreement-content">
                                        <div class="form-block"><label for="mobile">手机号</label>
                                            <div class="form-input-inline">
                                                <div class="country-code unselectable">
                                                    <div class="select">
                                                        <div>
                                                            <div class="button unselectable selector">+86<span
                                                                        class="iconfont selector-icon"></span><span
                                                                        class="ripple"
                                                                        style="height: 80px; width: 80px; top: 0px; left: 0px;"></span>
                                                            </div>
                                                        </div>
                                                        <div class="react-contextmenu-wrapper">
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input id="mobile" type="tel" placeholder="请输入手机号" autocomplete="off"
                                                       autocorrect="off" autocapitalize="off" spellcheck="false"
                                                       maxlength="11" class=""></div>
                                        </div>
                                        <div class="form-block"><label for="smsCode">验证码</label>
                                            <div class="form-input-inline"><input id="smsCode" type="text"
                                                                                  placeholder="请输入验证码" maxlength="6"
                                                                                  pattern="\d*" class="" value="">
                                                <div class="sms-code">
                                                    <button disabled="">发送验证码</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-block form-action">
                                            <button id="agreement-submit">下一步</button>
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
        <div class="modal-inner"><span class="close-btn iconfont white left"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-register-wrapper">
                            <div id="register-container">
                                <div class="register-title">新用户注册<em>请输入6-12位密码</em></div>
                                <form>
                                    <div class="register-pwd">
                                        <div class="form-block"><label for="password">密码</label><input id="password"
                                                                                                       type="password"
                                                                                                       placeholder="请输入你要设定的密码"
                                                                                                       autocomplete="off"
                                                                                                       class=""></div>
                                        <div class="form-block"><label for="pw2">重复密码</label><input id="pw2"
                                                                                                    type="password"
                                                                                                    placeholder="再输入一次你设定的密码"
                                                                                                    autocomplete="off"
                                                                                                    class=""></div>
                                        <div class="form-block form-action">
                                            <button id="register-submit">完成注册</button>
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
<#include "footer.ftl">
<!-- 添加到 -->
<div class="mod_operate_menu js_menu_box" id="first_menu_1" data-aria="popup"
     style="left: 790px; top: 442px; display: none;">
    <div class="operate_menu__cont">
        <ul role="menu" class="operate_menu__list">
            <li class="operate_menu__item"><a
                        onclick="toCollect()"
                        class="operate_menu__link js_menu_fav"
                        data-target="menu_sub_add"><i
                            class="operate_menu__icon_add sprite"></i>收藏歌单</a>
            </li>
            <li class="operate_menu__item"><a onclick="alldownsong()"
                                              class="operate_menu__link js_menu_down"><i
                            class="operate_menu__icon_down sprite"></i>下载</a></li>
            <#if myCreateSheet? exists>
                <#list myCreateSheet as mycreate>
                    <#if mycreate.getId()==sheetDetail.getId()>
                        <a onclick="deleteSheet(${sheetDetail.getId()})" class="operate_menu__link js_addto_new"><i
                                    class="operate_menu__icon_add sprite"></i>删除</a>
                    <#break>
                    </#if>
                </#list>
            </#if>
        </ul>
    </div>
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
                    class="operate_menu__icon_add sprite"></i>创建新歌单</a>
    </div>
</div>
</body>
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

    function singledown(songId) {
        <#if Session['user'] ? exists>
        window.location.href = "/user/downsinglesong?id=" + songId;
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>
    }

    function moreope(t) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;
        <#if Session['user'] ? exists>
        $("#first_menu_1").css("left", left + 15 + "px");
        $("#first_menu_1").css("top", top + 20 + "px");
        $("#first_menu_1").css("display", "block");
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>
    }

    function toCollect() {
        var sheetId = '${sheetDetail.id}';
        $.ajax({
            url: '/user/toCollect',
            type: 'GET',
            traditional: true,
            data: {
                'sheetId': sheetId,
            },
            success: function (data) {
                layer.msg(data);
            }
        });
    }

    function addtosheet(t, songId) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;

        <#if Session['user'] ? exists>
        $("#fav_pop").css("left", left + 20 + "px");
        $("#fav_pop").css("top", top + "px");
        $("#fav_pop").css("display", "block");
        $("#fav_pop").data("songId", songId);
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        </#if>
    }

    function loginout() {
        $.ajax({
            url: '/user/loginout',
            type: 'GET',
            traditional: true,
            success: function (data) {
                layer.msg(data);
                location.reload();
            }
        });
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

    function deleteSheet(sheetId) {
        $.ajax({
            url: '/user/deletesheet',
            type: 'GET',
            traditional: true,
            data: {
                'sheetId': sheetId,
            },
            success: function (data) {
                layer.msg(data);
                window.location.href="/guest/index";
            }
        });
    }

    function alldownsong() {
        var songIdList = [];
        <#if Session['user'] ? exists>
        $(".songlist__list li").each(
            function (index, item) {
                songIdList.push($(item).attr("ix"));
            }
        );
        window.location.href = "/user/downsongbyids?ids=" + songIdList;
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>

    }

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $(".popup_user").mouseleave(function () {
            $('.popup_user').removeClass("drop");
        })
        $("#fav_pop").mouseleave(function () {
            $("#fav_pop").css("display", "none");
        });
        $("#first_menu_1").mouseleave(function () {
            $("#first_menu_1").css("display", "none");
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        layui.use('layer', function () {
            var layer = layui.layer;
        });
        $('#account-login-submit').click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            var sheetId = '${sheetDetail.id}';
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
                        window.location.replace("/guest/sheetDetail?sheetId=" + sheetId);
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
        });
        $("#cancel2").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
        });
    });
</script>
</html>
