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
    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/playlist_detail_d1aad22f.css">
    <link type="text/css" rel="stylesheet" href="playresource/css/home.css">
    <script data-main="js/index.js" src="js/require.js"></script>
    <script src="js/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>
    <div class="search-box">
        <form id="searchForm" action="{% url 'search' 1 %}" method="post" target="_blank">
            {% csrf_token %}
            <div class="search-keyword">
                <input id="kword" name="kword" type="text" class="keyword" maxlength="120" placeholder="音乐节"/>
            </div>
            <input id="subSerch" type="submit" class="search-button" value="搜 索"/>
        </form>
        <div id="suggest" class="search-suggest"></div>
        <div class="search-hot-words">
            {% for song in search_song %}
            <a target="play" href="{% url 'play' song.song.song_id %}">{{ song.song.song_name }}</a>
            {% endfor %}
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
<div class="main">

    <div class="mod_data">


        <span class="data__cover" id="logo">
                <img src="" class="data__photo">
            </span>
        <a href="javascript:;" class="data__cover js_edit" id="edit_logo" data-target="popup_upload_cover"
           style="display:none;">
            <img src=""

                 alt="国民闺女：关晓彤参演影视作品集" class="data__photo">
            <i class="data__cover_edit sprite"></i>
        </a>
        <div class="data__cont">
            <div class="data__name js_box" data-type="p_title">
                <h1 class="data__name_txt" title="国民闺女：关晓彤参演影视作品集" id="p_name_show">国民闺女：关晓彤参演影视作品集</h1><a
                        href="javascript:;" class="btn_edit sprite js_edit" style="display:none;"><i
                            class="icon_txt">编辑</i></a>
                <div class="mod_form_txt js_edit_box" style="display:none;">
                    <input type="text" value="国民闺女：关晓彤参演影视作品集" class="form_txt__input" id="p_name"><span
                            class="form_txt__tips" id="name_leftnum">0</span>
                </div>
            </div>
            <div class="data__singer">
                <i class="icon_singer sprite"></i><a href="javascript:;" title="夜微凉" class="data__singer_txt js_user"
                                                     data-stat="y_new.gedan.header.nickname" itemprop="byArtist">夜微凉</a>
            </div>
            <ul class="data__info">
                <li class="data_info__item">创建时间：2019-07-18</li>
                <li class="data_info__item">播放量：21.3万</li>
                <li class="data_info__item">收藏量：1430</li>
            </ul>

            <div class="data__actions" role="toolbar">
                <a href="javascript:;" class="mod_btn_green js_all_play"><i
                            class="mod_btn_green__icon_play"></i>播放全部</a>
                <a href="javascript:;" class="mod_btn js_fav_taoge" data-status="0"><i class="mod_btn__icon_like"></i>收藏</a>
                <a class="mod_btn js_into_comment"><i class="mod_btn__icon_comment"></i>评论(7)</a>
                <a href="javascript:;" class="mod_btn js_more" data-stat="y_new.gedan.header.more" data-id="7099581376"><i
                            class="mod_btn__icon_menu"></i>更多</a>
            </div>
        </div>
    </div>

    <div class="detail_layout">
        <div class="detail_layout__main js_main">

            <div class="mod_songlist">
                <ul class="songlist__header">
                    <li class="songlist__header_name">歌曲</li>
                    <li class="songlist__header_author">歌手</li>
                    <li class="songlist__header_album">专辑</li>
                    <li class="songlist__header_time">时长</li>
                </ul>

                <ul class="songlist__list">

                    <li>
                        <div class="songlist__item">
                            <div class="songlist__number">1</div>
                            <div class="songlist__songname">
                                <i class="songlist__icon songlist__icon_exclusive" title="独家"></i>
                                <a href="https://y.qq.com/n/yqq/mv/v/g05325a21js.html"
                                   class="songlist__icon songlist__icon_mv" rel="noopener" target="_blank"
                                   title="MV"><span class="icon_txt">MV</span></a>
                                <span class="songlist__songname_txt"><a href="javascript:;" title="凤囚凰">凤囚凰</a></span>
                                <div class="mod_list_menu">
                                    <span class="list-icon icon-play" data-function="play" title="播放"></span>
                                    <span class="list-icon icon-download" data-function="download" title="下载"></span>
                                    <span class="list-icon icon-share" data-function="share" title="分享"></span>
                                </div>
                            </div>
                            <div class="songlist__artist">
                                <a href="javascript:;" title="白鹿" class="singer_name">白鹿</a>

                            </div>
                            <div class="songlist__album">
                                <a href="javascript:;" title="凤囚凰">凤囚凰</a>
                            </div>
                            <div class="songlist__time">05:03</div>
                            <div class="songlist__other">
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="songlist__item">
                            <div class="songlist__number">1</div>
                            <div class="songlist__songname">
                                <i class="songlist__icon songlist__icon_exclusive" title="独家"></i>
                                <a href="https://y.qq.com/n/yqq/mv/v/g05325a21js.html"
                                   class="songlist__icon songlist__icon_mv" rel="noopener" target="_blank"
                                   title="MV"><span class="icon_txt">MV</span></a>
                                <span class="songlist__songname_txt"><a href="javascript:;" title="凤囚凰">凤囚凰</a></span>
                                <div class="mod_list_menu">
                                    <span class="list-icon icon-play" data-function="play" title="播放"></span>
                                    <span class="list-icon icon-download" data-function="download" title="下载"></span>
                                    <span class="list-icon icon-share" data-function="share" title="分享"></span>
                                </div>
                            </div>
                            <div class="songlist__artist">
                                <a href="javascript:;" title="白鹿" class="singer_name">白鹿</a>

                            </div>
                            <div class="songlist__album">
                                <a href="javascript:;" title="凤囚凰">凤囚凰</a>
                            </div>
                            <div class="songlist__time">05:03</div>
                            <div class="songlist__other">
                            </div>
                        </div>
                    </li>


                </ul>
            </div>
            <div class="mod_songlist_toolbar mod_songlist_toolbar--edit js_foot_batch" style="display:none;">
                <div class="songlist__edit songlist__edit--check sprite" style="display:none;">
                    <input type="checkbox" class="songlist__checkbox js_check_all">
                </div>
                <a href="javascript:;" class="mod_btn js_all_play" data-stat="y_new.gedan.songlist.playall"><i
                            class="mod_btn__icon_play"></i>播放全部</a>
                <a href="javascript:;" class="mod_btn js_all_fav"><i class="mod_btn__icon_add"></i>添加到</a>
                <a href="javascript:;" class="mod_btn js_all_down"><i class="mod_btn__icon_down"></i>下载</a>
                <a href="javascript:;" class="mod_btn js_all_delete" style="display:none;"><i
                            class="mod_btn__icon_delete"></i>删除</a>
                <a href="javascript:;" class="mod_btn js_batch"><i class="mod_btn__icon_batch"></i>批量操作</a>
            </div>


            <div class="mod_comment" id="comment_box">

                <div class="mod_all_comment js_mod_all">
                    <div class="comment_type__title c_b_normal">
                        <h2 class="comment_new_count"></h2>
                    </div>


                    <div class="comment__show_all"><span class="comment__show_all_link c_tx_thin"></span>
                    </div>

                </div>
                <p class="comment__rule"><a class="js_rule_btn" href="javascript:;"></a></p></div>
        </div>
        <div class="detail_layout__other">
            <div class="mod_about js_box" id="album_desc" style="display:block;">
                <h3 class="about__tit">简介</h3>
                <div class="about__cont">
                    <p>关晓彤勇于突破自己，演技越来越好，星途越来越坦荡。尽管成长路上有风雨，但她继续前行。 本歌单收集了以下原声： 《风囚凰》 《班淑传奇》 《九州天空城》 《好先生》 《我们的纯真年代》 《小丈夫》
                        《一仆二主》 《会痛的十七岁》 ……</p>
                </div>

            </div>


        </div>
        <!-- 专辑简介 -->
        <div class="popup_data_detail" id="popup_data_detail" data-aria="popup" style="display:none;z-index:1000000;">
            <div class="popup_data_detail__cont">
                <h3 class="popup_data_detail__tit">简介</h3>
                <p>关晓彤勇于突破自己，演技越来越好，星途越来越坦荡。尽管成长路上有风雨，但她继续前行。<br>本歌单收集了以下原声：<br>《风囚凰》<br>《班淑传奇》<br>《九州天空城》<br>《好先生》<br>《我们的纯真年代》<br>《小丈夫》<br>《一仆二主》<br>《会痛的十七岁》<br>……
                </p>
            </div>
            <i class="popup_data_detail__arrow"></i>
        </div>
    </div>

</div>

</body>
</html>