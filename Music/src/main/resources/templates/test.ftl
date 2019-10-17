<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="image/x-icon" rel="shortcut icon" href="favicon.ico">
    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="css/play.css">
</head>
<body>
<#--<embed src="http://localhost:8080/getwav/3.m4a" width="700" autostart="true"/>-->
<#--<div class="music_box">-->

<#--<audio src="http://localhost:8080/getwav/3.m4a" autoplay="autoplay"></audio>-->
<#--<div id="jquery_jplayer_1" class="jp-jplayer" data-url="http://localhost:8080/getwav/3.m4a"></div>-->
<#--    <div id="jquery_jplayer_1" class="jp-jplayer" data-url="http://localhost:8080/getwav/3.m4a"/>-->
<#--</div>-->
<#--<div id="jquery_jplayer_1" class="jp-jplayer" data-url="/getmav/2.mp3"></div>-->
<#--<textarea id="lrc_content" style="display: none;">-->
<#--                     歌词为空-->
<#--                    </textarea>-->
<div class="product-pics">
    <div class="music_box">
        <div id="jquery_jplayer_1" class="happyworm.jPlayer.JplayerMp3" data-url="/getwav/2.mp3">
        </div>
        <div class="jp_img layz_load pic_po" title="点击播放"><img >
        </div>
        <div id="jp_container_1" class="jp-audio">
            <div class="jp-gui jp-interface">
                <div class="jp-time-holder clearfix">
                    <div class="jp-progress">
                        <div class="jp-seek-bar">
                            <div class="jp-play-bar"></div>
                        </div>
                    </div>
                    <div class="jp-time">
                        <span class="jp-current-time"></span> /
                        <span class="jp-duration"></span>
                    </div>
                </div>
                <div class="jp-volume-bar">
                    <div class="jp-volume-bar-value"></div>
                </div>
                <ul class="jp-controls clearfix">
                    <li><a class="jp-play" tabindex="1" title="play"></a><a class="jp-pause"
                                                                            tabindex="1"
                                                                            title="pause"></a></li>
                    <li><a class="jp-stop" tabindex="1" title="stop"></a></li>
                    <li><a class="jp-repeat" tabindex="1" title="repeat"></a><a class="jp-repeat-off"
                                                                                tabindex="1" title="repeat off"></a>
                    </li>
                    <li class="sound"><a class="jp-mute" tabindex="1" title="mute"></a><a
                                class="jp-unmute" tabindex="1" title="unmute"></a></li>
                </ul>
            </div>
        </div>
        <div class="jplayer_content">
            <ul id="lrc_list" class="lrc_list"></ul>
        </div>

    </div><!--end music_box-->
    <textarea id="lrc_content" style="display: none;">
                    歌词为空
                    </textarea>
</div><!--end product-pics-->
<#--<audio src="/getwav/1.mp3" autoplay="autoplay" preload="auto" controls="controls"></audio>-->
<#--<iframe src = "http://localhost:8080/getwav/3.m4a" allow="true" autoplay="true"/> >-->
<h1>hello world</h1>
</body>
<script data-main="js/play.js" src="js/require.js"></script>
</html>