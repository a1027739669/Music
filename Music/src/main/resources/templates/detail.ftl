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
    <link type="text/css" rel="stylesheet" href="css/comment.css">
    <link type="text/css" rel="stylesheet" href="css/play.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/layout_0412.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/popup_login.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/qb-ie-remind.css">
    <link type="text/css" rel="stylesheet" href="qqmusiccss/song_detail.css">
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
    <div class="mod_data" itemscope="" itemtype="http://schema.org/MusicRecording" style="display:block;">
		    <span class="data__cover">

				<img src="/upload/${song.song_img}"
                     alt="${song.song_name}" class="data__photo">

		    </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" title="${song.song_name}">${song.song_name}</h1>
            </div>


            <div class="data__singer" title="${song.song_singer}">
                <i class="icon_singer sprite"></i>
                <a href="" data-mid="003XriCI0OfGYj" title="${song.song_singer}"
                   class="data__singer_txt js_singer">
                    ${song.song_singer} </a>

            </div>

            <ul class="data__info">

                <li class="data_info__item data_info__item--even">专辑：<a
                            href="" itemprop="inAlbum" class="js_album"
                             title="${song.getAlbum().album_name}">${song.getAlbum().album_name}</a></li>
                <li class="data_info__item js_lan" style="">语种：${song.song_languages}</li>
                <li class="data_info__item js_public_time data_info__item--even" style="">发行时间：${song.song_release}</li>

            </ul>
            <div class="data__actions" role="toolbar">
                <a href="" class="mod_btn_green js_all_play">播放</a>
                <a href="javascript:;" class="mod_btn js_all_like">收藏</a>
            </div>
        </div>
    </div>


    <div class="detail_layout">
        <div class="detail_layout__main">

            <!--歌词_S-->
            <div class="mod_lyric">
                <div class="lyric__hd">
                    <h2 class="lyric__tit">歌词</h2><a class="btn_copy sprite" id="copy_link" href="javascript:;"
                                                     onclick=""
                                                     data-clipboard-target="#copy_content" title="复制歌词"
                                                     data-clipboard-action="copy"><i class="icon_txt">复制</i></a>
                </div>
                <div class="lyric__cont">
                    <div class="lyric__cont_box" id="lrc_content"><p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>${song.song_singer}
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>转身带风
                        </p>
                        <p>掷地有声
                        </p>
                        <p>无忌的面容
                        </p>
                        <p>哪会怕 沐雨栉风
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>子弹破空
                        </p>
                        <p>划过户棚
                        </p>
                        <p>撞醒了梦钟
                        </p>
                        <p>才知理想有多重
                        </p>
                        <p>黄子韬：
                        </p>
                        <p>黑与白 零距离
                        </p>
                        <p>情难辨对错的理
                        </p>
                        <p>善是恶的影
                        </p>
                        <p>恩怨难分明
                        </p>
                        <p>黄子韬：
                        </p>
                        <p>谁说英雄战无不胜
                        </p>
                        <p>乱世 真情无用
                        </p>
                        <p>几人慷慨几人勇
                        </p>
                        <p>黄子韬：
                        </p>
                        <p>少年英雄龙虎半生
                        </p>
                        <p>心中
                        </p>
                        <p>烙下裙衣的红
                        </p>
                        <p>爱恨有始有终
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>转身带风
                        </p>
                        <p>掷地有声
                        </p>
                        <p>无忌的面容
                        </p>
                        <p>哪会怕 沐雨栉风
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>子弹破空
                        </p>
                        <p>划过户棚
                        </p>
                        <p>撞醒了梦钟
                        </p>
                        <p>才知理想有多重
                        </p>
                        <p>黄子韬：
                        </p>
                        <p>命有期 情有尽
                        </p>
                        <p>聚如团火散如星
                        </p>
                        <p>同行不同心
                        </p>
                        <p>殊途不重聚
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>谁说英雄战无不胜
                        </p>
                        <p>乱世真情无用
                        </p>
                        <p>几人慷慨几人勇
                        </p>
                        <p>黄子韬：
                        </p>
                        <p>少年英雄龙虎半生
                        </p>
                        <p>心中
                        </p>
                        <p>烙下裙衣的红
                        </p>
                        <p>爱恨有始有终
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>谁说英雄战无不胜
                        </p>
                        <p>乱世真情无用
                        </p>
                        <p>几人慷慨几人勇
                        </p>
                        <p>合唱：
                        </p>
                        <p>少年英雄龙虎半生
                        </p>
                        <p>心中
                        </p>
                        <p>黄子韬：
                        </p>
                        <p>烙下裙衣的红
                        </p>
                        <p>爱恨有始有终
                        </p>
                        <p>刘宇宁：
                        </p>
                        <p>爱恨有始有终</p></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper">
    <div class="section">
        <div class="section-header"><h3 class="section-title">网友点评</h3></div>
        <div class="section-content comments-score-new review-comments-score clearfix">
            <div class="clearfix">

                <!--点评框-->
                <div class="comments-box">
                    <div class="comments-box-title">我要点评<<${song.song_name}>></div>
                    <div class="comments-default-score clearfix"></div>
                    <form action="" method="post" id="usrform">
                        <div class="writebox">
                            <textarea name="comment" form="usrform"></textarea>
                        </div>
                        <div class="comments-box-button clearfix">
                            <input type="submit" value="发布" class="_j_cc_post_entry cc-post-entry" id="scoreBtn">
                            <div data-role="user-login" class="_j_cc_post_login"></div>
                        </div>
                        <div id="scoreTips2" style="padding-top:10px;"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper clearfix songlist" id="comments" >

</div>

<script type="text/javascript">
    var songId="${song.song_id}";
    $(function () {
        toPage(1,songId);
    });
    function toPage(num,songId) {
        $.ajax({
            url: '/songDetail',
            type: 'GET',
            data: {
                'songId':songId,
                'pageId': num,
            },
            success: function (data) {
                $("#comments").empty();
                $("#comments").append(data);
            }
        });
    }
</script>

</body>
</html>