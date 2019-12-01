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
    <link rel="stylesheet" href="/css/head2.css">
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
<header class="header">
    <div class="header-box">
        <h1 class="header-title">
            <a href="javascript:;"><img class="logo-img" src="/image/logo.png" alt="QQ音乐"></a>
            <#--                <a href="/" class="logo" title="首页"><img src="image/logo.png"></a>-->
        </h1>
        <ul class="header-top-nav">
            <li class="top-nav-item active"><a href="#" class="tnav-link" title="音乐馆">主页</a></li>
            <li class="top-nav-item"><a onclick="toHome()" class="tnav-link" title="我的音乐">个人中心</a></li>
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
<body data-spm="12028206" style="">
<#--<div class="modal-wrapper" >-->
<#--    <div class="modal  opened" data-spm-anchor-id="a2oj1.12028197.0.i1.9d6869bbFvgbhe"><div class="modal-inner"><span class="close-btn iconfont white left"></span><div class="setting-modal"><div id="passport-form" class="need-validata"><div class="passport-form-movie">-->
<#--                        <video loop="" autoplay=""-->
<#--                               src="https://files.xiami.com/webh5/files/video/30b4a859bbf33d5fc708685d6ddd2a0f.123222.mp4"></video>-->
<#--                        <i></i></div>-->
<#--                    <div class="passport-form-content">-->
<#--                        <div class="set-password">-->
<#--                            <div class="setting-form verify-mobile">-->
<#--                                <div class="title">请先验证手机号</div>-->
<#--                                <form>-->
<#--                                    <div class="form-block"><label>手机号</label>-->
<#--                                        <div style="background-color: rgb(247, 247, 247); width: 100%; height: 30px; line-height: 30px; padding: 0px 8px;">-->
<#--                                            +86 13697288552-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="form-block">-->
<#--                                        <div id="captcha_verifyMobile" class="nc-container" data-nc-idx="1">-->
<#--                                            <div id="nc_1_wrapper" class="nc_wrapper">-->
<#--                                                <div id="nc_1_n1t" class="nc_scale">-->
<#--                                                    <div id="nc_1__bg" class="nc_bg"></div>-->
<#--                                                    <span id="nc_1_n1z" class="nc_iconfont btn_slide"></span>-->
<#--                                                    <div id="nc_1__scale_text" class="scale_text"><span-->
<#--                                                                class="nc-lang-cnt" data-nc-lang="_startTEXT">请按住滑块，拖动到最右边</span>-->
<#--                                                    </div>-->
<#--                                                    <div id="nc_1_clickCaptcha" class="clickCaptcha">-->
<#--                                                        <div class="clickCaptcha_text">-->
<#--                                                            <b id="nc_1__captcha_text" class="nc_captch_text"></b>-->
<#--                                                            <i id="nc_1__btn_2"-->
<#--                                                               class="nc_iconfont nc_btn_2 btn_refresh"></i>-->
<#--                                                        </div>-->
<#--                                                        <div class="clickCaptcha_img"></div>-->
<#--                                                        <div class="clickCaptcha_btn"></div>-->
<#--                                                    </div>-->
<#--                                                    <div id="nc_1_imgCaptcha" class="imgCaptcha">-->
<#--                                                        <div class="imgCaptcha_text"><input id="nc_1_captcha_input"-->
<#--                                                                                            maxlength="6" type="text"-->
<#--                                                                                            style="ime-mode:disabled">-->
<#--                                                        </div>-->
<#--                                                        <div class="imgCaptcha_img" id="nc_1__imgCaptcha_img"></div>-->
<#--                                                        <i id="nc_1__btn_1" class="nc_iconfont nc_btn_1 btn_refresh"-->
<#--                                                           onclick="document.getElementById('nc_1__imgCaptcha_img').children[0].click()"></i>-->
<#--                                                        <div class="imgCaptcha_btn">-->
<#--                                                            <div id="nc_1__captcha_img_text"-->
<#--                                                                 class="nc_captcha_img_text"></div>-->
<#--                                                            <div id="nc_1_scale_submit" class="nc_scale_submit"></div>-->
<#--                                                        </div>-->
<#--                                                    </div>-->
<#--                                                    <div id="nc_1_cc" class="nc-cc"></div>-->
<#--                                                    <i id="nc_1__voicebtn" tabindex="0" role="button"-->
<#--                                                       class="nc_voicebtn nc_iconfont" style="display:none"></i>-->
<#--                                                    <b id="nc_1__helpbtn" class="nc_helpbtn"><span class="nc-lang-cnt"-->
<#--                                                                                                   data-nc-lang="_learning">了解新功能</span></b>-->
<#--                                                </div>-->
<#--                                                <div id="nc_1__voice" class="nc_voice"></div>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                    <div class="form-block"><label>验证码</label>-->
<#--                                        <div class="form-input-inline"><input id="smsCode" placeholder="请输入验证码"-->
<#--                                                                              maxlength="6" pattern="\d*" value="">-->
<#--                                            <div class="sms-code">-->
<#--                                                <button disabled="">发送验证码</button>-->
<#--                                            </div>-->
<#--                                        </div>-->
<#--                                    </div>-->
<#--                                </form>-->
<#--                                <div class="button unselectable submit-button disabled">下一步<span class="ripple"-->
<#--                                                                                                 style="height: 280px; width: 280px; top: 0px; left: 0px;"></span>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</div>-->
<div id="app">
    <div class="page-container" data-spm-anchor-id="a2oj1.12028206.0.i2.5d6336b7gtEKf7">

        <div class="content-wrapper">
            <div class="user-info-set-view view-without-leftbar">
                <div class="user-info-set-title" data-spm-anchor-id="a2oj1.12028206.0.i1.5d6336b7gtEKf7">管理个人信息</div>
                <div class="user-info-set-main">
                    <div class="user-info">
                        <div class="user-avatar">
                            <div class="user-avatar-area">
                                <div class="user-avatar-container"
                                     style="background-image: url(&quot;//pic.xiami.net/images/avatar_new/559876939_1571361716.jpg?x-oss-process=image/resize,limit_0,s_410,m_fill/quality,q_80&quot;);"></div>
                                <div class="user-avatar-change"><span
                                            class="user-avatar-change-icon iconfont"></span><input type="file"
                                                                                                    class="user-avatar-input"
                                                                                                    accept="image/*"
                                                                                                    hidden=""></div>
                            </div>
                            <div class="user-avatar-desc">
                                <div>图片最佳尺寸 1200*1200</div>
                                <div>支持Gif、jpg、png等多种格式。</div>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="user-info-set">
                        <div class="form-card">
                            <div class="form-name">昵称<span class="limit-txt">最多12个字符</span></div>
                            <div><input class="text-form" type="text" placeholder="" value="渡"
                                        data-spm-anchor-id="a2oj1.12028206.0.i0.5d6336b7gtEKf7"></div>
                        </div>
                        <div class="form-card">
                            <div class="form-name">手机号<span class="limit-txt">绑定的手机号</span></div>
                            <div><input class="text-form" type="text" placeholder="" value=""></div>
                        </div>
                        <div class="form-card">
                            <div class="form-name">邮箱<span class="limit-txt">绑定之后可用邮箱登录</span></div>
                            <div><input class="text-form" type="text" placeholder="" value=""></div>
                        </div>
                        <div class="form-card">
                            <div class="form-name">签名<span class="limit-txt">最多25个字符</span></div>
                            <div><input class="text-form" type="text" placeholder="" value="我还没想好要写什么..."></div>
                        </div>
                        <div class="form-card">
                            <div class="form-name">性别</div>
                            <div>
                                <div class="select">
                                    <div>
                                        <div style="width: 115px;" class="select-form">
                                            <div>保密</div>
                                            <div class="iconfont selector-icon"></div>
                                        </div>
                                    </div>
                                    <div class="react-contextmenu-wrapper">
                                        <div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="button unselectable form-submit"
                             style="color: rgb(255, 255, 255); background-color: #31c27c;">保存<span
                                    class="ripple" style="height: 170px; width: 170px; top: 0px; left: 0px;"></span>
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
    </div>

</div>
<div class="modal-wrapper"></div>

<nav role="menu" tabindex="-1" style="position: fixed; opacity: 0; pointer-events: none;"
     class="react-contextmenu contextmenu-form-select-sex">
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">男</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">女</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">保密</div>
        </div>
    </div>
</nav>
<nav role="menu" tabindex="-1" style="position: fixed; opacity: 0; pointer-events: none;"
     class="react-contextmenu contextmenu-form-select-year">
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1909</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1910</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1911</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1912</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1913</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1914</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1915</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1916</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1917</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1918</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1919</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1920</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1921</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1922</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1923</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1924</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1925</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1926</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1927</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1928</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1929</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1930</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1931</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1932</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1933</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1934</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1935</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1936</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1937</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1938</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1939</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1940</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1941</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1942</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1943</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1944</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1945</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1946</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1947</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1948</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1949</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1950</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1951</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1952</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1953</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1954</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1955</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1956</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1957</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1958</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1959</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1960</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1961</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1962</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1963</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1964</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1965</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1966</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1967</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1968</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1969</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1970</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1971</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1972</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1973</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1974</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1975</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1976</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1977</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1978</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1979</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1980</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1981</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1982</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1983</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1984</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1985</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1986</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1987</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1988</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1989</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1990</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1991</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1992</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1993</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1994</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1995</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1996</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1997</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1998</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1999</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2000</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2001</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2002</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2003</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2004</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2005</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2006</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2007</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2008</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2009</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2010</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2011</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2012</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2013</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2014</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2015</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2016</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2017</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2018</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2019</div>
        </div>
    </div>
</nav>
<nav role="menu" tabindex="-1" style="position: fixed; opacity: 0; pointer-events: none;"
     class="react-contextmenu contextmenu-form-select-month">
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">3</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">4</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">5</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">6</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">7</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">8</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">9</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">10</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">11</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">12</div>
        </div>
    </div>
</nav>
<nav role="menu" tabindex="-1" style="position: fixed; opacity: 0; pointer-events: none;"
     class="react-contextmenu contextmenu-form-select-day">
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">1</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">2</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">3</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">4</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">5</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">6</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">7</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">8</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">9</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">10</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">11</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">12</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">13</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">14</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">15</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">16</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">17</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">18</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">19</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">20</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">21</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">22</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">23</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">24</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">25</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">26</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">27</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">28</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">29</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">30</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">31</div>
        </div>
    </div>
</nav>
<nav role="menu" tabindex="-1" style="position: fixed; opacity: 0; pointer-events: none;"
     class="react-contextmenu contextmenu-form-select-province">
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">北京市</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">天津市</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">河北省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">山西省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">辽宁省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">吉林省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">上海市</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">江苏省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">浙江省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">安徽省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">福建省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">江西省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">山东省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">河南省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">内蒙古自治区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">黑龙江省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">湖北省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">湖南省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">广东省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">广西壮族自治区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">海南省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">四川省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">重庆市</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">台湾省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">贵州省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">云南省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">西藏自治区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">陕西省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">甘肃省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">青海省</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">宁夏回族自治区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">新疆维吾尔族自治区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">香港特别行政区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">澳门特别行政区</div>
        </div>
    </div>
    <div class="react-contextmenu-item" role="menuitem" tabindex="-1" aria-disabled="false">
        <div class="content">
            <div class="form-select">海外</div>
        </div>
    </div>
</nav>
<nav role="menu" tabindex="-1" style="position: fixed; opacity: 0; pointer-events: none;"
     class="react-contextmenu contextmenu-form-select-city"></nav>

</body>
</html>