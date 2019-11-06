
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Keywords" content="音乐播放器,音乐盒">
    <meta name="Description" content="Lily_music是一个音乐播放器，可搜索">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    <meta name="renderer" content="webkit">
    <meta name="generator" content="KodCloud">
    <meta http-equiv="Cache-Control" content="no-siteapp">

    <!-- 一些移动设备的全屏 -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="full-screen" content="yes">
    <meta name="browsermode" content="application">
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">

    <title>Lily_music</title>

    <!-- 引入jQuery官方类库 -->
    <script src="playresource/js/jquery.min.js"></script>
    <!-- 总样式表 -->
    <link rel="stylesheet" type="text/css" href="playresource/css/index.css">
    <!-- 响应式优化 -->
    <link rel="stylesheet" type="text/css" href="playresource/css/mobile.css">
    <!-- 滚动条美化 -->
    <link rel="stylesheet" type="text/css" href="playresource/css/jquery.mCustomScrollbar.min.css">
    <!-- layer弹窗插件 -->
    <link rel="stylesheet" href="playresource/js/layer/skin/default/layer.css?v=3.0.2302" id="layuicss-skinlayercss">
    <!-- 加载动画 -->
<#--    <link type="text/css" rel="stylesheet" href="playresource/css/kr-loading.css" />-->
</head>
<body>

<div id="blur-img"></div>

<!-- 头部logo -->
<div class="header">
    <div class="logo">
       历史播放列表
    </div>
</div>

<!-- 中间 -->
<div class="center">
    <div class="container">
        <div class="btn-bar">
            <!-- tab按钮区 -->
            <div class="btn-box" id="btn-area">
                <span class="btn" data-action="player" hidden>正在播放</span>
                <span class="btn active" data-action="list" title="正在播放列表">播放列表</span>
            </div>
            <div class="serchsongs">
                <input type="text" name="keywords" maxlength="17" id="krserwords"/>
                <div class="searchDivIcon" ><span class="searchIcon" ></span></div>
            </div>
        </div>

        <div class="data-area">
            <div id="main-list" class="music-list data-box">
                <div class="listitems list-head" >
                    <span class="music-album">时长</span>
                    <span class="auth-name">歌手</span>
                    <span class="music-name">歌曲</span>
                </div>
                <#if playlist ? exists>
                <#list playlist as playsong>
                <div class="list-item" data-url="/getwav/${playsong.song_file}" data-pic="/upload/${playsong.song_img}" data-lrc="/getlyric/${playsong.song_lyrics}" data-no="${playsong_index+1}">
                    <span class="list-num">${playsong_index+1}</span>
                    <span class="list-mobile-menu"></span>
                    <span class="music-album">${playsong.song_time}</span>
                    <span class="auth-name">${playsong.song_singer}</span>
                    <span class="music-name">${playsong.song_name}</span>
                </div>
                </#list>
                </#if>
                <div class="list-item text-center list-clickable" onclick="clearDislist()">清空列表</div>
            </div>
        </div>

        <!-- 右侧封面及歌词展示 -->
        <div class="player" id="player">
            <!--歌曲封面-->
            <div class="cover">
                <img src="" class="music-cover" id="music-cover">
            </div>
            <!--滚动歌词-->
            <div class="lyric">
                <ul id="lyric">
<#--                    <li class='lyric-tip'>gsgds</li>-->
                </ul>
            </div>
            <div id="music-info" title="点击查看歌曲信息"></div>
        </div>
    </div>
</div>

<!--播放器-->
<audio id="audio"></audio>

<!-- 播放器底部区域 -->
<div class="footer">
    <div class="container">
        <div class="con-btn">
            <a href="javascript:;" class="player-btn btn-prev" title="上一首"></a>
            <a href="javascript:;" class="player-btn btn-play" title="播放"></a>
            <a href="javascript:;" class="player-btn btn-next" title="下一首"></a>
        </div>


        <div class="vol">
            <div class="quiet">
                <a href="javascript:;" class="player-btn btn-quiet" title="静音"></a>
            </div>
            <div class="volume">
                <div class="volume-box">
                    <div id="volume-progress" class="mkpgb-area">
                        <div class="mkpgb-bar"></div>
                        <div class="mkpgb-cur"></div>
                        <div class="mkpgb-dot"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="others">
            <a href="javascript:;" class="player-btn btn-order" title="列表循环"></a>
            <a href="javascript:;" class="player-btn btn-download" title="下载"></a>
        </div>

        <div class="progress">
            <div class="progress_msg">
                <div class="music_title">乐诗，悦动你的生活</div>
                <div class="time_area">
                    <span class="current_time">00:00</span> /
                    <span class="all_time">00:00</span>
                </div>
                <div class="clear"></div>
            </div>
            <div class="progress-box">
                <div id="music-progress" class="mkpgb-area">
                    <div class="mkpgb-bar"></div>
                    <div class="mkpgb-cur"></div>
                    <div class="mkpgb-dot"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--下载按钮-->
<a id="downabo" download=""></a>

<!-- 加载动画相关js -->
<script src="playresource/js/sg.js"></script>
<script src="playresource/js/kr_util.js"></script>
<!-- layer弹窗插件 -->
<script src="playresource/js/layer/layer.js"></script>
<!-- 滚动条美化插件 -->
<script src="playresource/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- 粘贴复制的插件 -->
<script type="text/javascript" src="playresource/js/clipboard.min.js"></script>
<!-- 列表方法 -->
<script src="playresource/js/list_function.js"></script>
<!-- 注册播放器 -->
<script src="playresource/js/music_play.js"></script>
<!-- 歌词解析装载 -->
<script src="playresource/js/loadlyc.js"></script>
<!-- 背景模糊化插件 -->
<script src="playresource/js/background-blur.min.js"></script>

</body>
<script type="text/javascript">
    var long1="#{playlist ? size}";
    krAudio.allItem = long1; //播放列表的总数
</script>
</html>