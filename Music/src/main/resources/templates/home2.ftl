<!DOCTYPE html>
<html lang="en">
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
<body data-spm="12028041">
<div id="app">
    <div class="page-container">

        <div class="content-wrapper">
            <div class="my-music-view">
                <div class="sticky-leftbar is-affixed" data-spm="leftbar" style="position: relative;">
                    <div class="leftbar-inner"
                         style="position: fixed; top: 0px; left: 96.6667px; width: 265px; transform: translate3d(0px, 0px, 0px);">
                        <div class="leftbar-content">
                            <div class="personal-panel">
                                <div class="avatar"
                                     style="opacity: 1; background-image: url('/upload/${user.user_image}');"></div>
                                <div class="name">
                                    ${user.username}
                                </div>
                                <div class="tag clearfix">
                                    <div class="iconfont levelTag"></div>
                                </div>
                                <div class="visitor-action">

                                    <div class="button unselectable iconfont chat"><span class="ripple"
                                                                                          style="height: 40px; width: 40px; top: 0px; left: 0px;"></span>
                                    </div>
                                    <div class="button unselectable iconfont more"><span class="ripple"
                                                                                          style="height: 40px; width: 40px; top: 0px; left: 0px;"></span>
                                    </div>
                                </div>
                                <div class="talentDes"></div>
                                <div class="signature">我还没想好要写什么...</div>
                                <div class="description">来自宇宙深处的，2019年10月加入</div>
                                <div class="info-count"><a href="https://www.xiami.com/record/430803050">
                                        <div class="item">
                                            <div class="item-count">0</div>
                                            <div class="item-name">累计播放</div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="view-body">
                    <div class="count-list" style="margin-top: 0px;">
                        <div class="count-item"><a href="https://www.xiami.com/recent/430803050">
                                <div class="count-wrap">
                                    <div class="iconfont"></div>
                                    <div class="content">
                                        <div class="count">0</div>
                                        <div class="name">最近播放</div>
                                    </div>
                                </div>
                            </a></div>
                        <div class="count-item"><a href="https://www.xiami.com/favorite/430803050">
                                <div class="count-wrap">
                                    <div class="iconfont"></div>
                                    <div class="content">
                                        <div class="count">0</div>
                                        <div class="name">所有收藏</div>
                                    </div>
                                </div>
                            </a></div>
                    </div>
                    <div class="collect-list">
                        <div class="block-title unselectable"><h2>创建的歌单</h2>
                            <div class="external">
                                <a href="/user/create" class="mod_btn js_follow" ><i class="mod_btn__icon_more"
                                                                                    data-status="0"></i>新建歌单</a>
                                <a
                                        href="">
                                    <div class="action">|全部
                                        <div class="button unselectable action round">
                                            <div class="iconfont"></div>
                                            <span class="ripple"
                                                  style="height: 40px; width: 40px; top: 0px; left: 0px;"></span></div>
                                    </div>
                                </a></div>
                        </div>
                        <div>
                            <div class="adaptive-list" style="opacity: 1;">
                                <#if myCreate ? exists>
                                    <#list myCreate as create>
                                        <div class="collect-item unselectable" style="flex: 0 0 20%; max-width: 20%;">
                                            <div class="wrapper"><a href="">
                                                    <div class="cover"
                                                         style="background-image: url('/upload/${create.sheetImg}');">
                                                        <div class="count"><i class="iconfont"></i>${create.support}
                                                        </div>
                                                        <div class="action">
                                                            <button class="play"><i class="iconfont"></i></button>
                                                        </div>
                                                    </div>
                                                </a></div>
                                            <div class="info">
                                                <div class="name"><a href="">${create.sheetName}</a>
                                                </div>
                                                <div class="song-tags" data-spm="songtags">
                                                    <#list create.labels ? split(',') as label>
                                                        <span class="tag-tag"><a
                                                                    href="">${label}</a></span>
                                                    </#list>

                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </div>
                    <div class="collect-list">
                        <div class="block-title unselectable"><h2>收藏的歌单</h2>
                            <div class="external"><a
                                        href="https://www.xiami.com/list/collect?id=430803050&amp;type=favorite">
                                    <div class="action">全部
                                        <div class="button unselectable action round">
                                            <div class="iconfont"></div>
                                            <span class="ripple"
                                                  style="height: 40px; width: 40px; top: 0px; left: 0px;"></span></div>
                                    </div>
                                </a></div>
                        </div>
                        <div>
                            <div class="adaptive-list" style="opacity: 1;">
                                <#if myCollection ? exists>
                                    <#list myCollection as collection>
                                        <div class="collect-item unselectable" style="flex: 0 0 20%; max-width: 20%;">
                                            <div class="wrapper"><a href="https://www.xiami.com/collect/365764247">
                                                    <div class="cover"
                                                         style="background-image: url('/upload/${collection.sheetImg}');">
                                                        <div class="count"><i
                                                                    class="iconfont"></i>${collection.support}</div>
                                                        <div class="action">
                                                            <button class="play"><i class="iconfont"></i></button>
                                                        </div>
                                                    </div>
                                                </a></div>
                                            <div class="info">
                                                <div class="name"><a
                                                            href="https://www.xiami.com/collect/365764247">${collection.sheetName}</a>
                                                </div>
                                                <div class="author"><a
                                                            href="https://www.xiami.com/user/52300480">${collection.getUser().nicheng}</a>
                                                </div>
                                                <div class="song-tags" data-spm="songtags">
                                                    <#list collection.labels ? split(',') as label>
                                                        <span class="tag-tag"><a
                                                                    href="">${label}</a></span>
                                                    </#list>

                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>


        <div class="back-to-top" data-spm="back2top">
            <div class="button unselectable invisible iconfont round"><span class="ripple"
                                                                             style="height: 40px; width: 40px; top: 0px; left: 0px;"></span>
            </div>
        </div>
    </div>
</div>


<div class="modal-wrapper"></div>


</body>
<script type="text/javascript">

    $(document).ready(function () {
        $("#userImg").mouseover(function () {
            $(".popup_user").addClass("drop");
        })
        $("#userImg").mouseout(function () {
            $('.popup_user').removeClass("drop");
        })
    });
</script>
</html>