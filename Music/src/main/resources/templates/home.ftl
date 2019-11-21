
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>我的音乐</title>
    <link type="image/x-icon" rel="shortcut icon" href="/favicon.ico">
    <link type="text/css" rel="stylesheet" href="/css/common.css">
    <link type="text/css" rel="stylesheet" href="/css/user.css">
    <link type="text/css" rel="stylesheet" href="/playresource/css/home.css">
</head>

<body class="member">
<div class="header">
    <a href="/" class="logo" title="首页"><img src="/image/logo.png" ></a>
    <div class="search-box">
        <form id="searchForm" action="{% url 'search' 1 %}" method="post" target="_blank">
            {% csrf_token %}
            <div class="search-keyword">
                <input id="kword" name="kword" type="text" class="keyword" maxlength="120" placeholder="音乐节"/>
            </div>
            <input id="subSerch" type="submit" class="search-button" value="搜 索" />
        </form>
        <div id="suggest" class="search-suggest"></div>
        <div class="search-hot-words">
            {% for song in search_song  %}
            <a target="play" href="{% url 'play' song.song.song_id %}">{{ song.song.song_name }}</a>
            {% endfor  %}
        </div>
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

<div class="mod_profile js_user_data" style="">
    <div class="section_inner">
        <div class="profile__cover_link">
            <img src= "image/user.jpg"  class="profile__cover">
        </div>
        <h1 class="profile__tit">
            <span class="profile__name">{{ user.username }}</span>
        </h1>
        <a href="{% url 'logout' %}" style="color:white;">退出登录</a>
    </div>
</div>

<div class="main main--profile" style="">
    <div class="mod_tab profile_nav" role="nav" id="nav">
                    <a class="mod_tab__item" href="javascript:;" data-tab="like_song">默认歌单</a>
                    <a class="mod_tab__item" href="javascript:;" data-tab="like_playlist">我的歌单</a>
    </div>
    <div>
   <button class="mod_btn_green">播放全部</button>
    <button class="mod_btn">批量删除</button>
    </div>
    <div class="js_box" style="display: block;">
        <div class="profile_cont">
            <div class="js_sub" style="display: block;">
                <div class="mod_songlist">
                    <ul class="songlist__header">
                        <li class="songlist__header_name">歌曲</li>
                        <li class="songlist__header_author">歌手</li>
                        <li class="songlist__header_time">时长</li>
                    </ul>
                    <ul class="songlist__list">
                        {% for item in contacts.object_list %}
                        <li>
                            <div class="songlist__item songlist__item--even">
                                <div class="songlist__songname">
                                    <a href="{% url 'play' item.song_id %}" class="js_song songlist__songname_txt" >{{ item.song_name }}</a>
                                    <span class="list-icon icon-play" data-function="play" title="播放"></span>
                                    <span class="list-icon icon-download" data-function="download" title="下载"></span>
                                    <span class="list-icon icon-share" data-function="share" title="分享"></span>
                                </div>
                                <div class="songlist__artist">
                                    <a href="javascript:;" class="singer_name">{{ item.song_singer }}</a>
                                </div>
                                <div class="songlist__time">{{ item.song_time }}</div>
                            </div>
                        </li>
                        {% endfor %}
                    </ul>
                </div><!--end mod_songlist-->

                <!--分页-->
                <div class="page-box">
                    <div class="pagebar" id="pageBar">

                        {% if contacts.has_previous %}
                        <a href="{% url 'home' contacts.previous_page_number %}" class="prev" target="_self"><i></i>上一页</a>
                        {% endif %}

                        {% for page in contacts.paginator.page_range %}
                        {% if contacts.number == page %}
                        <span class="sel">{{ page }}</span>
                        {% else %}
                        <a href="{% url 'home' page %}" target="_self">{{ page }}</a>
                        {% endif %}
                        {% endfor %}

                        {% if contacts.has_next %}
                        <a href="{% url 'home' contacts.next_page_number %}" class="next" target="_self">下一页<i></i></a>
                        {% endif %}

                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- end main -->
</body>
</html>