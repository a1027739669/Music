<!DOCTYPE html>
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
    <link rel="stylesheet" href="/css/head2.css">


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
		    <a class="top_login__link js_logined"
               style=""><img id="userImg"
                             src="/upload/${user.user_image}"
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
<body data-spm="12028529">
<div id="app">
    <div class="page-container">

        <div class="content-wrapper">
            <div class="edit-collect-view  view-without-leftbar">
                <div class="title" data-spm-anchor-id="a2oj1.12028529.0.i1.56e436b7UQitQs">创建歌单</div>
                <div class="edit-collect" data-spm-anchor-id="a2oj1.12028529.0.i0.56e436b7UQitQs">
                    <div class="collect-side">
                        <div class="edit-collect-logo">
                            <div><input type="file" accept="image/*" onchange="changepic(this)" hidden="" id="file">
                                <div class="collect-logo" onclick="shangchuan()">
                                    <div class="cover" id="cover" style="background-image: url(image/backgroud.jpg);">
                                        <div class="edit-collect-logo-upload empty">
                                            <div class="iconfont"></div>
                                            <div>添加封面</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="font-size: 14px; color: rgb(153, 153, 153); font-weight: 300; margin-bottom: 15px;">
                                图片最佳尺寸 1200*1200
                            </div>
                            <a href="https://act.xiami.com/wow/xiami/act/legal-agreement" target="_blank"
                               rel="noreferrer noopener" style="color: rgb(22, 90, 166);"></a></div>
                    </div>
                    <div class="collect-main">
                        <div class="edit-collect-title edit-collect-item">
                            <div class="title">
                                <div>标题</div>
                                <div class="subtitle" id="sheetName">最多30个字符</div>
                                <div class="public-status"><span class="iconfont"></span></div>
                            </div>
                            <div class="input"><input type="text" value=""></div>
                        </div>
                        <div class="edit-collect-tag edit-collect-item">
                            <div class="title">
                                <div>标签</div>
                                <div class="subtitle">最多可选择3个标签</div>
                            </div>
                            <#--                            <div class="input"><input type="text" placeholder="搜索标签" value="">-->
                            <#--                                <div>-->
                            <#--                                    <div class="iconfont"></div>-->
                            <#--                                </div>-->
                            <#--                            </div>-->
                            <div class="tags selected" id="selected"></div>
                            <div class="tags" id="tags">

                                <#list labelList as label>
                                    <div class="button unselectable" id='tag${label.id}'
                                         onclick="addLabel('${label.id}')">${label.label_name}<span class="ripple"
                                                                                                    style="height: 58px; width: 58px; top: 0px; left: 0px;"></span>
                                    </div>
                                </#list>
                            </div>
                        </div>
                        <div class="edit-collect-description edit-collect-item">
                            <div class="title">
                                <div>简介</div>
                            </div>
                            <textarea class="text-area" placeholder="我来说两句..." maxlength="20000"
                                      style="display: block; min-height: 190px; margin-bottom: 15px; resize: none; width: 100%; height: 190px;"
                                      id="textarea"></textarea>
                            <div class="row">
                                <div class="count" id="count">0/20000</div>
                            </div>
                        </div>
                        <div class="operations">
                            <div class="button unselectable">取消<span class="ripple"
                                                                     style="height: 170px; width: 170px; top: 0px; left: 0px;"></span>
                            </div>
                            <div class="button unselectable" onclick="submitSheet()">保存<span class="ripple"
                                                                                             style="height: 170px; width: 170px; top: 0px; left: 0px;"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">腾讯视频</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">手机QQ空间</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">最新版QQ</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">腾讯社交广告</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">电脑管家</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">QQ浏览器</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">腾讯微云</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">腾讯云</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">企鹅FM</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">智能电视网</a>
                        </li>
                        <li class="footer_link_item"><a href="javascript:;" target="_blank"
                                                        class="js_other_link">当贝市场</a>
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
                    <a target="_blank" href="javascript:;" class="copyright-p-link" title="腾讯网络文化经营许可证">腾讯网络文化经营许可证</a>
                </p>
            </div>
        </div>
    </footer>
</div>


</body>
<script type="text/javascript">

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $("#userImg").mouseout(function () {
            $('.popup_user').removeClass("drop");
        })
        $(".popup_user").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $(".popup_user").mouseout(function () {
            $('.popup_user').removeClass("drop");
        })
    });
</script>
<script type="text/javascript">

    layui.use('layer', function () {
        var layer = layui.layer;
    });

    function addLabel(id) {
        if ($("#tag" + id).hasClass("remarkable")) {
            $("#tag" + id).removeClass("remarkable");
            $("#selected" + id).remove();
        } else {
            if ($("#selected>div").length < 3) {
                var name = $("#tag" + id).text();
                $("#tag" + id).addClass("remarkable");
                $("#selected").append('<div class="button unselectable remarkable" id="selected' + id + '" onclick="delLabel(this)" ><span>'+name+'</span><i class="iconfont"></i><span class="ripple" style="height: 88px; width: 88px; top: -43.0333px; left: 2px;"></span></div>')
            } else {
                layer.msg("最多添加三个标签");
            }
        }
    }

    function delLabel(t) {
        $(t).remove();
        var id = $(t).attr('id').toString().substr(8);
        $("#tag" + id).removeClass("remarkable");
    }
</script>
<script type="text/javascript">
    function shangchuan() {
        $("#file").click();
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        initBind();
    })

    function initBind() {
        $("#textarea").blur(function () {
            checkMessage();
        });
        $("#textarea").keyup(function () {
            checkMessage();
        });
        $("#textarea").keydown(function () {
            checkMessage();
        });
    }

    function checkMessage() {
        $("#count").html($('#textarea').val().length + "/20000");
    }
</script>
<script type="text/javascript">
    function submitSheet() {
        var myform = new FormData();
        myform.append('file', $("#file")[0].files[0]);
        myform.append('sheetName', $("#sheetName").val());
        myform.append('textArea', $("#textarea").val());
        var userId='${Session["user"].id}';
        myform.append('userId', userId);
        var tags = $("#selected div span").text().toString().trim();
        myform.append('tags',tags);
        $.ajax({
            url: "/user/createSheet",
            type: "POST",
            data: myform,
            async: false,
            contentType: false,
            processData: false,
            success: function (result) {
                alert("成功");
            },
            error: function (data) {
                $.messager.alert("警告", "文件上传失败！", "warning", function () {
                    var file = document.getElementById('file');
                    file.value = '';
                });
            }
        });

    }

</script>
<script>
    function changepic(obj) {
        //console.log(obj.files[0]);//这里可以获取上传文件的name
        var newsrc=getObjectURL(obj.files[0]);
        $('#cover').css("background-image","url(" + newsrc+ ")");
    }
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
</script>
</html>