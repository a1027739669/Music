<html lang="zh-cn">
<head>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <script type="text/javascript"  src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <title>${singer.singerName}</title>
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">
    <link rel="stylesheet" href="/mystatic/kuwocss.css">
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
            <li class="top-nav-item active"><a href="#" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="音乐号">排行榜</a></li>
            <li class="top-nav-item"><a href="#" class="tnav-link" title="音乐号">分类歌单</a></li>


        </ul>
        <ul class="header-sec-nav">
            <li class="sec-nav-item"><a href="#" class="nav-link">首页</a></li>
            <li class="sec-nav-item active"><a href="/guest/singerlist" class="nav-link">歌手</a></li>
            <li class="sec-nav-item"><a href="/guest/albumlist" class="nav-link">专辑</a></li>
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
                                <a href="/guest/detail?songId=${hot.songId}" class="hot-link">
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
                            <div class="popup_user_toolbar__tit"><a href="//y.qq.com/portal/vipportal/index.html"
                                                                    target="_blank" rel="noopener">绿钻豪华版</a>
                            </div>
                            <div class="popup_user_toolbar__desc c_tx_thin">

                                2019-12-03 到期

                            </div>
                            <a class="mod_btn_green popup_user_toolbar__btn_vip js_openvip" href="javascript:;"
                               data-aid="music.pc.20318.newyqqhover" data-stat="music.20318.btnclick.pc">续费</a>
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
                    <a href="#index_tab" class="js_goto_tab"
                       data-stat="y_new.singer.header.song_tab" data-tab="song"><span
                                class="data_statistic__tit">单曲</span><strong
                                class="data_statistic__number">${singer.totalSongs}</strong></a>
                </li>


                <li class="data_statistic__item">
                    <a href="#albumlist" class="js_goto_tab"
                       data-stat="y_new.singer.header.album_tab" data-tab="album"><span
                                class="data_statistic__tit">专辑</span><strong
                                class="data_statistic__number">${singer.totalAlbums}</strong></a>
                </li>


            </ul>


        </div>
    </div>

    <!--首页 begin-->
    <div class="js_tab" id="index_tab">
        <div class="mod_songlist_toolbar">
            <a onclick="playSingerAll()" class="mod_btn js_all_play" data-stat="y_new.singer.song.playall"><i class="mod_btn__icon_play"></i>播放全部</a>
            <a onclick="AllAddToSheet(this)" class="mod_btn js_all_fav" data-stat="y_new.singer.song.addall"><i class="mod_btn__icon_add"></i>添加到</a>
            <a onclick="alldownsong()" class="mod_btn js_all_down" data-stat="y_new.singer.song.downloadall"><i class="mod_btn__icon_down"></i>下载</a>
            <a id="batchope" class="mod_btn js_batch" data-stat="y_new.singer.song.batch"><i class="mod_btn__icon_batch"></i>批量操作</a>
        </div>
        <div id="table1">

        </div>
        <div class="mod_part">
            <div class="part__hd">
                <h2 class="part__tit">专辑</h2>

                <a href="/guest/singeralbums?singerId=${singer.getId()}" class="part__more js_goto_tab"
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
                                                    data-albumid="9040723">${album.albumName}</a></span></h4>
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
                                    <a href="/guest/singerDetail?singerId=${like.id}"
                                       class="singer_list__cover js_singer"
                                       data-stat="y_new.singer.index.same_singers" data-mid="001JDzPT3JdvqK"
                                       data-id="265"
                                       title="王力宏" hidefocus="true">
                                        <img class="singer_list__pic"

                                             src="/upload/${like.singerImg}"
                                            >
                                    </a>
                                    <h3 class="singer_list__title"><a
                                      href="/guest/singerDetail?singerId=${like.id}"
                                                onclick="setStatCookie&amp;&amp;setStatCookie();" class="js_singer"
                                                data-stat="y_new.singer.index.same_singers" data-mid="001JDzPT3JdvqK"
                                                data-id="265" >${like.singerName}</a></h3>
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
<div class="mod_operate_menu" style="position: absolute; display: none; left: 434px; top: 594px;" id="fav_pop">
    <div class="operate_menu__cont">
        <a href="javascript:;" class="operate_menu__link js_addto_playlist">播放队列</a>
        <ul role="menu" class="operate_menu__list operate_menu__top_line operate_menu__bottom_line">
            <#if Session['loginusersheet'] ? exists>
                <#list Session['loginusersheet'] as tempsheet>
                    <li class="operate_menu__item">
                        <a onclick="toAdd(${tempsheet.id})"
                           class="operate_menu__link js_addto_taogelist"
                           data-dirid="201" title="${tempsheet.sheetName}"><i
                                    class="operate_menu__icon_like"></i>${tempsheet.sheetName} </a>
                    </li>
                </#list>
            </#if>
        </ul>
        <a onclick="addtonewsheet()" class="operate_menu__link js_addto_new"><i
                    class="operate_menu__icon_add sprite"></i>创建新歌单</a>
    </div>
</div>
<div class="modal-wrapper">
    <div class="modal opened" id="loginmodel">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel1"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-login-wrapper">
                            <div id="login-container">
                                <div class="login-tab"><span class="current"
                                    >账户登录</span><span
                                            class=""
                                            data-spm-anchor-id="a2oj1.12028025.0.i1.54776ee1fdgM1B">手机验证码</span></div>
                                <form id="loginform">
                                    <div class="account-login">
                                        <div class="form-block"><label for="account">账号</label><input id="username"
                                                                                                      type="text"
                                                                                                      placeholder="请输入邮箱或手机"
                                                                                                      autocomplete="off"
                                                                                                      autocorrect="off"
                                                                                                      autocapitalize="off"
                                                                                                      spellcheck="false"
                                                                                                      class=""></div>
                                        <div class="form-block"><label for="password">密码</label><input id="password"
                                                                                                       type="password"
                                                                                                       placeholder="请输入密码">
                                        </div>
                                        <div class="form-block form-action">
                                            <button id="account-login-submit" type="button">登录</button>
                                        </div>
                                        <div class="form-block form-extra"><a class="right">忘记密码？</a><a
                                                    id="loginregister">注册</a></div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-wrapper">
    <div class="modal opened" id="registermodel">
        <div class="modal-inner"><span class="close-btn iconfont white left" id="cancel2"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-register-wrapper">
                            <div id="agreement-container">
                                <div class="agreement-title">新用户注册<em>轻松两步即可完成注册</em></div>
                                <form>
                                    <div class="agreement-content">
                                        <div class="form-block"><label for="mobile">手机号</label>
                                            <div class="form-input-inline">
                                                <div class="country-code unselectable">
                                                    <div class="select">
                                                        <div>
                                                            <div class="button unselectable selector">+86<span
                                                                        class="iconfont selector-icon"></span><span
                                                                        class="ripple"
                                                                        style="height: 80px; width: 80px; top: 0px; left: 0px;"></span>
                                                            </div>
                                                        </div>
                                                        <div class="react-contextmenu-wrapper">
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input id="mobile" type="tel" placeholder="请输入手机号" autocomplete="off"
                                                       autocorrect="off" autocapitalize="off" spellcheck="false"
                                                       maxlength="11" class=""></div>
                                        </div>
                                        <div class="form-block"><label for="smsCode">验证码</label>
                                            <div class="form-input-inline"><input id="smsCode" type="text"
                                                                                  placeholder="请输入验证码" maxlength="6"
                                                                                  pattern="\d*" class="" value="">
                                                <div class="sms-code">
                                                    <button disabled="">发送验证码</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-block form-action">
                                            <button id="agreement-submit">下一步</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="step-notice"><a id="returnlogin">返回登录</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal-wrapper">
    <div class="modal opened" id="secondstep">
        <div class="modal-inner"><span class="close-btn iconfont white left"></span>
            <div class="popup-login">
                <div id="passport-form" class="need-validata">
                    <div class="passport-form-movie">
                        <i></i></div>
                    <div class="passport-form-content">
                        <div class="popup-register-wrapper">
                            <div id="register-container">
                                <div class="register-title">新用户注册<em>请输入6-12位密码</em></div>
                                <form>
                                    <div class="register-pwd">
                                        <div class="form-block"><label for="password">密码</label><input id="password"
                                                                                                       type="password"
                                                                                                       placeholder="请输入你要设定的密码"
                                                                                                       autocomplete="off"
                                                                                                       class=""></div>
                                        <div class="form-block"><label for="pw2">重复密码</label><input id="pw2"
                                                                                                    type="password"
                                                                                                    placeholder="再输入一次你设定的密码"
                                                                                                    autocomplete="off"
                                                                                                    class=""></div>
                                        <div class="form-block form-action">
                                            <button id="register-submit">完成注册</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="step-notice"><a id="laststep">返回上一步</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
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

    function playSingerAll() {
        var singerId='${singer.getId()}';
        window.open("/guest/playsingerall?singerId="+singerId);
    }

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
<script type="text/javascript">
    $(function () {
        layui.use('layer', function () {
            var layer = layui.layer;
        });
        $('#account-login-submit').click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "text",//预期服务器返回的数据类型
                url: "/guest/login",//url
                data: {"username": username, "password": password},
                async: false,
                success: function (result) {
                    if (result != "登录成功") {
                        layer.alert(result);
                    } else {
                        location.reload();
                        layer.msg("登录成功!");
                    }
                },
                error: function () {
                    alert("异常！");
                }
            });
        });
    });
    $(function () {
        $('#account-login-submit').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                $("#account-login-submit").click();
            }
        });

    });
</script>
<script type="text/javascript">
    function singledown(songId){
        <#if Session['user'] ? exists>
        window.location.href="/user/downsinglesong?id="+songId;
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>
    }

    function alldownsong() {
        var songIdList = [];
        <#if Session['user'] ? exists>
        if($("#songList").hasClass("mod_songlist--edit")) {
            $("#songList li").each(function (index, item) {
                if (typeof ($(item).attr("ix")) != "undefined") {
                    if ($(item).find(".sprite").hasClass("songlist__edit--check"))
                        songIdList.push($(item).attr("ix"));
                }
            });
        }
        if(songIdList.length===0){
            layer.msg("请先进行批量操作");
            return;
        }
        else {
            window.location.href = "/user/downsongbyids?ids="+songIdList;
        }

        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>

    }


    function AllAddToSheet(t) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;
        var songIdList = [];
        if($("#songList").hasClass("mod_songlist--edit")) {
            $("#songList li").each(function (index, item) {
                if (typeof ($(item).attr("ix")) != "undefined") {
                    if ($(item).find(".sprite").hasClass("songlist__edit--check"))
                        songIdList.push($(item).attr("ix"));
                }
            });
        }
        if(songIdList.length===0){
            layer.msg("请先进行批量操作");
            return;
        }
        <#if Session['user'] ? exists>
        $("#fav_pop").css("left", left + 15 + "px");
        $("#fav_pop").css("top", top + 20 + "px");
        $("#fav_pop").css("display", "block");
        $("#fav_pop").data("songId", songIdList);
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        return;
        </#if>

    }

    function addtosheet(t, songId) {
        var left = $(t).offset().left;
        var top = $(t).offset().top;
        <#if Session['user'] ? exists>
        $("#fav_pop").css("left", left + 15 + "px");
        $("#fav_pop").css("top", top + 20 + "px");
        $("#fav_pop").css("display", "block");
        $("#fav_pop").data("songId", songId);
        <#else >
        layer.msg("请登录");
        $("#openlogin").click();
        </#if>
    }

    function toAdd(sheetId) {
        var songId = $("#fav_pop").data("songId");
        $.ajax({
            url: '/user/addtosheet',
            type: 'GET',
            traditional: true,
            data: {
                'sheetId': sheetId,
                'songId': songId,
            },
            success: function (data) {
                layer.msg(data);
            }
        });
    }

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $("#userImg").mouseout(function () {
            $('.popup_user').removeClass("drop");
        })
        $("#fav_pop").mouseleave(function () {
            $("#fav_pop").css("display", "none");
        });
    });

    function playSong(songId) {
        window.open("/guest/playSong?id=" + songId);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#batchope").click(function () {
            if ($("#batchope").text() === "批量操作") {
                $("#batchope").text("取消批量操作");
                $("#songList").addClass("mod_songlist--edit");
            } else {
                $("#batchope").text("批量操作");
                $("#songList").removeClass("mod_songlist--edit");
            }
        });
    });

    function allclick(t) {
        if($(t).parent(".songlist__edit").hasClass("songlist__edit--check")){
            $(t).parent(".songlist__edit").removeClass("songlist__edit--check");
            $(".songlist__edit").each(
                function (index,item) {
                    $(item).removeClass("songlist__edit--check");
                }
            );
        }
        else {
            $(t).parent(".songlist__edit").addClass("songlist__edit--check");
            $(".songlist__edit").each(
                function (index,item) {
                    $(item).addClass("songlist__edit--check");
                }
            );
        }
    }

    function changestate(t) {
        if($(t).parent(".songlist__edit").hasClass("songlist__edit--check")){
            $(t).parent(".songlist__edit").removeClass("songlist__edit--check");
        }
        else
        {
            $(t).parent(".songlist__edit").addClass("songlist__edit--check");
        }
    }

</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#openlogin").click(function () {
            $("#loginmodel").addClass("active");
        });
        $("#loginregister").click(function () {
            $("#loginmodel").removeClass("active");
            $("#registermodel").addClass("active");
        });
        $("#returnlogin").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").addClass("active");
        });
        $("#cancel1").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
        });
        $("#cancel2").click(function () {
            $("#registermodel").removeClass("active");
            $("#loginmodel").removeClass("active");
        });
    });
</script>
</html>