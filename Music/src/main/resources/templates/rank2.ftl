<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>我的音乐</title>
    <link type="image/x-icon" rel="shortcut icon" href="favicon.ico">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/layout_0412.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/popup_login.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/qb-ie-remind.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/song_detail.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/toplist_ae95fdcf.css">
    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="playresource/css/home.css">
    <script data-main="js/index.js" src="js/require.js"></script>
    <script src="js/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>
    <div class="search-box">
        <!-- 歌曲查询 -->
        <form id="searchForm" action="{% url 'search' 1 %}" method="post" target="_blank">
            <div class="search-keyword">
                <input id="kword" name="kword" type="text" class="keyword" maxlength="120" placeholder="音乐节"/>
            </div>
            <input id="subSerch" type="submit" class="search-button" value="搜 索"/>
        </form>
        <div id="suggest" class="search-suggest"></div>
    </div>
</div><!--end header-->
<div class="nav-box">
    <div class="nav-box-inner">
        <ul class="nav clearfix">
            <li><a href="/">首页</a></li>
            <li><a href="{% url 'ranking' %}" target="_blank">歌曲排行</a></li>
            <li><a href="{% url 'home' 1 %}" target="_blank">用户中心</a></li>
        </ul>
    </div>
</div><!--end nav-box-->
<div class="main">

    <div class="toplist_nav">

        <dl class="toplist_nav__list">
            <dt class="toplist_nav__tit">歌曲排行</dt>

            <dd class="toplist_nav__item"><a href="https://y.qq.com/n/yqq/toplist/4.html#stat=y_new.toplist.menu.4"
                                             onclick="setStatCookie&amp;&amp;setStatCookie();"
                                             class="toplist_nav__link toplist_nav__link--current">流行指数榜</a></dd>

            <dd class="toplist_nav__item"><a href="https://y.qq.com/n/yqq/toplist/26.html#stat=y_new.toplist.menu.26"
                                             onclick="setStatCookie&amp;&amp;setStatCookie();"
                                             class="toplist_nav__link">热歌榜</a></dd>

            <dd class="toplist_nav__item"><a href="https://y.qq.com/n/yqq/toplist/27.html#stat=y_new.toplist.menu.27"
                                             onclick="setStatCookie&amp;&amp;setStatCookie();"
                                             class="toplist_nav__link">新歌榜</a></dd>

            <dd class="toplist_nav__item"><a href="https://y.qq.com/n/yqq/toplist/62.html#stat=y_new.toplist.menu.62"
                                             onclick="setStatCookie&amp;&amp;setStatCookie();"
                                             class="toplist_nav__link">飙升榜</a></dd>

            <dd class="toplist_nav__item"><a
                        href="https://y.qq.com/portal/mv_toplist.html#stat=y_new.toplist.menu.mv_toplist"
                        onclick="setStatCookie&amp;&amp;setStatCookie();" class="toplist_nav__link">MV榜</a></dd>

        </dl>
    </div>
    <div class="mod_toplist">
        <div class="toplist__hd">
            <h1 class="toplist__tit">流行指数榜</h1>
            <span class="toplist_switch">
                    <span class="toplist_switch__data js_chosed_week">2019-10-21</span>
                </span>
        </div>
        <div class="mod_songlist_toolbar">
            <a href="https://y.qq.com/portal/player.html" class="mod_btn_green js_all_play"
               data-stat="y_new.toplist.playall"><i class="list-icon icon-play"></i>播放全部</a>
            <a href="javascript:;" class="mod_btn js_all_fav" data-stat="y_new.toplist.addall"><i
                        class="mod_btn__icon_add"></i>添加到</a>
            <a href="javascript:;" class="mod_btn js_all_down" data-stat="y_new.toplist.downloadall"><i
                        class="mod_btn__icon_down"></i>下载</a>
        </div>
  <div id="ranklist">
        <div class="mod_songlist">
            <ul class="songlist__header">
                <li class="songlist__header_name">歌曲</li>
                <li class="songlist__header_author">歌手</li>
                <li class="songlist__header_time">时长</li>
            </ul>
            <ul class="songlist__list">
                <li ix="0">
                    <div class="songlist__item">
                        <div class="songlist__number  songlist__number--top">
                            1

                        </div>


                        <div class="songlist__songname">

                            <i class="songlist__icon songlist__icon_exclusive sprite" title="独家"></i>


                            <span class="songlist__songname_txt" style="visibility: visible;">
			    <a href="" class="songlist__cover album_name"><img src="/upload/1.jpg" class="songlist__pic"
                                                                   style="display: block; visibility: visible;"></a>
			    <a href="" class="js_song" title="野狼Disco（feat.陈伟霆） ">野狼Disco（feat.陈伟霆）</a>
			</span>
                            <div class="mod_list_menu">
                                <span class="list-icon icon-play" data-function="play" title="播放"></span>
                                <span class="list-icon icon-download" data-function="download" title="下载"></span>
                                <span class="list-icon icon-share" data-function="share" title="分享"></span>
                            </div>
                        </div>

                        <div class="songlist__artist" title="宝石Gem / 陈伟霆">

                            <a href="https://y.qq.com/n/yqq/singer/002RjVgP3sbc0f.html" data-singermid="000in2fg3O6W83"
                               data-singerid="13461" title="陈伟霆" class="singer_name">陈伟霆</a>

                        </div>
                        <div class="songlist__time">04:00</div>

                    </div>
                </li>
            </ul>
        </div>
  </div>
    </div>
</div>
</body>
</html>