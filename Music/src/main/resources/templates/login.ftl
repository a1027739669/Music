<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>jquery弹出层登录和无刷新切换全屏层注册特效 </title>
	<meta name="description" content="jquery弹出层登录和无刷新切换全屏层注册特效"/>
	<meta name="keywords" content="jquery弹出层登录和无刷新切换全屏层注册特效"/>

	<link rel="stylesheet" type="text/css" href="/css/stylelogin.css"/>

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

			$(".openlogin").click(function () {
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
				$("#reg_setp").animate({left: 0}, 500, "easeOutQuart")
			});

			$(".back_setp").click(function () {
				"block" == $("#setp_quicklogin").css("display") && $("#reg_setp").animate({left: "100%"}, 500, "easeOutQuart", function () {
					$("#reg_setp,#setp_quicklogin").hide()
				})
			});

		});
	</script>

</head>
<body>


<div id="header">
	<ul class="login fr">
		<li class="openlogin"><a href="javascript:void(0);">登录</a></li>
		<li class="reg"><a href="javascript:void(0);">注册</a></li>
	</ul>
</div>


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
			<h3><span class="fl">邮箱登录</span><span class="login_warning" style="display:none">用户名或密码错误</span>
				<div class="clear"></div>
			</h3>
			<form action="" method="post" id="login_form">
				<div class="logininput">
					<input type="text" name="username" class="loginusername" value="" placeholder="邮箱/用户名"/>
					<input type="text" class="loginuserpasswordt" value="" placeholder="密码"/>
					<input type="password" name="password" class="loginuserpasswordp" style="display:none"/>
				</div>
				<div class="loginbtn">
					<div class="loginsubmit fl"><input type="submit" value="登录" class="btn"/></div>
					<div class="fl" style="margin:26px 0 0 0;"><input id="bcdl" type="checkbox" checked="true"/>保持登录
					</div>
					<div class="fr" style="margin:26px 0 0 0;"><a href="http://www.jb51.net/">忘记密码?</a></div>
					<div class="clear"></div>
				</div>
			</form>
		</div>
	</div>

	<div class="thirdlogin">
		<div class="pd50">
			<h4>用第三方帐号直接登录</h4>
			<ul>
				<li id="sinal"><a href="http://www.jb51.net">微博帐号注册</a></li>
				<li id="qql"><a href="http://www.jb51.net">QQ帐号注册</a></li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>

</div>


<div id="reg_setp">
	<div class="back_setp">返回</div>
	<div class="blogo"></div>
<#--	<div id="setp_quicklogin">-->
<#--		<h3>您可以选择以下第三方帐号直接登录代码笔记，一分钟完成注册</h3>-->
<#--		<ul class="quicklogin_socical">-->
<#--			<li class="quicklogin_socical_weibo"><a href="http://www.jb51.net">微博帐号注册</a></li>-->
<#--			<li class="quicklogin_socical_qq" style="margin:0;"><a href="http://www.jb51.net">QQ帐号注册</a></li>-->
<#--		</ul>-->
<#--	</div>-->
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

			<input type="text" class="form-control" value="admin"  placeholder="用户名" id="regist_account"/>
			<input type="password" class="form-control" placeholder="密码" id="regist_password1" />
			<input type="password" class="form-control" placeholder="确认密码" id="regist_password2" />
			<input type="text" class="form-control" placeholder="手机号" id="regist_phone" />
			<input type="text" class="form-control" placeholder="验证码" id="regist_vcode" />
			<!--<button id="getVCode" type="button" class="btn btn-success" >获取验证码</button>-->
			<input id="getVCode" type="button" class="btn btn-success" value="点击发送验证码" onclick="sendCode(this)" />

		</div>
		<input type="button" value="注册" class="btn btn-success" id="regist_btn" />
	</div>
</div><!--reg_setp end-->
</body>
</html>

