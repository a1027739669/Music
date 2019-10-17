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
    <script  src="js/jquery.min.js"></script>
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
    <div class="mod_data" style="display:block;">
		    <span class="data__cover">

				<img src="/upload/${song.song_img}"
                     alt="${song.song_name}" class="data__photo"/>
		    </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt" title="Shyuwa shyuwa">${song.song_name}</h1>
            </div>
            <div class="data__singer" title="${song.song_singer}">
                <i class="icon_singer sprite"></i>
                <a href="" data-mid="" title=""
                   class="" data-stat="" itemprop="">
                </a>
            </div>
            <div class="product-price">
                <div class="product-price-info">
                    <a>歌手：${song.song_singer}&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
                <div class="product-price-info">
                    <a>专辑：${song.getAlbum().album_name}&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                    <a>语种：${song.song_languages}&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
                <div class="product-price-info">
                    <a>流派：${song.song_type}&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                    <a>发行时间：${song.song_release} &nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
            </div><!--end product-price-->
            <div class="data__actions" role="toolbar">
                <a href="//y.qq.com/portal/player.html" class="mod_btn_green js_all_play"><i
                            class="mod_btn_green__icon_play"></i>播放</a>

                <a href="javascript:;" class="mod_btn js_all_like"><i class="mod_btn__icon_like"></i>收藏</a>


                <a class="mod_btn js_into_comment" data-stat="y_new.song.gotocomment" href="#comment_box"><i
                            class="mod_btn__icon_comment"></i>评论</a>
                <a href="javascript:;" class="mod_btn js_more" data-stat="y_new.song.header.more" data-id="240935550"
                   data-songtype="0" data-mid="001xCrdG4dHbpD"><i class="mod_btn__icon_menu"></i>更多</a>

            </div>
        </div>
    </div>


    <div class="detail_layout">
        <div class="detail_layout__main">

            <!--歌词_S-->
            <div class="mod_lyric">
                <input id="copy_content" style="display:none;"></input>
                <div class="lyric__hd">
                    <h2 class="lyric__tit">歌词</h2><br>
                    <textarea id="lrc_content" style="display: block;width: 1000px;height: 600px;">
                    ghsoihgsogdhsdgoidgshdgssdgklhdshgdhfdjgjd
                    gdadsgsdhsdhhsshsgd
                    gaagagag
                </textarea>
                </div>
                <div class="lyric__cont limit">
                    <div class="lyric__cont_box" id="lrc_content"></div>
                    <a href="javascript:;" class="c_tx_highlight js_open_lyric">[展开]</a>
                </div>
            </div>
            <!--歌词_E-->
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