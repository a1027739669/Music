<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>登录</title>
    <link rel="stylesheet" href="/css/normalize.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jQuery3.4.js"></script>
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/sign-up-login.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="/css/inputEffect.css"/>
    <link rel="stylesheet" href="/css/verifyCode.css"/>
    <link rel="stylesheet" href="/css/tooltips.css"/>
    <link rel="stylesheet" href="/css/spop.min.css"/>

    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="/js/snow.js"></script>
    <script src="/js/jquery.pure.tooltips.js"></script>
    <script src="/js/verifyCode.js"></script>
    <script src="/js/spop.min.js"></script>
    <script type="text/javascript">
        var rc = window.rc || {};
        rc.msg = {
            alert: function (message, title, callback) {
                if (title == null) title = "提示信息";
                rc.msg._show(title,
                    message,
                    null,
                    "alert",
                    function (result) {
                        if (callback) callback(result);
                    });
            },
            confirm: function (message, title, callback) {
                if (title == null) title = "操作确认";
                rc.msg._show(title,
                    message,
                    null,
                    "confirm",
                    function (result) {
                        if (callback) callback(result);
                    });
            },
            _show: function (title, msg, value, type, callback) {
                var html = "";
                html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + "</span>";
                html += '<div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
                if (type == "alert") {
                    html += '<input id="mb_btn_ok" type="button" value="确定" />';
                }
                if (type == "confirm") {
                    html += '<input id="mb_btn_no" type="button" value="取消" />';
                    html += '<input id="mb_btn_ok" type="button" value="确定" />';
                }
                html += "</div></div>";

                //必须先将_html添加到body，再设置Css样式
                $("body").append(html);
                rc.msg.initCss();

                switch (type) {
                    case "alert":
                        $("#mb_btn_ok").click(function () {
                            rc.msg._hide();
                            callback(true);
                        });
                        $("#mb_btn_ok").focus().keypress(function (e) {
                            if (e.keyCode == 13 || e.keyCode == 27) {
                                $("#mb_btn_ok").trigger("click");
                            }
                        });
                        break;
                    case "confirm":
                        $("#mb_btn_ok").click(function () {
                            rc.msg._hide();
                            if (callback) callback(true);
                        });
                        $("#mb_btn_no").click(function () {
                            rc.msg._hide();
                            if (callback) callback(false);
                        });
                        $("#mb_btn_no").focus();
                        $("#mb_btn_ok, #mb_btn_no").keypress(function (e) {
                            if (e.keyCode == 13) $("#mb_btn_ok").trigger("click");
                            if (e.keyCode == 27) $("#mb_btn_no").trigger("click");
                        });
                        break;
                }
            },
            _hide: function () {
                $("#mb_box,#mb_con").remove();
            },
            initCss: function () {
                $("#mb_box").css({
                    width: "100%",
                    height: "100%",
                    zIndex: "99999",
                    position: "fixed",
                    filter: "Alpha(opacity=60)",
                    backgroundColor: "black",
                    top: "0",
                    left: "0",
                    opacity: "0.6"
                });

                $("#mb_con").css({
                    zIndex: "999999",
                    width: "350px",
                    height: "200px",
                    position: "fixed",
                    backgroundColor: "White",
                });

                $("#mb_tit").css({
                    display: "block",
                    fontSize: "14px",
                    color: "#444",
                    padding: "10px 15px",
                    backgroundColor: "#fff",
                    borderRadius: "15px 15px 0 0",
                    fontWeight: "bold",
                    "border-bottom": "1px solid #ddd"
                });

                $("#mb_msg").css({
                    padding: "20px",
                    lineHeight: "40px",
                    textAlign: "center",
                    fontSize: "18px",
                    color: "#4c4c4c"
                });

                $("#mb_ico").css({
                    display: "block",
                    position: "absolute",
                    right: "10px",
                    top: "9px",
                    border: "1px solid Gray",
                    width: "18px",
                    height: "18px",
                    textAlign: "center",
                    lineHeight: "16px",
                    cursor: "pointer",
                    borderRadius: "12px",
                    fontFamily: "微软雅黑"
                });

                $("#mb_btnbox").css({margin: "15px 0px 10px 0", textAlign: "center"});
                $("#mb_btn_ok,#mb_btn_no").css({
                    width: "80px",
                    height: "30px",
                    color: "white",
                    border: "none",
                    borderRadius: "4px"
                });
                $("#mb_btn_ok").css({backgroundColor: "#FF5722"});
                $("#mb_btn_no").css({backgroundColor: "gray", marginRight: "40px"});


                //右上角关闭按钮hover样式
                $("#mb_ico").hover(function () {
                        $(this).css({backgroundColor: "Red", color: "White"});
                    },
                    function () {
                        $(this).css({backgroundColor: "#DDD", color: "black"});
                    });

                var width = document.documentElement.clientWidth; //屏幕宽
                var height = document.documentElement.clientHeight; //屏幕高

                var boxWidth = $("#mb_con").width();
                var boxHeight = $("#mb_con").height();

                //让提示框居中
                $("#mb_con").css({top: (height - boxHeight) / 2 + "px", left: (width - boxWidth) / 2 + "px"});
            }

        };

    </script>
    <script>
        (function () {
            // trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
            if (!String.prototype.trim) {
                (function () {
                    // Make sure we trim BOM and NBSP
                    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                    String.prototype.trim = function () {
                        return this.replace(rtrim, '');
                    };
                })();
            }

            [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
                // in case the input is already filled..
                if (inputEl.value.trim() !== '') {
                    classie.add(inputEl.parentNode, 'input--filled');
                }

                // events:
                inputEl.addEventListener('focus', onInputFocus);
                inputEl.addEventListener('blur', onInputBlur);
            });

            function onInputFocus(ev) {
                classie.add(ev.target.parentNode, 'input--filled');
            }

            function onInputBlur(ev) {
                if (ev.target.value.trim() === '') {
                    classie.remove(ev.target.parentNode, 'input--filled');
                }
            }
        })();

        $(function () {
            $('#login #login-password').focus(function () {
                $('.login-owl').addClass('password');
            }).blur(function () {
                $('.login-owl').removeClass('password');
            });
            $('#login #register-password').focus(function () {
                $('.register-owl').addClass('password');
            }).blur(function () {
                $('.register-owl').removeClass('password');
            });
            $('#login #register-repassword').focus(function () {
                $('.register-owl').addClass('password');
            }).blur(function () {
                $('.register-owl').removeClass('password');
            });
            $('#login #forget-password').focus(function () {
                $('.forget-owl').addClass('password');
            }).blur(function () {
                $('.forget-owl').removeClass('password');
            });
        });

        function goto_register() {
            $("#register-username").val("");
            $("#register-password").val("");
            $("#register-repassword").val("");
            $("#register-code").val("");
            $("#tab-2").prop("checked", true);
        }

        function goto_login() {
            $("#login-username").val("");
            $("#login-password").val("");
            $("#tab-1").prop("checked", true);
        }

        function goto_forget() {
            $("#forget-username").val("");
            $("#forget-password").val("");
            $("#forget-code").val("");
            $("#tab-3").prop("checked", true);
        }

        function login() {//登录
            var username = $("#login-username").val(),
                password = $("#login-password").val(),
                verifycode = $("#login-verify-code").val(),
                validatecode = null;
            //判断用户名密码是否为空
            if (username == "") {
                $.pt({
                    target: $("#login-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名不能为空"
                });
                return;
            }
            if (password == "") {
                $.pt({
                    target: $("#login-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "密码不能为空"
                });
                return;
            }
            if (verifycode == "") {
                $.pt({
                    target: $("#login-verify-code-canvas"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "验证码不能为空"
                });
                return;
            }
            if (timeout_flag) {
                $.pt({
                    target: $("#login-verify-code-canvas"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "验证码已经失效"
                });
                return;
            }
            //用户名只能是15位以下的字母或数字
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#login-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名必须为15位以下的字母或数字"
                });
                return;
            }
            //判断验证码是否正确
            if (verifycode != show_num.join("")) {
                $.pt({
                    target: $("#login-verify-code-canvas"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "验证码不正确"
                });
                return;
            }

            //登录
            //调用后台登录验证的方法
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "text",//预期服务器返回的数据类型
                url: "/back/tologin",//url
                data: {"username": username, "password": password},
                async: false,
                success: function (result) {
                    if (result == "OK") {
                        window.location.href = "/back/index";
                    } else {
                        rc.msg.alert(result);
                    }
                },

            });
        }

        //注册
        function register() {
            var username = $("#register-username").val(),
                password = $("#register-password").val(),
                repassword = $("#register-repassword").val(),
                code = $("#register-code").val(),
                flag = false,
                validatecode = null;
            //判断用户名密码是否为空
            if (username == "") {
                $.pt({
                    target: $("#register-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名不能为空"
                });
                flag = true;
            }
            if (password == "") {
                $.pt({
                    target: $("#register-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "密码不能为空"
                });
                flag = true;
            } else {
                if (password != repassword) {
                    $.pt({
                        target: $("#register-repassword"),
                        position: 'r',
                        align: 't',
                        width: 'auto',
                        height: 'auto',
                        content: "两次输入的密码不一致"
                    });
                    flag = true;
                }
            }
            //用户名只能是15位以下的字母或数字
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#register-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名必须为15位以下的字母或数字"
                });
                flag = true;
            }
            //检查用户名是否已经存在
            //调后台代码检查用户名是否已经被注册

            //检查注册码是否正确
            //调后台方法检查注册码，这里写死为11111111
            if (code != '11111111') {
                $.pt({
                    target: $("#register-code"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "注册码不正确"
                });
                flag = true;
            }


            if (flag) {
                return false;
            } else {//注册
                spop({
                    template: '<h4 class="spop-title">注册成功</h4>即将于3秒后返回登录',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 3000,
                    onOpen: function () {
                        var second = 2;
                        var showPop = setInterval(function () {
                            if (second == 0) {
                                clearInterval(showPop);
                            }
                            $('.spop-body').html('<h4 class="spop-title">注册成功</h4>即将于' + second + '秒后返回登录');
                            second--;
                        }, 1000);
                    },
                    onClose: function () {
                        goto_login();
                    }
                });
                return false;
            }
        }

        //重置密码
        function forget() {
            var username = $("#forget-username").val(),
                password = $("#forget-password").val(),
                code = $("#forget-code").val(),
                flag = false,
                validatecode = null;
            //判断用户名密码是否为空
            if (username == "") {
                $.pt({
                    target: $("#forget-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名不能为空"
                });
                flag = true;
            }
            if (password == "") {
                $.pt({
                    target: $("#forget-password"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "密码不能为空"
                });
                flag = true;
            }
            //用户名只能是15位以下的字母或数字
            var regExp = new RegExp("^[a-zA-Z0-9_]{1,15}$");
            if (!regExp.test(username)) {
                $.pt({
                    target: $("#forget-username"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "用户名必须为15位以下的字母或数字"
                });
                flag = true;
            }
            //检查用户名是否存在
            //调后台方法

            //检查注册码是否正确
            if (code != '11111111') {
                $.pt({
                    target: $("#forget-code"),
                    position: 'r',
                    align: 't',
                    width: 'auto',
                    height: 'auto',
                    content: "注册码不正确"
                });
                flag = true;
            }


            if (flag) {
                return false;
            } else {//重置密码
                spop({
                    template: '<h4 class="spop-title">重置密码成功</h4>即将于3秒后返回登录',
                    position: 'top-center',
                    style: 'success',
                    autoclose: 3000,
                    onOpen: function () {
                        var second = 2;
                        var showPop = setInterval(function () {
                            if (second == 0) {
                                clearInterval(showPop);
                            }
                            $('.spop-body').html('<h4 class="spop-title">重置密码成功</h4>即将于' + second + '秒后返回登录');
                            second--;
                        }, 1000);
                    },
                    onClose: function () {
                        goto_login();
                    }
                });
                return false;
            }
        }


    </script>
    <style type="text/css">
        html {
            width: 100%;
            height: 100%;
        }

        body {

            background-repeat: no-repeat;

            background-position: center center;

            background-color: #00BDDC;

            background-image: url("/images/snow.jpg");

            background-size: 100% 100%;

        }

        .snow-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 100001;
        }

    </style>
</head>
<body>
<!-- 雪花背景 -->
<div class="snow-container"></div>
<!-- 登录控件 -->
<div id="login">
    <input id="tab-1" type="radio" name="tab" class="sign-in hidden" checked/>
    <input id="tab-2" type="radio" name="tab" class="sign-up hidden"/>
    <input id="tab-3" type="radio" name="tab" class="sign-out hidden"/>
    <div class="wrapper">
        <!-- 登录页面 -->
        <div class="login sign-in-htm">
            <form class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="login-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="login-username"
                                       autocomplete="off" placeholder="请输入用户名" tabindex="1" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="login-password"
                                       placeholder="请输入密码" tabindex="2" maxlength="15"/>
								<label class="input__label input__label--hideo" for="login-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo input--verify_code">
								<input class="input__field input__field--hideo" type="text" id="login-verify-code"
                                       autocomplete="off" placeholder="请输入验证码" tabindex="3" maxlength="4"/>
								<label class="input__label input__label--hideo" for="login-verify-code">
									<i class="fa fa-fw fa-bell-o icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>								
							</span>
                        <canvas class="verify-code-canvas" id="login-verify-code-canvas"></canvas>
                    </section>
                </div>
                <div class="form-actions">
                    <a tabindex="4" class="btn pull-left btn-link text-muted" onclick="goto_forget()">忘记密码?</a>
                    <input class="btn btn-primary" type="button" tabindex="3" onclick="login()" value="登录"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- 忘记密码页面 -->
        <div class="login sign-out-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="forget-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-username"
                                       autocomplete="off" placeholder="请输入用户名"/>
								<label class="input__label input__label--hideo" for="forget-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="forget-code"
                                       autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="forget-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="forget-password"
                                       placeholder="请重置密码"/>
								<label class="input__label input__label--hideo" for="forget-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onclick="goto_login()">返回登录</a>
                    <input class="btn btn-primary" type="button" onclick="forget()" value="重置密码"
                           style="color:white;"/>
                </div>
            </form>
        </div>
        <!-- 注册页面 -->
        <div class="login sign-up-htm">
            <form action="#" method="post" class="container offset1 loginform">
                <!-- 猫头鹰控件 -->
                <div id="owl-login" class="register-owl">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad input-container">
                    <section class="content">
							<span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-username"
                                       autocomplete="off" placeholder="请输入用户名" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-username">
									<i class="fa fa-fw fa-user icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-password"
                                       placeholder="请输入密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-password">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="password" id="register-repassword"
                                       placeholder="请确认密码" maxlength="15"/>
								<label class="input__label input__label--hideo" for="register-repassword">
									<i class="fa fa-fw fa-lock icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                        <span class="input input--hideo">
								<input class="input__field input__field--hideo" type="text" id="register-code"
                                       autocomplete="off" placeholder="请输入注册码"/>
								<label class="input__label input__label--hideo" for="register-code">
									<i class="fa fa-fw fa-wifi icon icon--hideo"></i>
									<span class="input__label-content input__label-content--hideo"></span>
								</label>
							</span>
                    </section>
                </div>
                <div class="form-actions">
                    <a class="btn pull-left btn-link text-muted" onclick="goto_login()">返回登录</a>
                    <input class="btn btn-primary" type="button" onclick="register()" value="注册"
                           style="color:white;"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>