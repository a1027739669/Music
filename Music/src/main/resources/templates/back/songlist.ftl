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

    <title>会员列表 - 会员管理 - H-ui.admin v3.0</title>
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
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 歌曲管理 <span
                class="c-gray en">&gt;</span> 歌曲列表<a class="btn btn-success radius r"
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

            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a  onclick="deleteAll()"
                                                                       class="btn btn-danger radius"><i
                                class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;"
                                                                              onclick="member_edit('编辑','/back/addsong','4','','510')"
                                                                              class="btn btn-primary radius"><i
                                class="Hui-iconfont">&#xe600;</i> 添加歌曲</a></span> <span
                        class="r">共有数据：<strong>${songList ? size}</strong>条</span></div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-hover table-bg table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="80">ID</th>
                        <th width="100">歌曲名称</th>
                        <th width="130">歌手名称</th>
                        <th width="100">时长</th>
                        <th width="40">语言</th>
                        <th width="100">发行时间</th>
                        <th width="130">图片</th>
                        <th width="80">歌词文件</th>
                        <th width="80">歌曲文件</th>
                        <th width="80">专辑名</th>
                        <th width="130">标签</th>
                        <th width="70">状态</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list songList as song>
                        <tr class="text-c">
                            <td><input type="checkbox" value="${song.songId}" name="hello"></td>
                            <td>${song.songId}</td>
                            <td><u style="cursor:pointer" class="text-primary"
                                   onclick="member_show('张三','member-show.html','10001','360','400')">${song.song_name}</u>
                            </td>
                            <td>${song.getSinger().singerName}</td>
                            <td>
                                ${song.song_time}
                            </td>
                            <td>${song.songLanguages}</td>
                            <td>${song.song_release}</td>
                            <td><img src="/upload/${song.song_img}" width="50px" height="50px"></td>
                            <td>${song.song_lyrics}</td>
                            <td>  <#if song.song_file?length gt 33>
                                    ${song.song_file?substring(0,30)}...
                                <#else>
                                    ${song.song_file!}
                                </#if>
                            </td>
                            <td>${song.getAlbum().albumName}</td>
                            <td>${song.songLabel}</td>
                            <#if song.isOnline==1>
                                <td class="td-status"><span class="label label-success radius">正常</span></td>
                            <#else >
                                <td class="td-status"><span class="label label-defaunt radius">下线</span></td>
                            </#if>
                            <td class="td-manage">
                                <a style="text-decoration:none" onClick="member_stop(this,${song.songId})"
                                   href="javascript:;" title="封禁"><i class="Hui-iconfont">&#xe631;</i></a>
                                <a title="编辑" href="javascript:;"
                                                     onclick="member_edit('编辑','/back/modifysong?songId=${song.songId}','4','','510')"
                                                     class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                                <a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5"
                                   style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
                {"orderable": false, "aTargets": [0, 3, 5, 7, 8]}// 制定列不参与排序
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
        layer.confirm('确认要下线吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe6e1;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">下线</span>');
            $(obj).remove();
            $.ajax({//利用ajax发出请求
                type:"GET",//post类型
                url:"/back/prohibition?userId="+id, //向Controller里的deleteSelect传输ids
                success:function(data){//删除成功后，deleteMany会返回一个"ok";
                    if(data=="ok"){
                        layer.msg('已下线!', {icon: 5, time: 1000});
                    }

                }
            });
        });
    }

    /*用户-启用*/
    function member_start(obj, id) {
        layer.confirm('确认要上线吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,'+id+')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">正常</span>');
            $(obj).remove();
            $.ajax({//利用ajax发出请求
                type:"GET",//get类型
                url:"/back/unsealing?userId="+id, //向Controller里的deleteSelect传输ids
                success:function(data){//删除成功后，deleteMany会返回一个"ok";
                    if(data=="ok"){
                        layer.msg('已上线!', {icon: 6, time: 1000});
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
            // // $(obj).parents("tr").remove();
            // $.ajax({
            //     type: "GET",
            //     dataType: "text",
            //     url: "/back/delete",
            //     async: false,
            //     success: function (result) {
            //         layer.msg(result, {icon: 5, time: 1000});
            //     },
            //     error: function () {
            //         alert("异常！");
            //     }
            // });
            layer.msg('权限不足!',{icon:5,time:3000});
        });
    }

    function deleteAll(){
        var Checkbox=false;//默认复选框为空
        $("input[name='hello']").each(function(){//获取复选框节点id
            if (this.checked==true) {
                Checkbox=true;    //已勾选
            }
        });
        if (Checkbox){//boolean值为true
            layer.confirm("是否确认删除?",function(index)
            {
                // obj = document.getElementsByName("hello");//将复选框定义成一个jquery对象
                // check_val = [];//定义一个数组
                // for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
                //     if(obj[k].checked)//选中的都放进 数组里
                //         check_val.push(obj[k].value.replace(',',''));
                // }
                //
                // $.ajax({//利用ajax发出请求
                //     type:"POST",//post类型
                //     url:"/back/deleteComment?ids="+check_val, //向Controller里的deleteSelect传输ids
                //     success:function(data){//删除成功后，deleteMany会返回一个"ok";
                //         if(data=="ok"){
                //             layer.msg('已删除!',{icon:1,time:3000});
                //             setTimeout('shuaxin()',3000);
                //         }
                //
                //     }
                // });
                layer.msg('权限不足!',{icon:5,time:3000});
            });

        }
        else{
            layer.alert("请选择您要删除的内容!");//不勾选不提交，弹出警告框。
            return false;
        }


    }
</script>



<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>