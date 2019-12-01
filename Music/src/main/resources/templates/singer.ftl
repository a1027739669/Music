<html lang="zh-cn">
<head>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript"  src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta name="keywords" content="音乐,QQ音乐,在线听歌,音乐下载,音乐播放器,音乐网站,MV,巅峰榜,音乐排行榜,翻译歌曲,热门歌曲,经典老歌,无损音乐,无损曲库">
    <meta name="description"
          content="QQ音乐是腾讯公司推出的一款网络音乐服务产品，海量音乐在线试听、新歌热歌在线首发、歌词翻译、手机铃声下载、高品质无损音乐试听、海量无损曲库、正版音乐下载、空间背景音乐设置、MV观看等，是互联网音乐播放和下载的优选。">
    <title>我的音乐</title>
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
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
                $("#reg_setp,#setp_quicklogin").show();
                $("#reg_setp").animate({left: 0}, 500, "easeOutQuart");
            });

            $(".back_setp").click(function () {
                "block" == $("#setp_quicklogin").css("display") && $("#reg_setp").animate({left: "100%"}, 500, "easeOutQuart", function () {
                    $("#reg_setp,#setp_quicklogin").hide()
                })
            });

        });
    </script>
    <script src="/bin/jquery-3.4.1.js"></script>
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
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
</head>

<body class="os_mac">
<!-- 头部 S -->


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
            <a href="javascript:;" class="h-login">登录</a>
            <div class="login-mark"></div>
        </div>
    </div>
</header>
<!-- 头部 E -->


<div class="main">
    <div class="mod_data">
            <span class="data__cover">
                <a class="js_goto_tab js_none_index" data-stat="" data-tab="index" style="display:none;"><img
                            src="/upload/${singer.singerImg}"
                            alt="周杰伦" class="data__photo"></a>
		        <img src="/upload/${singer.singerImg}"
                     alt="周杰伦" class="data__photo js_index">
            </span>
        <div class="data__cont">
            <div class="data__name">
                <h1 class="data__name_txt js_none_index" style="display:none;">
                    <a class="js_goto_tab" data-stat="y_new.singer.thistab.singer_name" title="周杰伦" data-tab="index"
                       href="//y.qq.com/n/yqq/singer/0025NhlN2yWrP4.html">${singer.singerName}</a>
                </h1>
                <h1 class="data__name_txt js_index" title="周杰伦"> ${singer.singerName}</h1>

            </div>

            <div class="data__desc" id="singer_desc">
                <div class="data__desc_txt" id="short_desc">国籍：${singer.country} 生日：${singer.birthday} 性别：${singer.sex}
                    &nbsp;简介：${singer.introduction}
                </div>
                <a href="javascript:;" class="js_desc" data-left="0" data-stat="y_new.singer.header.more_info"
                   data-top="0" data-target="popup_data_detail" id="moreInfo" onclick="displayAll()">[更多]</a>

            </div>

            <ul class="mod_data_statistic">

                <li class="data_statistic__item">
                    <a href="//y.qq.com/n/yqq/singer/0025NhlN2yWrP4.html#tab=song&amp;" class="js_goto_tab"
                       data-stat="y_new.singer.header.song_tab" data-tab="song"><span
                                class="data_statistic__tit">单曲</span><strong
                                class="data_statistic__number">${singer.totalSongs}</strong></a>
                </li>


                <li class="data_statistic__item">
                    <a href="//y.qq.com/n/yqq/singer/0025NhlN2yWrP4.html#tab=album&amp;" class="js_goto_tab"
                       data-stat="y_new.singer.header.album_tab" data-tab="album"><span
                                class="data_statistic__tit">专辑</span><strong
                                class="data_statistic__number">${singer.totalAlbums}</strong></a>
                </li>


            </ul>

            <div class="data__actions" role="toolbar">

                <a href="//y.qq.com/portal/player.html" class="mod_btn_green js_singer_radio"><i
                            class="mod_btn_green__icon_play"></i>播放全部</a>

            </div>
        </div>
    </div>

    <!--首页 begin-->
    <div class="js_tab" id="index_tab">
        <div id="table1">

        </div>
        <div class="mod_part">
            <div class="part__hd">
                <h2 class="part__tit">专辑</h2>

                <a href="//y.qq.com/n/yqq/singer/0025NhlN2yWrP4.html#tab=album&amp;" class="part__more js_goto_tab"
                   data-stat="y_new.singer.index.album_all" data-tab="album">全部<i
                            class="icon_part_arrow sprite"></i></a>

            </div>
            <div class="mod_playlist">
                <ul class="playlist__list" id="albumlist">
                    <#if albumList ? exists>
                        <#list  albumList as album>
                            <li class="playlist__item"
                                onmouseover="this.className=(this.className+' playlist__item--hover')"
                                onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')"
                                data-albummid="004fXSyj3bWTMN" data-albumid="9040723">
                                <div class="playlist__item_box">
                                    <div class="playlist__cover mod_cover"><a
                                                href="" class="js_album"
                                                data-stat="y_new.singer.index.album_pic" data-albummid="004fXSyj3bWTMN"
                                                data-albumid="9040723"><img
                                                    src="/upload/${album.album_img}"
                                                    alt="周杰伦地表最强世界巡回演唱会"
                                                    class="playlist__pic"><i class="mod_cover__icon_play js_play"
                                                                             data-stat="y_new.singer.index.album_play"></i></a>
                                    </div>
                                    <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                                    href=""
                                                    title="周杰伦地表最强世界巡回演唱会" class="js_album"
                                                    data-stat="y_new.singer.index.albumName"
                                                    data-albummid="004fXSyj3bWTMN"
                                                    data-albumid="9040723">${album.album_name}</a></span></h4>
                                    <div class="playlist__other">
                                        ${album.album_release}
                                    </div>
                                    <a href="javascript:;" class="btn_operate_menu js_albumlist_more" data-type="2"
                                       data-mid="004fXSyj3bWTMN"><span class="icon_txt">更多</span></a>
                                </div>
                            </li>
                        </#list>
                    <#else >
                        <div class="none_txt">
                            <i class="none_txt__symbol"></i>
                            <p>该歌手还没有发表过专辑</p>
                        </div>
                    </#if>
                </ul>
            </div>
        </div>


        <div class="mod_part" id="similar" style="">
            <div class="part__hd">
                <h2 class="part__tit">相似歌手</h2>
            </div>
            <div class="mod_singer_list">
                <ul class="singer_list__list">
                    <#if likes ? exists>
                        <#list likes as like>
                            <li class="singer_list__item">
                                <div class="singer_list__item_box">
                                    <a href="https://y.qq.com/n/yqq/singer/001JDzPT3JdvqK.html#stat=y_new.singer.index.same_singers"
                                       onclick="setStatCookie&amp;&amp;setStatCookie();"
                                       class="singer_list__cover js_singer"
                                       data-stat="y_new.singer.index.same_singers" data-mid="001JDzPT3JdvqK"
                                       data-id="265"
                                       title="王力宏" hidefocus="true">
                                        <img class="singer_list__pic"

                                             src="/upload/${like.singerImg}"
                                             alt="王力宏">
                                    </a>
                                    <h3 class="singer_list__title"><a
                                                href="https://y.qq.com/n/yqq/singer/001JDzPT3JdvqK.html#stat=y_new.singer.index.same_singers"
                                                onclick="setStatCookie&amp;&amp;setStatCookie();" class="js_singer"
                                                data-stat="y_new.singer.index.same_singers" data-mid="001JDzPT3JdvqK"
                                                data-id="265" title="王力宏">${like.singerName}</a></h3>
                                </div>
                            </li>
                        </#list>
                    <#else >
                        <div class="none_txt" style="display:block;">
                            <i class="none_txt__symbol"></i>
                            <p>该歌手暂无相似歌手</p>
                        </div>
                    </#if>
                </ul>
            </div>
        </div>
    </div>
    <!--首页 end-->


    <!-- 专辑tab begin -->
    <div class="mod_part_detail js_tab" id="album_tab" style="display:none;">
        <div class="part_detail__hd">
            <h2 class="part_detail__tit">专辑 33</h2>
        </div>
        <div class="none_txt" style="display:none;">
            <i class="none_txt__symbol"></i>
            <p>该歌手还没有发表过专辑</p>
        </div>
        <div class="mod_playlist js_content">
            <ul class="playlist__list" id="album_box">
            </ul>
        </div>
    </div>
    <!-- 专辑tab end -->

    <!-- 专辑简介 -->
    <div class="popup_data_detail" id="popup_data_detail" data-aria="popup" style="display:none;z-index:10000000000;">
        <div class="popup_data_detail__cont">
            <h3 class="popup_data_detail__tit">歌手简介</h3>

            <p>姓名：${singer.singerName}</p>
            <p>国籍：${singer.country}</p>
            <p>出生日期：${singer.birthday}</p>
            <p>
                个人简介：${singer.introduction}</p>
            <p></p>

        </div>
        <i class="popup_data_detail__arrow"></i>
    </div>
</div>

<!-- 跟头图保持一致 -->
<div class="bg_detail"><i class="bg_detail__pic"
                          style="background-image:url(//y.gtimg.cn/music/photo_new/T001R300x300M0000025NhlN2yWrP4.jpg?max_age=2592000);"></i>
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
<script type="text/javascript">
    var singerId = "${singer.id}";
    $(function () {
        toPage(1, singerId);
    });
    $(document).ready(function () {
        $("#moreInfo").mouseover(function () {
            $("#popup_data_detail").css("display", "block");
        })

        $("#moreInfo").mouseout(function () {
            $("#popup_data_detail").css("display", "none");
        })
    });


    function toPage(num, singerId) {
        $.ajax({
            url: '/guest/singerSongs',
            type: 'GET',
            data: {
                'singerId': singerId,
                'pageId': num,
            },
            success: function (data) {
                $("#table1").empty();
                $("#table1").append(data);
            }
        });
    }
</script>
</body>
</html>