<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta name="keywords" content="音乐,QQ音乐,在线听歌,音乐下载,音乐播放器,音乐网站,MV,巅峰榜,音乐排行榜,翻译歌曲,热门歌曲,经典老歌,无损音乐,无损曲库">
    <meta name="description"
          content="QQ音乐是腾讯公司推出的一款网络音乐服务产品，海量音乐在线试听、新歌热歌在线首发、歌词翻译、手机铃声下载、高品质无损音乐试听、海量无损曲库、正版音乐下载、空间背景音乐设置、MV观看等，是互联网音乐播放和下载的优选。">
    <meta name="mobile-agent" content="format==[html5];url=https://y.qq.com/m/index.html">
    <meta name="applicable-device" content="pc">
    <title>我的收藏</title>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <script src="/bin/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/album.css-max_age=2592000&v=20160831.css">
    <link rel="stylesheet" href="/mediastyle/yqq/popup_login.css?max_age=25920000">
    <style type="text/css">.emojicon-m {
            min-height: 1em !important;
            min-width: 1em !important;
            max-height: 1em !important;
            max-width: 1em !important;
            vertical-align: middle !important;
            float: none !important;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: contain;
            display: inline-block;
        }</style>
    <link rel="stylesheet" type="text/css"
          href="/mediastyle/yqq/qb-ie-remind.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <script src="/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/mediastyle/yqq/playlist.css-max_age=2592000.css"/>

    <link rel="stylesheet" href="/css/head2.css">
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
    <link type="text/css" rel="stylesheet" href="/kuwocss/style4.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/kuwocss/styles.css">
</head>
<header class="header">
    <div class="header-box">
        <h1 class="header-title">
            <a href="javascript:;"><img class="logo-img" src="/image/logo.png" alt="QQ音乐"></a>
            <#--                <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>-->
        </h1>
        <ul class="header-top-nav">
            <li class="top-nav-item active"><a href="#" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
            <li class="top-nav-item"><a href="/guest/rank" class="tnav-link" title="音乐号">排行榜</a></li>
            <li class="top-nav-item"><a href="/guest/sheetlist" class="tnav-link" title="音乐号">分类歌单</a></li>


        </ul>
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
                            <#list hotSearch as hot>
                                <a href="/guest/detail?songId=${hot.song_id}" class="hot-link">
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
		    <a class="top_login__link js_logined" href="//y.qq.com/portal/profile.html#stat=y_new.top.user_pic"
               style=""><img id="userImg"
                             src="http://thirdqq.qlogo.cn/g?b=sdk&amp;k=ZbfpT8QjY6vdqW4ePRkkIg&amp;s=140&amp;t=1558784273"
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
                                        href="//y.qq.com/portal/msg_center.html#stat=y_new.top.pop.msg_center"
                                        onclick="setStatCookie&amp;&amp;setStatCookie();">评论通知</a>
                            </div>
                        </div>
                        <div class="popup_user_toolbar__item">
                            <div class="popup_user_toolbar__tit"><a href="javascript:;" class="js_logout"
                                                                    data-stat="y_new.top.pop.logout">退出QQ登录</a>
                            </div>
                        </div>

                    </div>
                </div>
            <#else >
                <a href="javascript:;" class="h-login" id="openlogin">登录</a>
                <div class="login-mark"></div>
            </#if>
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
            <form id="login_form">
                <div class="logininput">
                    <input type="text" name="username" class="loginusername" value="" placeholder="手机/用户名"/>
                    <input type="password" name="password" class="loginuserpasswordt" value="" placeholder="密码"/>
                </div>
                <div class="loginbtn">
                    <div class="loginsubmit fl"><input type="button" value="登录" class="btn" id="submit"/></div>
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
<div id="reg_setp">
    <div class="back_setp">返回</div>
    <div class="blogo"></div>
    <div id="setp_quicklogin">
        <h3>您可以选择以下第三方帐号直接登录代码笔记，一分钟完成注册</h3>
        <ul class="quicklogin_socical">
            <li class="quicklogin_socical_weibo"><a href="http://www.jb51.net">微博帐号注册</a></li>
            <li class="quicklogin_socical_qq" style="margin:0;"><a href="http://www.jb51.net">QQ帐号注册</a></li>
        </ul>
    </div>
    <!-- 会员注册 -->
    <div id='regist_container' style="display: none;">
        <div id="lab1">
            <span id="lab_login">会员注册</span>
            <span id="lab_toLogin">
						&emsp;已有账号&nbsp;
						<span id='toLogin' style="color: #EB9316;cursor: pointer;">立即登录</span>
					</span>
        </div>
        <div id="form_container2" style="padding-top: 25px;">

            <input type="text" class="form-control" value="admin" placeholder="用户名" id="regist_account"/>
            <input type="password" class="form-control" placeholder="密码" id="regist_password1"/>
            <input type="password" class="form-control" placeholder="确认密码" id="regist_password2"/>
            <input type="text" class="form-control" placeholder="手机号" id="regist_phone"/>
            <input type="text" class="form-control" placeholder="验证码" id="regist_vcode"/>
            <!--<button id="getVCode" type="button" class="btn btn-success" >获取验证码</button>-->
            <input id="getVCode" type="button" class="btn btn-success" value="点击发送验证码" onclick="sendCode(this)"/>

        </div>
        <input type="button" value="注册" class="btn btn-success" id="regist_btn"/>
    </div>
</div>
<body data-spm="12028340">
<div id="app">
    <div class="page-container">
        <div class="content-wrapper">
            <div class="recent-view view-without-leftbar">
                <div class="recent-header"><h2>我的收藏</h2>
                    <div class="tabs unselectable">
                        <div class="tab active">歌曲 ${myCollection ? size}</div>
                    </div>
                </div>
                <div class="recent-action" data-spm-anchor-id="a2oj1.12028364.0.i0.2bca279109pyWD">
                    <div class="button unselectable random remarkable"><span class="iconfont"></span>全部播放<span
                                class="ripple" style="height: 130px; width: 130px; top: 0px; left: 0px;"></span></div>
                    <div class="button unselectable">全部下载<span class="ripple"
                                                               style="height: 105px; width: 105px; top: 0px; left: 0px;"></span>
                    </div>
                </div>
                <div class="recent-content">
                    <div class="table idle song-table">
                        <div class="table-container">
                            <table>
                                <thead>
                                <tr>
                                    <th class="th-index" style="width: 8%;">#</th>
                                    <th class="th-songName" style="width: 23%;">歌曲</th>
                                    <th class="th-artist" style="width: 23%;">歌手</th>
                                    <th class="th-album" style="width: 23%;">专辑</th>
                                    <th class="th-duration" style="width: 23%;">时长</th>
                                </tr>
                                <tr class="division">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody>
                                <#if myCollection? exists>
                                    <#list myCollection as col>
                                        <#if (col_index%2==0)>
                                            <tr class="even">
                                                <td>
                                                    <div class="index-container"><span
                                                                class="em index">${col_index+1}</span>
                                                        <div class="audio-icon unselectable">
                                                            <div class="column paused"
                                                                 style="animation-delay: -1.2s;"></div>
                                                            <div class="column paused"></div>
                                                            <div class="column paused"
                                                                 style="animation-delay: -1.5s;"></div>
                                                            <div class="column paused"
                                                                 style="animation-delay: -0.9s;"></div>
                                                            <div class="column paused"
                                                                 style="animation-delay: -0.6s;"></div>
                                                        </div>
                                                        <div class="iconfont play-btn" onclick="playSong(${col.getSong().song_id})"></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="songName-container">
                                                        <div class="with-mv-icon">
                                                            <div class="custom-content">
                                                                <div class="song-name em"><a
                                                                            href="/song/8GiFGD1c06e">${col.getSong().song_name}</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="artist-container">
                                                        <div class="singers"><a
                                                                    href="/artist/hfud5ee8">${col.getSong().getSinger().singerName}</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="album-container">
                                                        <div class="album"><a
                                                                    href="/album/g0s48fe6d">${col.getSong().getAlbum().album_name}</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="duration-container ops-container"><span
                                                                class="duration">${col.getSong().song_time}</span>
                                                        <div class="operations ops-right">
                                                            <div class="ops-item">
                                                                <div class="iconfont"></div>
                                                            </div>
                                                            <div class="ops-item">
                                                                <div class="iconfont"></div>
                                                            </div>
                                                            <div class="ops-item">
                                                                <div class="iconfont"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        <#else >
                                            <tr class="odd">
                                                <td>
                                                    <div class="index-container"><span
                                                                class="em index">${col_index+1}</span>
                                                        <div class="audio-icon unselectable">
                                                            <div class="column paused"
                                                                 style="animation-delay: -1.2s;"></div>
                                                            <div class="column paused"></div>
                                                            <div class="column paused"
                                                                 style="animation-delay: -1.5s;"></div>
                                                            <div class="column paused"
                                                                 style="animation-delay: -0.9s;"></div>
                                                            <div class="column paused"
                                                                 style="animation-delay: -0.6s;"></div>
                                                        </div>
                                                        <div class="iconfont play-btn" onclick="playSong(${col.getSong().song_id}"></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="songName-container">
                                                        <div class="with-mv-icon">
                                                            <div class="custom-content">
                                                                <div class="song-name em"><a
                                                                            href="/song/8GiFGD1c06e">${col.getSong().song_name}</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="artist-container">
                                                        <div class="singers"><a
                                                                    href="/artist/hfud5ee8">${col.getSong().getSinger().singerName}</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="album-container">
                                                        <div class="album"><a
                                                                    href="/album/g0s48fe6d">${col.getSong().getAlbum().album_name}</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="duration-container ops-container"><span
                                                                class="duration">${col.getSong().song_time}</span>
                                                        <div class="operations ops-right">
                                                            <div class="ops-item">
                                                                <div class="iconfont"></div>
                                                            </div>
                                                            <div class="ops-item">
                                                                <div class="iconfont"></div>
                                                            </div>
                                                            <div class="ops-item">
                                                                <div class="iconfont"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </#if>
                                    </#list>
                                </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
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
                            <li class="footer_link_item"><a href="javascript:;" target="_blank" class="js_other_link">CJ
                                    ENM</a>
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
                        <a href="javascript:;" class="copyright-p-link" target="_blank" title="About Tencent">About
                            Tencent</a>
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

                    <p class="copyright-p">Copyright &copy; 1998 - <span id="copyYear">2019</span> Tencent. <a
                                target="_blank"
                                href="javascript:;"
                                title="All Rights Reserved."
                                class="copyright-p-link">All
                            Rights Reserved.</a></p>
                    <p class="copyright-p">腾讯公司 <a class="copyright-p-link" target="_blank" href="javascript:;"
                                                   title="版权所有">版权所有</a>
                        <a target="_blank" href="javascript:;" class="copyright-p-link"
                           title="腾讯网络文化经营许可证">腾讯网络文化经营许可证</a></p>
                </div>
            </div>
        </footer>
    </div>

</div>

</body>
<script type="text/javascript">
    function playSong(songId){
        window.open("/guest/playSong?id="+songId);
    }
</script>
</html>
