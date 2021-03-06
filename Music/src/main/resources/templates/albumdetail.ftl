<html lang="zh-cn">
<head>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript"  src="/layui/layui.js"></script>
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
<body >
<!-- 头部 S -->

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
            <li class="sec-nav-item "><a href="/guest/index" class="nav-link">首页</a></li>
            <li class="sec-nav-item"><a href="/guest/singerlist" class="nav-link">歌手</a></li>
            <li class="sec-nav-item active"><a href="/guest/albumlist" class="nav-link">专辑</a></li>
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
    <div class="mod_data" itemscope="" >
            <span class="data__cover">
                <img id="albumImg"
                     src="/upload/${album.album_img}"
                      class="data__photo">
                <i class="data__cover_mask"></i>
            </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" >${album.albumName}</h1>
            </div>

            <div class="data__singer">
                <i class="icon_singer sprite"></i><a href="//y.qq.com/n/yqq/singer/001C0c6j1VyLfh.html"
                                                     class="js_singer data__singer_txt" itemprop="byArtist"
                                                     data-id="001C0c6j1VyLfh" data-stat="y_new.album.header.singername"
                                                     data-mid="001C0c6j1VyLfh"
                                                     title="黑龙">${album.getSinger().singerName}</a>
            </div>

            <ul class="data__info">


                <li class="data_info__item">标签：<#list album.labels ? split(',') as label>${label}&emsp;</#list></li>
                <li class="data_info__item">发行时间：${album.album_release}</li>
            </ul>

            <div class="data__actions" role="toolbar">

                <a onclick="playAllAlbum(${album.albumId})" class="mod_btn_green js_all_play"
                   data-stat="y_new.album.header.playall"><i class="mod_btn_green__icon_play"></i>播放全部</a>
                <a onclick="AllAddToSheet(this)"
               class="mod_btn js_more" data-mid="002ap9w33aAKKP" data-id="9381415"
                   data-stat="y_new.album.header.more"><i class="mod_btn__icon_add"></i>添加到</a>
                <a onclick="alldownsong()" class="mod_btn js_more" data-mid="002ap9w33aAKKP" data-id="9381415"
                   data-stat="y_new.album.header.more"><i class="mod_btn__icon_menu"></i>下载</a>
                <a id="batchope" class="mod_btn js_more" data-mid="002ap9w33aAKKP" data-id="9381415"
                   data-stat="y_new.album.header.more"><i class="mod_btn__icon_batch"></i>批量操作</a>
            </div>
        </div>
    </div>
    <div class="detail_layout">
        <div class="detail_layout__main">

            <div class="mod_songlist" id="songList">
                <ul class="songlist__header">
                    <li class="songlist__edit songlist__edit--check sprite">
                        <input type="checkbox" class="songlist__checkbox js_check_all">
                    </li>
                    <li class="songlist__header_name">歌曲</li>
                    <li class="songlist__header_author">歌手</li>
                    <li class="songlist__header_time">时长</li>
                </ul>


                <ul class="songlist__list" id="song_box">
                    <#list album.getDetails() as detail>
                        <#if (detail_index%2==0)>
                            <li mid="245520530" ix="${detail.songId}">
                                <div class="songlist__item">
                                    <div class="songlist__edit songlist__edit--check sprite">
                                        <input type="checkbox" class="songlist__checkbox">
                                    </div>
                                    <div class="songlist__number">${detail_index+1}</div>
                                    <div class="songlist__songname">

<#--                                        <i class="songlist__icon songlist__icon_exclusive sprite" title="独家"></i>-->


                                        <span class="songlist__songname_txt"><a
                                                    href="/guest/songDetail?songId=${detail.getSong().songId}"
                                                   >${detail.getSong().song_name}</a></span>
                                        <div class="mod_list_menu">
                                            <a onclick="playSong(${detail.getSong().songId})"
                                               class="list_menu__item list_menu__play js_play" title="播放">
                                                <i class="list_menu__icon_play"></i>
                                                <span class="icon_txt">播放</span>
                                            </a>
                                            <a onclick="addtosheet(this,${detail.getSong().songId})" class="list_menu__item list_menu__add js_fav"
                                               title="添加到歌单"
                                               aria-haspopup="true" data-target="menu_add">
                                                <i class="list_menu__icon_add"></i>
                                                <span class="icon_txt">添加到歌单</span>
                                            </a>

                                            <a onclick="downSingle(${detail.getSong().songId})" class="list_menu__item list_menu__down js_down"
                                               title="下载"
                                               aria-haspopup="true" data-target="menu_down">
                                                <i class="list_menu__icon_down"></i>
                                                <span class="icon_txt">下载</span>
                                            </a>

                                        </div>
                                    </div>
                                    <div class="songlist__artist">


                                        <a href="//y.qq.com/n/yqq/singer/001C0c6j1VyLfh.html"
                                           class="singer_name">${detail.getSong().getSinger().singerName}</a>

                                    </div>
                                    <div class="songlist__time">${detail.getSong().song_time}</div>
                                    <div class="songlist__other">
                                    </div>
                                </div>
                            </li>

                    <#else>
                        <li mid="245520531" ix="${detail.songId}">
                            <div class="songlist__item songlist__item--even">
                                <div class="songlist__edit songlist__edit--check sprite">
                                    <input type="checkbox" class="songlist__checkbox">
                                </div>
                                <div class="songlist__number">${detail_index+1}</div>
                                <div class="songlist__songname">



                                    <span class="songlist__songname_txt"><a
                                                href="//y.qq.com/n/yqq/song/004PR70Y3XglIu.html"
                                                title="C位爱情">${detail.getSong().song_name}</a></span>
                                    <div class="mod_list_menu">
                                        <a href="//y.qq.com/portal/player.html"
                                           class="list_menu__item list_menu__play js_play" title="播放">
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

                                        <a href="javascript:;" class="list_menu__item list_menu__share js_share"
                                           title="分享"
                                           aria-haspopup="true" data-aria="menu_share">
                                            <i class="list_menu__icon_share"></i>
                                            <span class="icon_txt">分享</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="songlist__artist">


                                    <a href="//y.qq.com/n/yqq/singer/001C0c6j1VyLfh.html" title="黑龙"
                                       class="singer_name">${detail.getSong().getSinger().singerName}</a>

                                </div>
                                <div class="songlist__time">${detail.getSong().song_time}</div>
                                <div class="songlist__other">
                                </div>
                            </div>
                        </li>
                        </#if>
                    </#list>

                </ul>

            </div>

        </div>


        <div class="detail_layout__other">
            <div class="mod_about" id="album_desc" style="display:block;">
                <h3 class="about__tit">简介</h3>
                <div >
                    <p>
                        ${album.introduction}</p>
                </div>
            </div>

            <div class="other_part">
                <h3 class="other_part__tit">此歌手的其他专辑</h3>
                <div class="mod_playlist">
                    <ul class="playlist__list">
                        <#if others ? exists>
                            <#list others as other>
                                <li class="playlist__item"
                                    onmouseover="this.className=(this.className+' playlist__item--hover')"
                                    onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                                    <div class="playlist__item_box">
                                        <div class="playlist__cover mod_cover"><a
                                                    href="/guest/albumDetail?albumId=${other.albumId}" class="js_album"
                                                    data-stat="y_new.album.otheralbum.click"
                                                    data-albummid="003QG00d1xCn4N"
                                                    data-albumid="54951"><img
                                                        src="/upload/${other.album_img}"
                                                        onerror="this.src='//y.gtimg.cn/mediastyle/global/img/album_300.png?max_age=31536000';this.onerror=null;"
                                                        alt="被情伤过的女人" class="playlist__pic"><i
                                                        class="mod_cover__icon_play js_play"
                                                        data-stat="y_new.album.otheralbum.play"></i></a></div>
                                        <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                                        href="/guest/albumDetail?albumId=${album.albumId}"
                                                        class="js_album"
                                                        data-stat="y_new.album.otheralbum.click"
                                                        data-albummid="003QG00d1xCn4N"
                                                        data-albumid="54951">${other.albumName}</a></span></h4>
                                        <div class="playlist__author">
                                            ${album.album_release}
                                        </div>
                                    </div>
                                </li>
                            </#list>
                            <#else >
                                <div class="none_txt">
                                    <i class="none_txt__symbol"></i>
                                    <p>暂无其他专辑</p>
                                </div>
                        </#if>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!-- 专辑简介 -->
    <div class="popup_data_detail" id="popup_data_detail" data-aria="popup" style="display:none;z-index:10000000000;">
        <div class="popup_data_detail__cont">
            <h3 class="popup_data_detail__tit">专辑简介</h3>
            <p>
                歌手黑龙2019冬日最新单曲《C位爱情》动感来袭，一首黑龙标志性风格的歌曲正式上线。这首单曲同样也是国内知名音乐人邢榕老师也就是黑龙《38度6》的创作者为其精心制作。因二人的多次合作，所以在音乐风格把控上有了很高的水准，优秀的词曲创作加上黑龙独特的演绎风格和嗓音赋予了这首歌曲茁壮的生命力。在歌曲里爱情就好比一个巨大的华丽舞台，灯光耀眼氛围愉快。在这个舞台上人来人往，各自出演。而我对别人视而不见，只有你在我眼中C位出演。</p>
        </div>
        <i class="popup_data_detail__arrow"></i>
    </div>
</div>
<!-- 跟头图保持一致 -->




<!-- 添加到 -->
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
    function playAllAlbum(albumId) {
        window.open("/guest/playAlbum?albumId=" + albumId);
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

    function singledown(songId){
        <#if Session['user'] ? exists>
        window.location.href="/user/downsinglesong?id="+songId;
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

    function AllAddToSheet(t) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;
        var songIdList = [];
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

    }

    function addtosheet(t,songId) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;

        <#if Session['user'] ? exists>
        $("#fav_pop").css("left", left + 20 + "px");
        $("#fav_pop").css("top", top  + "px");
        $("#fav_pop").css("display", "block");
        $("#fav_pop").data("songId",songId);
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
        var songId=$("#fav_pop").data("songId");
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

    function alldownsong() {
        var songIdList = [];
        <#if Session['user'] ? exists>
        $(".songlist__list li").each(
            function (index,item) {
                songIdList.push($(item).attr("ix"));
            }
        );
        window.location.href = "/user/downsongbyids?ids="+songIdList;
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
        $("#searchbutton").click(function () {
            var key = $("#info").val();
            window.location.href = "/guest/search?info=" + key;
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