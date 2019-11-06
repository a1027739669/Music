<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="image/x-icon" rel="shortcut icon" href="favicon.ico">
    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="css/ranking.css">
    <link type="text/css" rel="stylesheet" href="playresource/css/home.css">
    <script  src="js/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="playresource/css/home.css">
</head>
<body>
<div class="header">
    <a href="/" class="logo" title="首页"><img alt="我的音乐" src="image/logo.png"></a>
    <div class="search-box">
        <form id="searchForm" action="{% url 'search' 1 %}" method="post" target="_blank">

            <div class="search-keyword">
                <input name="kword" type="text" class="keyword" maxlength="120"  placeholder="音乐节"  />
            </div>
            <input id="subSerch" type="submit" class="search-button" value="搜 索" />
        </form>
        <div id="suggest" class="search-suggest"></div>
    </div>
</div><!--end header-->
<div class="nav-box">
    <div class="nav-box-inner">
        <ul class="nav clearfix">
            <li><a href="/">首页</a></li>
            <li><a href="{% url 'ranking' %}">歌曲排行</a></li>
            <li><a href="{% url 'home' 1 %}" target="_blank">用户中心</a></li>
        </ul>
    </div>
</div><!--end nav-box-->
<div class="wrapper clearfix">
    <!-- 左侧列表 -->
    <div class="side">
        <!-- 子类分类排行导航 -->
        <div class="side-nav">
            <div class="nav-head">
                <a href="">所有歌曲分类</a>
            </div>
            <ul id="sideNav" class="cate-item">
                <#list labelList as labelsingle>
                <li class="computer">
                    <div class="main-cate">
                        <a href="" class="main-title">${labelsingle.label_name}</a>
                    </div>
                </li>
               </#list>
            </ul>
        </div>
    </div><!-- 左侧列表 end -->

    <div class="main">
        <div class="main-head-box clearfix">
            <div class="main-head"><h1>歌曲排行榜</h1></div>
        </div>
        <div  id="listrank">

        </div>
    </div>
</div>
<script type="text/javascript">
    var labelId=0;
    $(function () {
        toPage(1,labelId);
    });
    function toPage(num,labelId) {
        $.ajax({
            url: '/songTable',
            type: 'GET',
            data: {
                'labelId':labelId,
                'pageId': num,
            },
            success: function (data) {
                $("#listrank").empty();
                $("#listrank").append(data);
            }
        });
    }
</script>
<script data-main="js/ranking.js"  src="js/require.js"></script>
</body>
</html>


</html>