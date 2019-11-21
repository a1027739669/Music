<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta name="keywords" content="音乐,QQ音乐,在线听歌,音乐下载,音乐播放器,音乐网站,MV,巅峰榜,音乐排行榜,翻译歌曲,热门歌曲,经典老歌,无损音乐,无损曲库">
    <meta name="description"
          content="QQ音乐是腾讯公司推出的一款网络音乐服务产品，海量音乐在线试听、新歌热歌在线首发、歌词翻译、手机铃声下载、高品质无损音乐试听、海量无损曲库、正版音乐下载、空间背景音乐设置、MV观看等，是互联网音乐播放和下载的优选。">
    <title>QQ音乐-千万正版音乐海量无损曲库新歌热歌天天畅听的高品质音乐平台！</title>
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">
    <script src="/bin/jquery-3.4.1.js"></script>
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>

    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>

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
            });

            $(".back_setp").click(function () {
                "block" == $("#setp_quicklogin").css("display") && $("#reg_setp").animate({left: "100%"}, 500, "easeOutQuart", function () {
                    $("#reg_setp,#setp_quicklogin").hide()
                })
            });

        });
    </script>

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
            <li class="top-nav-item active"><a href="#" class="tnav-link" title="音乐馆">音乐馆</a></li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="我的音乐">我的音乐</a></li>
            <li class="top-nav-item detail-hover"><a href="#" class="tnav-link" title="客户端">客户端</a>
                <img src="./assets/img/mark_1.png" alt="" class="top-nav-img">
                <div class="nav-item-detail">
                    <p>
                        <i class="detail-icon icon-hd"></i>HQ高品质 全员开启
                    </p>
                    <p>
                        <i class="detail-icon icon-du"> </i>独家音效 全面升级
                    </p>
                    <p>
                        <i class="detail-icon icon-cloth"></i>轻盈视觉 动态皮肤
                    </p>
                    <a href="javascript:;" class="client-download">下载体验</a>
                </div>
            </li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="音乐号">音乐号</a></li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="VIP">VIP</a></li>
        </ul>
        <#--            <ul class="header-sec-nav">-->
        <#--                <li class="sec-nav-item active"><a href="#" class="nav-link">首页</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">歌手</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">新碟</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">排行榜</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">分类菜单</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">电台</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">MV</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">数字专辑</a></li>-->
        <#--                <li class="sec-nav-item"><a href="#" class="nav-link">票务</a></li>-->
        <#--            </ul>-->
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
                            <a href="#" class="hot-link">
                                <span class="hot-num">1</span>
                                <span class="hot-name">野狼disco</span>
                                <span class="hot-people">101.6w</span>
                            </a>
                            <a href="#" class="hot-link">
                                <span class="hot-num">2</span>
                                <span class="hot-name">那个女孩</span>
                                <span class="hot-people">82.2w</span>
                            </a>
                            <a href="#" class="hot-link">
                                <span class="hot-num">3</span>
                                <span class="hot-name">大田后生仔</span>
                                <span class="hot-people">66.1w</span>
                            </a>
                            <a href="#" class="hot-link">
                                <span class="hot-num">4</span>
                                <span class="hot-name">许嵩</span>
                                <span class="hot-people">65.8w</span>
                            </a>
                            <a href="#" class="hot-link">
                                <span class="hot-num">5</span>
                                <span class="hot-name">遗憾</span>
                                <span class="hot-people">43.9w</span>
                            </a>
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
            <a href="javascript:;" class="h-login" id="openlogin">登录</a>
            <div class="login-mark"></div>
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
            <form action="/guest/login" method="post" id="login_form">
                <div class="logininput">
                    <input type="text" name="username" class="loginusername" value="" placeholder="手机/用户名"/>
                    <input type="password" name="password" class="loginuserpasswordt" value="" placeholder="密码"/>
                </div>
                <div class="loginbtn">
                    <div class="loginsubmit fl"><input type="submit" value="登录" class="btn" /></div>
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
                <a href="javascript:;" class="tab-item active">为你推荐</a>
                <a href="javascript:;" class="tab-item">运动</a>
                <a href="javascript:;" class="tab-item">背景音乐</a>
                <a href="javascript:;" class="tab-item">网络歌曲</a>
                <a href="javascript:;" class="tab-item">官方歌单</a>
                <a href="javascript:;" class="tab-item">情歌</a>
            </div>
            <div class="playlist">
                <ul class="playlist-ul">
                    <#list randomSheet as sheet>
                        <li class="playlist-item">
                            <div class="item-box">
                                <a href="javascript:;" class="link-img">
                                    <img src="/upload/${sheet.sheetImg}" alt=""
                                         class="playlist-link-img">
                                    <i class="img-mask"></i>
                                    <i class="img-btn"></i>
                                </a>
                                <h4 class="item-title">
                                    <span><a href="javascript:;"><font
                                                    color="black">${sheet.introduction}</font></a></span>
                                </h4>
                                <div class="play-people">
                                    播放量：${sheet.support}万
                                </div>
                            </div>
                        </li>
                    </#list>
                    <#list randomSheet as sheet>
                        <li class="playlist-item">
                            <div class="item-box">
                                <a href="javascript:;" class="link-img">
                                    <img src="/upload/${sheet.sheetImg}" alt=""
                                         class="playlist-link-img">
                                    <i class="img-mask"></i>
                                    <i class="img-btn"></i>
                                </a>
                                <h4 class="item-title">
                                    <span><a href="javascript:;">${sheet.introduction}</a></span>
                                </h4>
                                <div class="play-people">
                                    播放量：${sheet.support}万
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
                <a href="javascript:;" class="ns-tab-item active">最新</a>
                <a href="javascript:;" class="ns-tab-item">内地</a>
                <a href="javascript:;" class="ns-tab-item">港台</a>
                <a href="javascript:;" class="ns-tab-item">欧美</a>
                <a href="javascript:;" class="ns-tab-item">韩国</a>
                <a href="javascript:;" class="ns-tab-item">日本</a>
            </div>
            <div class="newSongs-roll">
                <div class="ns-roll-box">

                    <ul class="newSongs-list">
                        <#list newMusices4 as newMusic4>
                            <li class="newSongs-item">
                                <div class="newSongs-item-box">
                                    <a href="javascript:;" class="ns-img-box">
                                        <img src="/upload/${newMusic4.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="javascript:;" class="song-tit-box" title="${newMusic4.song_name} ">
                                                <font color="black"> ${newMusic4.song_name}</font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="javascript:;" class="author-link"
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
                                    <a href="javascript:;" class="ns-img-box">
                                        <img src="/upload/${newMusic1.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="javascript:;" class="song-tit-box" title="${newMusic1.song_name} ">
                                                <font color="black">  ${newMusic1.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="javascript:;" class="author-link"
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
                                    <a href="javascript:;" class="ns-img-box">
                                        <img src="/upload/${newMusic2.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="javascript:;" class="song-tit-box" title="${newMusic2.song_name} ">
                                                <font color="black">  ${newMusic2.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="javascript:;" class="author-link"
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
                                    <a href="javascript:;" class="ns-img-box">
                                        <img src="/upload/${newMusic3.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="javascript:;" class="song-tit-box" title="${newMusic3.song_name} ">
                                                <font color="black">  ${newMusic3.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="javascript:;" class="author-link"
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
                                    <a href="javascript:;" class="ns-img-box">
                                        <img src="/upload/${newMusic4.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="javascript:;" class="song-tit-box" title="${newMusic4.song_name} ">
                                                <font color="black">  ${newMusic4.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="javascript:;" class="author-link"
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
                                    <a href="javascript:;" class="ns-img-box">
                                        <img src="/upload/${newMusic1.song_img}" alt="">
                                        <i class="ns-img-mask"></i>
                                        <i class="ns-play-btn"></i>
                                    </a>
                                    <div class="song-content">
                                        <h3 class="song-title">
                                            <a href="javascript:;" class="song-tit-box" title="${newMusic1.song_name} ">
                                                <font color="black">  ${newMusic1.song_name}   </font>
                                            </a>
                                        </h3>
                                        <p class="ns-author">
                                            <a href="javascript:;" class="author-link"
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
    <!--wonderful recommendation start-->
    <#--    <div class="wonderful">-->
    <#--        <div class="section-container">-->
    <#--            <div class="new-songs-title">-->
    <#--                <h2 class="tit-box icon-txt img-wonderful">-->
    <#--                    <i class="icon-new-songs">精彩推荐</i>-->
    <#--                </h2>-->
    <#--            </div>-->
    <#--            <div class="wonderful-roll">-->
    <#--                <div class="ns-roll-box">-->
    <#--                    <ul class="roll-item">-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_41.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_42.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                    </ul>-->

    <#--                    <ul class="roll-item">-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_11.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_12.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                    </ul>-->
    <#--                    <ul class="roll-item">-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_21.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_22.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                    </ul>-->
    <#--                    <ul class="roll-item">-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_31.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_32.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                    </ul>-->
    <#--                    <ul class="roll-item">-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_41.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_42.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                    </ul>-->

    <#--                    <ul class="roll-item">-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_11.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                        <li class="roll-li"><a href="javascript:;" class="roll-links"><img src="./assets/img/wr_12.jpg"-->
    <#--                                                                                           alt="" class="roll-img"></a>-->
    <#--                        </li>-->
    <#--                    </ul>-->
    <#--                </div>-->
    <#--            </div>-->
    <#--            <div class="bottom-point">-->
    <#--                <a href="javascript:;" class="bottom-point-item active">-->
    <#--                    <i class="point "></i>-->
    <#--                </a>-->
    <#--                <a href="javascript:;" class="bottom-point-item">-->
    <#--                    <i class="point"></i>-->
    <#--                </a>-->
    <#--                <a href="javascript:;" class="bottom-point-item">-->
    <#--                    <i class="point"></i>-->
    <#--                </a>-->
    <#--                <a href="javascript:;" class="bottom-point-item">-->
    <#--                    <i class="point"></i>-->
    <#--                </a>-->

    <#--            </div>-->
    <#--        </div>-->
    <#--        <div class="opt-switch">-->
    <#--            <div class="switch-item s-left">-->
    <#--                <a href="javascript:;" class="switch-btn btn-left">-->
    <#--                    <i class="icon-arrow icon-left sprite"></i>-->
    <#--                </a>-->
    <#--            </div>-->
    <#--            <div class="switch-item s-right">-->
    <#--                <a href="javascript:;" class="switch-btn btn-right">-->
    <#--                    <i class="icon-arrow icon-right sprite"></i>-->
    <#--                </a>-->
    <#--            </div>-->
    <#--        </div>-->
    <#--    </div>-->
    <!--new dish first-->
    <div class="newDish">
        <div class="section-container">
            <div class="new-songs-title">
                <h2 class="tit-box2 icon-txt img-newDish">
                    <i class="icon-new-songs"></i>
                </h2>
            </div>
            <a href="javascript:;" class="newDish-link">
                更多
                <i class="icon-link-arrow sprite"></i>
            </a>
            <div class="new-songs-tab">
                <a href="javascript:;" class="ns-tab-item active">内地</a>
                <a href="javascript:;" class="ns-tab-item">港台</a>
                <a href="javascript:;" class="ns-tab-item">欧美</a>
                <a href="javascript:;" class="ns-tab-item">韩国</a>
                <a href="javascript:;" class="ns-tab-item">日本</a>
                <a href="javascript:;" class="ns-tab-item">其他</a>
            </div>
            <div class="newDish-roll">
                <ul class="newDish-item">
                    <#list newAlbums as newAlbum>
                        <li class="dish-list">
                            <div class="dish-list-box">
                                <a href="javascript:;" class="dish-img-box">
                                    <img src="/upload/${newAlbum.album_img}" alt="" class="dish-img">
                                    <i class="ns-img-mask"></i>
                                    <i class="icon-play play"></i>
                                </a>
                                <h4 class="dish-title">
                                    <a href="javascript:;" class="title-link"><font
                                                color="black">${newAlbum.album_name}</font></a>
                                </h4>
                                <div class="dish-author">
                                    <a href="javascript:;" class="author-link"
                                       title="${newAlbum.album_singer}">${newAlbum.album_singer}</a>
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
            <a href="javascript:;" class="newDish-link chart-link">
                更多
                <i class="icon-link-arrow sprite"></i>
            </a>
            <div class="charts-box">
                <ul class="chart-list">
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a href="javascript:;" class="chart-title">流行指数</a>
                            </h3>
                            <ul class="chart-songList">
                                <li class="chart-song">
                                    <div class="chart-num">1</div>
                                    <div class="chart-name">那什么</div>
                                    <div class="chart-author">永彬Ryan.B/李晧轩</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">2</div>
                                    <div class="chart-name">这就是爱情</div>
                                    <div class="chart-author">李代沫</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">3</div>
                                    <div class="chart-name">Lose You To Love Me</div>
                                    <div class="chart-author">Selena Gomez</div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a href="javascript:;" class="chart-title">热歌</a>
                            </h3>
                            <ul class="chart-songList">
                                <li class="chart-song">
                                    <div class="chart-num">1</div>
                                    <div class="chart-name">野狼Disco（feat.陈伟霆）</div>
                                    <div class="chart-author">宝石Gem/陈伟霆</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">2</div>
                                    <div class="chart-name">嚣张</div>
                                    <div class="chart-author">en</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">3</div>
                                    <div class="chart-name">说好不哭（with 五月天阿信）</div>
                                    <div class="chart-author">周杰伦</div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a href="javascript:;" class="chart-title">新歌</a>
                            </h3>
                            <ul class="chart-songList">
                                <li class="chart-song">
                                    <div class="chart-num">1</div>
                                    <div class="chart-name">野狼Disco（feat.陈伟霆）</div>
                                    <div class="chart-author">宝石Gem/陈伟霆</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">2</div>
                                    <div class="chart-name">悬溺</div>
                                    <div class="chart-author">葛东琪</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">3</div>
                                    <div class="chart-name">涅槃 (Phoenix)</div>
                                    <div class="chart-author">英雄联盟</div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a href="javascript:;" class="chart-title">欧美</a>
                            </h3>
                            <ul class="chart-songList">
                                <li class="chart-song">
                                    <div class="chart-num">1</div>
                                    <div class="chart-name">涅槃 (Phoenix)</div>
                                    <div class="chart-author">英雄联盟</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">2</div>
                                    <div class="chart-name">10,000 Hours</div>
                                    <div class="chart-author">Dan + Shay/Justin Bieber</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">3</div>
                                    <div class="chart-name">Lose You To Love Me</div>
                                    <div class="chart-author">Selena Gomez</div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="chart-item">
                        <div class="chart-box">
                            <div class="chart-bg"></div>
                            <i class="icon-play play litter-icon"></i>
                            <i class="chart-line"></i>
                            <h3 class="chart-head">
                                <a href="javascript:;" class="chart-title">韩国</a>
                            </h3>
                            <ul class="chart-songList">
                                <li class="chart-song">
                                    <div class="chart-num">1</div>
                                    <div class="chart-name">KILL THIS LOVE (JP Ver.)</div>
                                    <div class="chart-author">BLACKPINK</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">2</div>
                                    <div class="chart-name">SOSO</div>
                                    <div class="chart-author">WINNER (위너)</div>
                                </li>
                                <li class="chart-song">
                                    <div class="chart-num">3</div>
                                    <div class="chart-name">싫다고 말해 (Put It Straight) (Nightmare Version)</div>
                                    <div class="chart-author">(여자)아이들 ((女)孩子们)</div>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

</main>
<!--footer-->
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
<!--section-btn-->
<a href="javascript:;" class="backTop bottom-btn">
    <i class="icon-back-top"></i>
</a>
<a href="javascript:;" class="feedback bottom-btn">反馈</a>
<a href="javascript:; " class="openPlay bottom-btn"></a>
</body>
<script type="text/javascript">

    function playAll() {
        window.open("/playAll");
    }
</script>

</html>