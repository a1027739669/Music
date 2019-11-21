
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">

	<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/login.css" />
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			//打开会员登录
			$("#Login_start_").click(function() {
				$("#regist_container").hide();
				$("#_close").show();
				$("#_start").animate({
					left: '350px',
					height: '520px',
					width: '400px'
				}, 500, function() {
					$("#login_container").show(500);
					$("#_close").animate({
						height: '40px',
						width: '40px'
					}, 500);
				});
			});
			//打开会员注册
			$("#Regist_start_").click(function() {
				$("#login_container").hide();
				$("#_close").show();
				$("#_start").animate({
					left: '350px',
					height: '520px',
					width: '400px'
				}, 500, function() {
					$("#regist_container").show(500);
					$("#_close").animate({
						height: '40px',
						width: '40px'
					}, 500);
				});
			});
			//关闭
			$("#_close").click(function() {

				$("#_close").animate({
					height: '0px',
					width: '0px'
				}, 500, function() {
					$("#_close").hide(500);
					$("#login_container").hide(500);
					$("#regist_container").hide(500);
					$("#_start").animate({
						left: '0px',
						height: '0px',
						width: '0px'
					}, 500);
				});
			});
			//去 注册
			$("#toRegist").click(function(){
				$("#login_container").hide(500);
				$("#regist_container").show(500);
			});
			//去 登录
			$("#toLogin").click(function(){
				$("#regist_container").hide(500);
				$("#login_container").show(500);
			});
		});
	</script>
</head>

<body style="background-color: #000000;">

<a id="Login_start_" class="btn btn-danger" style="width:100px;height:40px;border-radius: 0;">登陆</a>
<a id="Regist_start_" class="btn btn-success" style="width:100px;height:40px;border-radius: 0;">注册</a>

<!-- 会员登录  -->
<!--<div id='Login_start' style="position: absolute;" >-->
<div id='_start'>
	<div id='_close' style="display: none;">
		<span class="glyphicon glyphicon-remove"></span>
	</div>
	<br />
	<!--登录框-->
	<div id="login_container">
		<div id="lab1">
			<span id="lab_login">会员登录</span>
			<span id="lab_toRegist">
						&emsp;还没有账号&nbsp;
						<span id='toRegist' style="color: #EB9316;cursor: pointer;">立即注册</span>
					</span>
		</div>
		<div style="width:330px;">
			<span id="lab_type1">手机号/账号登陆</span>
		</div>
		<div id="form_container1">
			<br />
			<input type="text" class="form-control" placeholder="手机号/用户名" id="login_number" value="admin" />
			<input type="password" class="form-control" placeholder="密码" id="login_password" />
			<input type="button" value="登录" class="btn btn-success" id="login_btn" />
			<span id="rememberOrfindPwd">
						<span>
							<input id="remember" type="checkbox" style="margin-bottom: -1.5px;"/>
						</span>
					<span style="color:#000000">
							记住密码&emsp;&emsp;&emsp;&emsp;
						</span>
					<span style="color:#000000">
							忘记密码
						</span>
					</span>
		</div>

		<div style="display:block;width:330px;height:40px;">
			<span id="lab_type2">使用第三方直接登陆</span>
		</div>
		<div style="width:330px;height:100px;border-bottom: 1px solid #FFFFFF;">
			<br />
			<button id="login_QQ" type="button" class="btn btn-info">
				<img src="img/qq32.png" style="width:20px;margin-top:-4px;" />&emsp;QQ登录
			</button>
			<button id="login_WB" type="button" class="btn btn-danger">
				<img src="img/sina32.png" style="width:20px;margin-top:-4px;" />&emsp;微博登录
			</button>
		</div>
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
</div>

</body>
<script type="text/javascript">
	var clock = '';
	var nums = 30;
	var btn;
	function sendCode(thisBtn) {
		btn = thisBtn;
		btn.disabled = true; //将按钮置为不可点击
		btn.value = '重新获取（'+nums+'）';
		clock = setInterval(doLoop, 1000); //一秒执行一次
	}

	function doLoop() {
		nums--;
		if (nums > 0) {
			btn.value = '重新获取（'+nums+'）';
		} else {
			clearInterval(clock); //清除js定时器
			btn.disabled = false;
			btn.value = '点击发送验证码';
			nums = 10; //重置时间
		}
	}

	$(document).ready(function(){
		$("#login_QQ").click(function(){
			alert("暂停使用！");
		});
		$("#login_WB").click(function(){
			alert("暂停使用！");
		});
	});
</script>

</html>