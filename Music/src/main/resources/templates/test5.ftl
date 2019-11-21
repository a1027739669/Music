
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   <link rel="stylesheet" href="qqmusiccss/css/base.css" />
    <link rel="stylesheet" href="qqmusiccss/css/header.css" />
    <link rel="stylesheet" href="qqmusiccss/css/content.css" />
    <link rel="stylesheet" href="qqmusiccss/css/footer.css" />
    <link rel="stylesheet" href="qqmusiccss/css/reset.css" />
    <link type="text/css" rel="stylesheet" href="kuwocss/style4.css">
    <link type="text/css" rel="stylesheet" href="kuwocss/styles.css">
    <script src="js/jquery.min.js"></script>
    <!-- import JavaScript -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>
<style>
    *{
        padding: 0;
        margin:0;
    }

    body{
        margin:50px;
    }

    li{
        list-style-type: none;
    }

    .siderImg{
        width:800px;
        height: 200px;
        border: 5px solid #abcdef;
        position: relative;
        overflow: hidden;  /*内容隐藏溢出,超出部分自动隐藏*/
    }


    .siderImg ul{
        overflow: hidden;  /*清除ul浮动*/
        width: 1600px;
        height:200px;
        left: 0px;  /*相对于起点*/
        position:absolute;
        _height:1px;  /*IE兼容清除浮动*/
    }

    .siderImg ul li{
        float:left;
        cursor: pointer;   /*设置鼠标样式为手状*/
    }
</style>
<body>
<div class="pic">
    <ul class="carousel clear">
        <li><a href="#"><img src="songImg/10.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/1.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/2.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/3.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/4.jpg" width="100%" alt=""></a></li>

        <li><a href="#"><img src="songImg/10.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/1.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/2.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/3.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/4.jpg" width="100%" alt=""></a></li>

        <li><a href="#"><img src="songImg/10.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/1.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/2.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/3.jpg" width="100%" alt=""></a></li>
        <li><a href="#"><img src="songImg/4.jpg" width="100%" alt=""></a></li>
    </ul>
    <div class="leftArrow"></div>
    <div class="rightArrow"></div>
</div>

</body>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    $(function () {
        var carousel = $('.carousel')
            ,clickable = true
            ,timer

        // 自动轮播函数
        function autoRun() {
            timer = setInterval(function () {
                if( parseInt(carousel.css('left')) <= -1860 ){
                    carousel.css('left', '-930px')
                }
                animate(-1)
            }, 3000)
        }
        // 刚打开页面时执行
        autoRun()

        $('.leftArrow').click(function () {
            // 防止用户疯狂点击翻页
            if(clickable){
                clickable = false
                // 当展示的5张图片为最左边的五张图片同时还要向左翻页时，重置位置
                if( parseInt(carousel.css('left')) <= -1860 ){
                    carousel.css('left', '-930px')
                }
                animate(-1)
            }
        });

        $('.rightArrow').click(function () {
            // 防止用户疯狂点击翻页
            if(clickable){
                clickable = false
                // 当展示的是最右边5张图片还要向右 翻页时，重置位置
                if( parseInt(carousel.css('left')) >= 0 ){
                    carousel.css('left', '-930px')
                }
                animate(1)
            }
        });

        // 切换页面函数
        function animate(direction) { // 这里传入的参数表示翻页的方向
            // 这里的 186px 是一张图片的宽度，因为用户手动点击翻页是随时发生的
            // 因此必须在手动翻页时进行位置的调整
            var adjustment = parseInt(carousel.css('left')) % 186

            if( direction === -1 ){ // 向左翻页
                carousel.stop().animate({left: '+='+ direction*(186 + adjustment) +'px'}, 1500)
            } else{ // 向右翻页
                carousel.stop().animate({left: '+='+ direction*(186 - adjustment) +'px'}, 1500)
            }

            // 翻页的动画用时 1.5s， 为了保证‘安全’我将再次点击许可设置在了 2s 后
            // 虽然你可能会认为这个有点太简单暴力了。。我想这个地方用 Promise 来实现可能会优雅一点
            setTimeout(function () {
                clickable = true
            }, 2000)
        }

        // 鼠标移入时清除自动轮播的定时器
        $('.pic').mouseenter(function () {
            clearInterval(timer)
            timer = null
        })
        // 鼠标移出时开始自动轮播的定时器
        $('.pic').mouseleave(function () {
            autoRun()
        })
    })

</script>
</html>

