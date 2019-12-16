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
    <link rel="Bookmark" href="/static/favicon.ico">
    <link rel="Shortcut Icon" href="/static/favicon.ico"/>
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

    <title>会员列表 - 会员管理 -=-=</title>
    <meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
    <meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<!--_header 作为公共模版分离出去-->
<#include "publichead.ftl">
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span
                class="c-gray en">&gt;</span> 会员列表<a class="btn btn-success radius r"
                                                     style="line-height:1.6em;margin-top:3px"
                                                     href="javascript:location.replace(location.href);" title="刷新"><i
                    class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="text-c"> 日期范围：
                <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin"
                       class="input-text Wdate" style="width:120px;">
                -
                <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
                       id="datemax" class="input-text Wdate" style="width:120px;">
                <input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
                <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i>
                    搜用户
                </button>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"></span> <span
                        class="r">注册用户总数：<strong>${userList? size}</strong> </span></div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-hover table-bg table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="80">ID</th>
                        <th width="100">用户名</th>
                        <th width="40">性别</th>
                        <th width="90">手机</th>
                        <th width="150">邮箱</th>
                        <th width="130">加入时间</th>
                        <th width="70">状态</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list userList as user>
                        <tr class="text-c">
                            <td><input type="checkbox" value="${user.id}" name="hello"></td>
                            <td>${user.id}</td>
                            <td><u style="cursor:pointer" class="text-primary"
                                   onclick="member_show('张三','member-show.html','10001','360','400')">张三</u></td>
                            <td>${user.userSex}</td>
                            <td>${user.mobile}</td>
                            <td>${user.email ? default('暂无')}</td>
                            <td>${user.create_date}</td>
                            <#if user.isAlive==1>
                                <td class="td-status"><span class="label label-success radius">正常</span></td>
                            <#else >
                                <td class="td-status"><span class="label label-defaunt radius">封禁</span></td>
                            </#if>
                            <td class="td-manage"><a style="text-decoration:none" onClick="member_stop(this,${user.id})"
                                                     href="javascript:;" title="封禁"><i class="Hui-iconfont">&#xe631;</i></a>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function () {
        $('.table-sort').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 7, 8]}// 制定列不参与排序
            ]
        });
        $('.table-sort tbody').on('click', 'tr', function () {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
            } else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        });
    });

    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-查看*/
    function member_show(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要封禁吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">封禁</span>');
            $(obj).remove();
            $.ajax({//利用ajax发出请求
                type:"GET",//post类型
                url:"/back/prohibition?userId="+id, //向Controller里的deleteSelect传输ids
                success:function(data){//删除成功后，deleteMany会返回一个"ok";
                    if(data=="ok"){
                        layer.msg('已封禁!', {icon: 5, time: 1000});
                    }

                }
            });
        });
    }

    /*用户-启用*/
    function member_start(obj, id) {
        layer.confirm('确认要解封吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,'+id+')" href="javascript:;" title="封禁"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">正常</span>');
            $(obj).remove();
            $.ajax({//利用ajax发出请求
                type:"GET",//get类型
                url:"/back/unsealing?userId="+id, //向Controller里的deleteSelect传输ids
                success:function(data){//删除成功后，deleteMany会返回一个"ok";
                    if(data=="ok"){
                        layer.msg('已解封!', {icon: 6, time: 1000});
                    }

                }
            });
        });
    }

    /*用户-编辑*/
    function member_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*密码-修改*/
    function change_password(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>