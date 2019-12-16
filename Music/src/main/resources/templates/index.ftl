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
    <link rel="stylesheet" href="/css/head.css">

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
    <link rel="stylesheet" href="/js/easyform/easyform.css">
    <script src="/js/easyform/easyform.js"></script>
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

<main>
    <!--song list recommendation start-->
    <div class="songList">
        <div class="opt-switch">
            <div class="switch-item s-left">
                <a href="javascript:;" class="switch-btn btn-left">
                    <i class="icon-arrow icon-left sprite"></i>
                </a>
            </div>
            <div class="switch-item s-right">
                <a href="javascript:;" class="switch-btn btn-right">
                    <i class="icon-arrow icon-right sprite"></i>
                </a>
            </div>
        </div>
        <div class="container">
            <div class="head-title">
                <h2 class="icon-song-list icon-txt"></h2>
            </div>
            <div class="song-tab">

            </div>
            <div class="playlist">
                <ul class="playlist-ul">
                    <#list randomSheet as sheet>
                        <li class="playlist-item">
                            <div class="item-box">
                                <a href="" onclick="playAllSheet(${sheet.id})" class="link-img">
                                    <img src="/upload/${sheet.sheetImg}" alt=""
                                         class="playlist-link-img">
                                    <i class="img-mask"></i>
                                    <i class="img-btn"></i>
                                </a>
                                <h4 class="item-title">
                                    <span><a href="/guest/sheetDetail?sheetId=${sheet.id}"><font
                                                    color="black">${sheet.introduction}</font></a></span>
                                </h4>
                                <div class="play-people">
                                    播放量：
                                    <#if (sheet.playCount>=10000)>
                                    ${(sheet.playCount/10000) ? int}万
                                        <#else >
                                            ${sheet.playCount}
                                    </#if>

                                </div>
                            </div>
                        </li>
                    </#list>
                    <#list randomSheet as sheet>
                        <li class="playlist-item">
                            <div class="item-box">
                                <a href="" onclick="playAllSheet(${sheet.id})" class="link-img">
                                    <img src="/upload/${sheet.sheetImg}" alt=""
                                         class="playlist-link-img">
                                    <i class="img-mask"></i>
                                    <i class="img-btn"></i>
                                </a>
                                <h4 class="item-title">
                                    <span><a href="/guest/sheetDetail?sheetId=${sheet.id}">${sheet.introduction}</a></span>
                                </h4>
                                <div class="play-people">
                                    播放量：
                                    <#if (sheet.playCount>=10000)>
                                    ${(sheet.playCount/10000) ? int}万
                                    <#else >
                                        ${sheet.playCount}
                                    </#if>
                                </div>
                            </div>
                        </li>
                    </#list>
                </ul>
            </div>
            <div class="bottom-point">
                <a href="javascript:;" class="bottom-point-item active">
                    <i class="point "></i>
                </a>
                <a href="javascript:;" class="bottom-point-item">
                    <i class="point"></i>
                </a>
            </div>

        </div>

    </div>
    <!--new songs first-->
    <div class="newSongs">
        <div class="section-container">
            <div class="new-songs-title">
                <h2 class="tit-box icon-txt">
                    <i class="icon-new-songs">新歌首发</i>
                </h2>
            </div>
            <a href="javascript:;" class="play-all" onclick="playAll()">
                <i class="icon-pause sprite"></i>
                播放所有
            </a>
            <div class="new-songs-tab">

            </div>
            <div class="newSongs-roll">
                <div class="ns-roll-box">

                    <ul class="newSongs-list">
                        <#list newMusices4 as newMusic4>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="" onclick="playSong(${newMusic4.songId})" class="ns-img-box">
                                        <img src="/upload/${newMusic4.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="/guest/detail?songId=${newMusic4.songId}" class="song-tit-box"
                                               title="${newMusic4.song_name} ">
                                                <font color="black"> ${newMusic4.song_name}</font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="/guest/singerDetail?singerId=${newMusic4.getSinger().id}"
                                               class="author-link"
                                               title="${newMusic4.getSinger().getSingerName()}">${newMusic4.getSinger().getSingerName()}</a>
                                        </p>
                                    </div>
                                    <div class="ns-time">${newMusic4.song_time}</div>
                                </div>
                            </li>
                        </#list>
                    </ul>

                    <ul class="newSongs-list">
                        <#list newMusices1 as newMusic1>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="javascript:;" onclick="playSong(${newMusic1.songId})" class="ns-img-box">
                                        <img src="/upload/${newMusic1.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="/guest/detail?songId=${newMusic1.songId}" class="song-tit-box"
                                               title="${newMusic1.song_name} ">
                                                <font color="black">  ${newMusic1.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="/guest/singerDetail?singerId=${newMusic1.getSinger().id}"
                                               class="author-link"
                                               title="${newMusic1.getSinger().getSingerName()}">${newMusic1.getSinger().getSingerName()}</a>
                                        </p>
                                    </div>
                                    <div class="ns-time">${newMusic1.song_time}</div>
                                </div>
                            </li>
                        </#list>
                    </ul>
                    <ul class="newSongs-list">
                        <#list newMusices2 as newMusic2>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="javascript:;" onclick="playSong(${newMusic2.songId})" class="ns-img-box">
                                        <img src="/upload/${newMusic2.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="/guest/detail?songId=${newMusic2.songId}" class="song-tit-box"
                                               title="${newMusic2.song_name} ">
                                                <font color="black">  ${newMusic2.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="/guest/singerDetail?singerId=${newMusic2.getSinger().id}"
                                               class="author-link"
                                               title="${newMusic2.getSinger().getSingerName()}">${newMusic2.getSinger().getSingerName()}</a>
                                        </p>
                                    </div>
                                    <div class="ns-time">${newMusic2.song_time}</div>
                                </div>
                            </li>
                        </#list>
                    </ul>
                    <ul class="newSongs-list">
                        <#list newMusices3 as newMusic3>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="javascript:;" onclick="playSong(${newMusic3.songId})" class="ns-img-box">
                                        <img src="/upload/${newMusic3.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="/guest/detail?songId=${newMusic3.songId}" class="song-tit-box"
                                               title="${newMusic3.song_name} ">
                                                <font color="black">  ${newMusic3.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="/guest/singerDetail?singerId=${newMusic3.getSinger().id}"
                                               class="author-link"
                                               title="${newMusic3.getSinger().getSingerName()}">${newMusic3.getSinger().getSingerName()}</a>
                                        </p>
                                    </div>
                                    <div class="ns-time">${newMusic3.song_time}</div>
                                </div>
                            </li>
                        </#list>
                    </ul>
                    <ul class="newSongs-list">
                        <#list newMusices4 as newMusic4>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="javascript:;" onclick="playSong(${newMusic4.songId})" class="ns-img-box">
                                        <img src="/upload/${newMusic4.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="/guest/detail?songId=${newMusic4.songId}" class="song-tit-box"
                                               title="${newMusic4.song_name} ">
                                                <font color="black">  ${newMusic4.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="/guest/singerDetail?singerId=${newMusic4.getSinger().id}"
                                               class="author-link"
                                               title="${newMusic4.getSinger().getSingerName()}">${newMusic4.getSinger().getSingerName()}</a>
                                        </p>
                                    </div>
                                    <div class="ns-time">${newMusic4.song_time}</div>
                                </div>
                            </li>
                        </#list>
                    </ul>
                    <ul class="newSongs-list">
                        <#list newMusices1 as newMusic1>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="javascript:;" onclick="playSong(${newMusic1.songId})" class="ns-img-box">
                                        <img src="/upload/${newMusic1.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="/guest/detail?songId=${newMusic1.songId}" class="song-tit-box"
                                               title="${newMusic1.song_name} ">
                                                <font color="black">  ${newMusic1.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="/guest/singerDetail?singerId=${newMusic1.getSinger().id}"
                                               class="author-link"
                                               title="${newMusic1.getSinger().getSingerName()}">${newMusic1.getSinger().getSingerName()}</a>
                                        </p>
                                    </div>
                                    <div class="ns-time">${newMusic1.song_time}</div>
                                </div>
                            </li>
                        </#list>
                    </ul>

                </div>
            </div>
            <div class="bottom-point">
                <a href="javascript:;" class="bottom-point-item active">
                    <i class="point "></i>
                </a>
                <a href="javascript:;" class="bottom-point-item">
                    <i class="point"></i>
                </a>
                <a href="javascript:;" class="bottom-point-item">
                    <i class="point"></i>
                </a>
                <a href="javascript:;" class="bottom-point-item">
                    <i class="point"></i>
                </a>

            </div>
        </div>
        <div class="opt-switch">
            <div class="switch-item s-left">
                <a href="javascript:;" class="switch-btn btn-left">
                    <i class="icon-arrow icon-left sprite"></i>
                </a>
            </div>
            <div class="switch-item s-right">
                <a href="javascript:;" class="switch-btn btn-right">
                    <i class="icon-arrow icon-right sprite"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="newDish">
        <div class="section-container">
            <div class="new-songs-title">
                <h2 class="tit-box2 icon-txt img-newDish">
                    <i class="icon-new-songs"></i>
                </h2>
            </div>
            <a href="/guest/albumlist" class="newDish-link">
                更多
                <i class="icon-link-arrow sprite"></i>
            </a>
            <div class="new-songs-tab">

            </div>
            <div class="newDish-roll">
                <ul class="newDish-item">
                    <#list newAlbums as newAlbum>
                        <li class="dish-list">
                            <div class="dish-list-box">
                                <a href="javascript:;" onclick="playAllAlbum(${newAlbum.albumId})" class="dish-img-box">
                                    <img src="/upload/${newAlbum.album_img}" alt="" class="dish-img">
                                    <i class="ns-img-mask"></i>
                                    <i class="icon-play play"></i>
                                </a>
                                <h4 class="dish-title">
                                    <a href="/guest/albumDetail?albumId=${newAlbum.albumId}" class="title-link"><font
                                                color="black">${newAlbum.albumName}</font></a>
                                </h4>
                                <div class="dish-author">
                                    <a href="/guest/singerDetail?singerId=${newAlbum.getSinger().id}"
                                       class="author-link"
                                       title="${newAlbum.album_singer}">${newAlbum.getSinger().singerName}</a>
                                </div>
                            </div>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
    <!--the charts start-->
    <div class="charts">
        <div class="section-container">
            <div class="new-songs-title">
                <h2 class="tit-box icon-txt img-charts">
                    <i class="icon-new-songs">排行榜</i>
                </h2>
            </div>
            <a href="/guest/rank" class="newDish-link chart-link">
                更多
                <i class="icon-link-arrow sprite"></i>
            </a>
            <div class="charts-box">
                <ul class="chart-list">
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon" onclick="platindexrank(1)"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a   class="chart-title">流行指数</a>
                            </h3>
                            <ul class="chart-songList">
                                <#list indexlist1 as list>
                                <li class="chart-song">
                                    <div class="chart-num">${list_index+1}</div>
                                    <div class="chart-name">${list.song_name}</div>
                                    <div class="chart-author">${list.getSinger().singerName}</div>
                                </li>
                                </#list>

                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon" onclick="platindexrank(2)" ></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a class="chart-title">热歌</a>
                            </h3>
                            <ul class="chart-songList">
                                <#list indexlist2 as list>
                                    <li class="chart-song">
                                        <div class="chart-num">${list_index+1}</div>
                                        <div class="chart-name">${list.song_name}</div>
                                        <div class="chart-author">${list.getSinger().singerName}</div>
                                    </li>
                                </#list>

                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon"  onclick="platindexrank(3)" ></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a class="chart-title">新歌</a>
                            </h3>
                            <ul class="chart-songList">
                                <#list indexlist3 as list>
                                    <li class="chart-song">
                                        <div class="chart-num">${list_index+1}</div>
                                        <div class="chart-name">${list.song_name}</div>
                                        <div class="chart-author">${list.getSinger().singerName}</div>
                                    </li>
                                </#list>

                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon" onclick="platindexrank(4)"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a   class="chart-title">欧美</a>
                            </h3>
                              <ul class="chart-songList">
                                <#list indexlist4 as list>
                                    <li class="chart-song">
                                        <div class="chart-num">${list_index+1}</div>
                                        <div class="chart-name">${list.song_name}</div>
                                        <div class="chart-author">${list.getSinger().singerName}</div>
                                    </li>
                                </#list>

                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon" onclick="platindexrank(5)"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a   class="chart-title">韩国</a>
                            </h3>
                            <ul class="chart-songList">
                                <#list indexlist5 as list>
                                    <li class="chart-song">
                                        <div class="chart-num">${list_index+1}</div>
                                        <div class="chart-name">${list.song_name}</div>
                                        <div class="chart-author">${list.getSinger().singerName}</div>
                                    </li>
                                </#list>

                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</main>
<#include "publiclogin.ftl">
<#include "footer.ftl">
<!--section-btn-->
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


</script>
</html>

