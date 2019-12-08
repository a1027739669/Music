<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="favicon.ico">
    <link rel="Shortcut Icon" href="favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/lib/html5.js"></script>
    <script type="text/javascript" src="/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <title>添加用户 - H-ui.admin v3.0</title>
    <meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="cl pd-20">
    <form class="form form-horizontal" id="form-member-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>歌曲名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="songname" name="songname">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>歌手名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="singername" id="singername">
					<option value="" selected>请选择歌手</option>
                    <#list singerList as singer>
                        <option value="${singer.getId()}">${singer.singerName}</option>
                    </#list>
				</select>
				</span></div>
        </div>

<#--        <div class="row cl">-->
<#--            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>时长：</label>-->
<#--            <div class="formControls col-xs-8 col-sm-9">-->
<#--                <input type="text" class="input-text" value="" placeholder="" id="songtime" name="songtime">-->
<#--            </div>-->
<#--        </div>-->

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>语言：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="languages" id="languages">
					<option value="" selected>请选择语言</option>

                        <option value="国语">国语</option>
                   <option value="粤语">粤语</option>
                     <option value="韩语">韩语</option>
                     <option value="日语">日语</option>
                     <option value="英语">英语</option>
                     <option value="其他">其他</option>
				</select>
				</span></div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red" id="birthday">*</span>发行时间：</label>
            <div class="formControls col-xs-8 col-sm-4">
                <input type="text"
                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
                       id="release" name="release" class="input-text Wdate">
            </div>
        </div>
        <div class="row cl" style="visibility: hidden">
            <label class="form-label col-xs-5 col-sm-3">评论结束日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'datemin\')}'})"
                       id="datemax" class="input-text Wdate">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="songimg" id="songimg" readonly
                       nullmsg="请添加图片！" style="width:200px">
				<a class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择图片</a>
				<input type="file" name="file-2" class="input-file" id="imagefile">
				</span></div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">歌词文件：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="lyricfile" id="lyricfile" readonly
                       nullmsg="请添加文件！" style="width:200px">
				<a class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择文件</a>
				<input type="file" name="file-2" class="input-file" id="file2">
				</span></div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>歌曲文件：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="songfile" id="songfile" readonly
                       nullmsg="请添加文件！" style="width:200px">
				<a class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 选择文件</a>
				<input type="file" name="file-2" class="input-file" id="file3">
				</span></div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>歌手名称：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="albumname" id="albumname">
					<option value="" selected>请选择专辑</option>
                    <#list albumlist as album>
                        <option value="${album.getAlbumId()}">${album.getAlbumName()}</option>
                    </#list>
				</select>
				</span></div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">标签：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <dl class="permission-list">
                    <dt>
                        <label>
                            <input type="checkbox" value="" name="user-Character-0" id="user-Character-1">
                            全选</label>
                    </dt>
                    <dd>
                        <dl class="cl permission-list2" id="permission-list2">
                            <#list labelList as label>
                                <dt>
                                    <label class="">
                                        <input type="checkbox" value="${label.label_name}" name="user-Character-1-0"
                                               id="${label.id}">
                                        ${label.label_name}</label>
                                </dt>
                            </#list>
                        </dl>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="/lib/ueditor/1.4.3/ueditor.all.min.js"></script>
<script type="text/javascript" src="/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-member-add").validate({
            debug: false,
            rules: {
                songname: {
                    required: true,
                },
                singername: {
                    required: true,
                },
                // songtime: {
                //     required: true,
                // },
                languages: {
                    required: true,
                },
                release: {
                    required: true,
                },
                songimg: {
                    required: true,
                },

                songfile: {
                    required: true,
                },

                albumname: {
                    required: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                ajaxsubmit();
            }
        });
    });

    function ajaxsubmit() {
        var myform = new FormData();
        var songname = $("#songname").val();
        var singerId = $("#singername").find("option:selected").val();
        // var songtime=$("#songtime").val();
        var languages=$("#languages").find("option:selected").text();
        var release = $("#release").val();
        var albumId=$("#albumname").find("option:selected").val();
        var labels = [];
        var allChooseradio = document.getElementsByName("user-Character-1-0");
        for (k in allChooseradio) {
            if (allChooseradio[k].checked === true) {
                res = allChooseradio[k].value;
                labels.push(res);
            }
        }

        myform.append('file1', $("#imagefile")[0].files[0]);
        myform.append('file2', $("#file2")[0].files[0]);
        myform.append('file3', $("#file3")[0].files[0]);
        myform.append('songname', songname);
        myform.append('singerId',singerId);
        // myform.append('songtime', songtime);

        myform.append('languages', languages);
        myform.append('release', release);
        myform.append('albumId',albumId);
        myform.append('labels', labels);
        $.ajax({
            url: "/back/toaddsong",
            type: "POST",
            data: myform,
            async: false,
            contentType: false,
            processData: false,
            success: function (result) {
                if (result === '添加成功')
                    layer.msg(result, {icon: 6, time: 1000});
                else
                    layer.msg(result, {icon: 5, time: 1000});
            },
            error: function (data) {
                alert("失败");
            }
        });
    }
</script>
<script type="text/javascript">
    $(function () {
        $(".permission-list dt input:checkbox").click(function () {
            $(this).closest("dl").find("dd input:checkbox").prop("checked", $(this).prop("checked"));
        });
        $(".permission-list2 dd input:checkbox").click(function () {
            var l = $(this).parent().parent().find("input:checked").length;
            var l2 = $(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
            if ($(this).prop("checked")) {
                $(this).closest("dl").find("dt input:checkbox").prop("checked", true);
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", true);
            } else {
                if (l == 0) {
                    $(this).closest("dl").find("dt input:checkbox").prop("checked", false);
                }
                if (l2 == 0) {
                    $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", false);
                }
            }
        });

        $("#form-admin-role-add").validate({
            rules: {
                roleName: {
                    required: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>