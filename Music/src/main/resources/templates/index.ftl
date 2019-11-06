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
    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="css/index.css">
</head>

<body class="index">
<div class="header">
    <a href="/" class="logo" title="首页"><img alt="我的音乐" src="image/logo.png"></a>
    <div class="search-box">
        <form id="searchForm" action="{% url 'search' 1 %}" method="post" target="_blank">
            <div class="search-keyword">
                <input name="kword" type="text" class="keyword" maxlength="120" placeholder="音乐节"/>
            </div>
            <input id="subSerch" type="submit" class="search-button" value="搜 索"/>
        </form>
        <div id="suggest" class="search-suggest"></div>
    </div>
</div>
<div class="nav-box">
    <div class="nav-box-inner">
        <ul class="nav clearfix">
            <li><a href="/">首页</a></li>
            <li><a href="{% url 'ranking' %}" target="_blank">歌曲排行</a></li>
            <li><a href="{% url 'home' 1 %}" target="_blank">用户中心</a></li>
        </ul>
        <div class="category-nav">
            <div class="category-nav-header">
                <strong><a href="javascript:;" title="">音乐分类</a></strong>
            </div>
            <div class="category-nav-body">
                <div id="J_CategoryItems" class="category-items">
                    <#list labelList as label>
                        <div class="item" data-index="1"><h3>
                                <a href="javascript:;">${label.label_name}</a></h3>
                        </div>
                    </#list>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper clearfix">
        <div class="main">
            <div id="J_FocusSlider" class="focus">
                <div id="bannerLeftBtn" class="banner_btn"></div>
                <ul class="focus-list f_w">
                    <li class="f_s">
                        <div class="layz_load">
                            <img data-src="songImg/1.jpg" width="750" height="275">

                        </div>

                    </li>
                    <li class="f_s"><a target="play" href="{% url 'play' 13 %}" class="layz_load">
                            <img data-src="image/datu-2.jpg" width="750" height="275"></a>
                    </li>
                    <li class="f_s"><a target="play" href="{% url 'play' 13 %}" class="layz_load">
                            <img data-src="{% static '/image/datu-2.jpg' %}" width="750" height="275"></a>
                    </li>
                    <li class="f_s"><a target="play" href="{% url 'play' 13 %}" class="layz_load">
                            <img data-src="{% static '/image/datu-2.jpg' %}" width="750" height="275"></a>
                    </li>
                </ul>
                <div id="bannerRightBtn" class="banner_btn"></div>
            </div>
        </div>
        <div class="aside">
            <h2>热门歌曲</h2>
            <ul>
                <#list hot_song as song>
                    <li>
                        <span>${song_index ?if_exists+1}</span>
                        <a href="">${song.song_name}</a>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <div class="today clearfix">
        <div class="today-header">
            <i></i>
            <h2>新歌推荐</h2>
        </div>
        <div class="today-list-box slide">
            <div id="J_TodayRec" class="today-list">
                <ul>
                    <#list newMusics as music>
                        <li>
                            <a class="pic layz_load pic_po" target="play" href="">
                                <img data-src="/upload/${music.song_img}">
                            </a>
                            <div class="name">
                                <h3><a href="">${music.song_name}</a></h3>
                                <div class="singer"><span>${music.song_singer}</span></div>
                                <div class="times">发行时间：<span>${music.song_release}</span></div>
                            </div>
                            <a href="{% url 'play' list.song_id %}" class="today-buy-button">去听听></a>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
    </div><!--end today-->
    <div class="section">
        <ul id="J_Tab" class="tab-trigger">
            <li data-cur="0" class="current t_c">热门搜索</li>
            <li data-cur="1" class="t_c">热门下载</li>
        </ul>
        <div class="tab-container">
            <div id="J_Tab_Con" class="tab-container-cell">
                <#list searchAndDown as SeOrDown>
                <#if SeOrDown_index==0>
                <ul class="product-list clearfix t_s current">
                    <#else >

                    <ul class="product-list clearfix t_s" style="display:none;">
                        </#if>
                        <#list SeOrDown as son>
                            <li>
                                <a href="" class="pic layz_load pic_po">
                                    <img data-src="/upload/${son.song_img}"></a>
                                <h3><a target="play" href="">${son.song_name}</a></h3>
                                <div class="singer"><span>${son.song_singer}</span></div>
                                <#if SeOrDown_index==0>
                                    <div class="times">搜索次数：<span>${son.getInfo().info_search}</span></div>
                                <#else>
                                    <div class="times">下载次数：<span>${son.getInfo().info_down}</span></div>

                                </#if>
                            </li>
                        </#list >
                    </ul>
                    </#list>
                </ul>
            </div>
        </div>
    </div><!--end section-->
</div>


<div class="footer">
    <div class="copyright">
        <p>网站数据信息来源于网络</p>
    </div>
</div>
</body>
<script data-main="js/index.js" src="js/require.js"></script>
</html>
