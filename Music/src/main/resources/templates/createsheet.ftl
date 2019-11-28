<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="baidu-site-verification" content="xaLcM8mGHG">
    <meta name="verify-v1" content="gNntuhTm2rH7Qa/GPp6lf0mIp9KQsjejNs+i1LZhG7U=">
    <link rel="icon" href="/assets/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/css/head.css">
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script src="/js/head.js"></script>
    <script src="/js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>
    <link rel="stylesheet" href="/mediastyle/yqq/layout_0412.css-max_age=25920000&v=20190312.css">
    <link rel="stylesheet" href="/mediastyle/yqq/singer_detail_59cfe684.css-max_age=25920000.css">
    <link rel="stylesheet" href="/qqmusiccss/popup_login.css">
    <link type="text/css" rel="stylesheet" href="/kuwocss/style4.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/kuwocss/styles.css">
</head>
<body data-spm="12028529">
<div id="app">
    <div class="page-container">
        <div class="top-nav" data-spm="topnav" data-spm-max-idx="">
            <div class="top-nav-wrapper"><a href="/" data-spm-anchor-id="">
                    <div class="logo"></div>
                </a>
                <div class="links"><a href="/" data-spm-anchor-id="">发现</a><a
                            href="/user/430803050?spm=a2oj1.12028025.topnav.3.54776ee17CG89x"
                            data-spm-anchor-id="">我的音乐</a><a href="//i.xiami.com" target="_blank"
                                                             rel="noreferrer noopener" data-spm-anchor-id="">音乐人</a><a
                            href="//emumo.xiami.com/apps/mobile" target="_blank" rel="noreferrer noopener"
                            data-spm-anchor-id="">客户端下载</a><a href="/vip" data-spm-anchor-id="">会员中心</a></div>
                <div class="search"><input value="" placeholder="五月天">
                    <div class="iconfont"></div>
                </div>
                <div class="message-center"><a href="/message" data-spm-anchor-id="">
                        <div class="iconfont"></div>
                    </a></div>
                <div class="user">
                    <div class="avatar"
                         style="background-image: url(songImg/1.jpg);"></div>
                </div>
            </div>
        </div>
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