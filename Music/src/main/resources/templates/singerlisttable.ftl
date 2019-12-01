<div id="temp">
<div class="mod_singer_tag" id="tag_box">

    <div class="singer_tag__list js_area">
        <#if currentCoun=="全部">
            <a onclick="toList(1,'全部','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">全部</a>
        <#else >
            <a onclick="toList(1,'全部','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">全部</a>
        </#if>
        <#if currentCoun=="内地">
            <a onclick="toList(1,'内地','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">内地</a>
        <#else >
            <a onclick="toList(1,'内地','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">内地</a>
        </#if>

        <#if currentCoun=="港台">
            <a onclick="toList(1,'港台','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">港台</a>
        <#else >
            <a onclick="toList(1,'港台','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">港台</a>
        </#if>
        <#if currentCoun=="欧美">
            <a onclick="toList(1,'欧美','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">欧美</a>
        <#else >
            <a onclick="toList(1,'欧美','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">欧美</a>
        </#if>
        <#if (currentCoun=="日本")>
            <a onclick="toList(1,'日本','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">日本</a>
        <#else >
            <a onclick="toList(1,'日本','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">日本</a>
        </#if>
        <#if (currentCoun=="韩国")>
            <a onclick="toList(1,'韩国','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">韩国</a>
        <#else >
            <a onclick="toList(1,'韩国','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">韩国</a>
        </#if>

        <#if (currentCoun=="其他")>
            <a onclick="toList(1,'其他','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">其他</a>
        <#else >
            <a onclick="toList(1,'其他','${currentSex?js_string}','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">其他</a>
        </#if>


    </div>

    <div class="singer_tag__list js_sex">

        <#if (currentSex=="全部")>
            <a onclick="toList(1,'${currentCoun?js_string}','全部','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">全部</a>
        <#else >
            <a onclick="toList(1,'${currentCoun?js_string}','全部','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">全部</a>
        </#if>

        <#if (currentSex=="男")>
            <a onclick="toList(1,'${currentCoun?js_string}','男','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">男</a>
        <#else >
            <a onclick="toList(1,'${currentCoun?js_string}','男','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">男</a>
        </#if>
        <#if (currentSex=="女")>
            <a onclick="toList(1,'${currentCoun?js_string}','女','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">女</a>
        <#else >
            <a onclick="toList(1,'${currentCoun?js_string}','女','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">女</a>
        </#if>

        <#if (currentSex=="组合")>
            <a onclick="toList(1,'${currentCoun?js_string}','组合','${currentLabel?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">组合</a>
        <#else >
            <a onclick="toList(1,'${currentCoun?js_string}','组合','${currentLabel?js_string}')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">组合</a>
        </#if>

    </div>

    <div class="singer_tag__list js_genre">

        <#if (currentLabel=="全部")>
            <a onclick="toList(1,'${currentCoun?js_string}','${currentSex?js_string}','全部')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
               data-key="area" data-id="-100" hidefocus="">全部</a>
        <#else >
            <a onclick="toList(1,'${currentCoun?js_string}','${currentSex?js_string}','全部')" class="singer_tag__item"
               data-key="area" data-id="-100" hidefocus="">全部</a>
        </#if>
        <#list labelList as label>
            <#if currentLabel==label.label_name>
                <a onclick="toList(1,'${currentCoun?js_string}','${currentSex?js_string}','${label.label_name?js_string}')" class="singer_tag__item singer_tag__item--all singer_tag__item--select"
                   data-key="area" data-id="-100" hidefocus="">${label.label_name}</a>
            <#else >
                <a onclick="toList(1,'${currentCoun?js_string}','${currentSex?js_string}','${label.label_name?js_string}')" class="singer_tag__item"
                   data-key="area" data-id="-100" hidefocus="">${label.label_name}</a>
            </#if>
        </#list>
    </div>

</div>
<div id="mod-singerlist" id="singerlist">

    <div class="mod_singer_list">
        <ul class="singer_list__list js_avtar_list">
            <#list singerPage.content as singer>
                <#if (singer_index<=9)>
                    <li class="singer_list__item">
                        <div class="singer_list__item_box">
                            <a href="/guest/singerDetail?singerId=${singer.id}"
                               onclick="" class="singer_list__cover js_singer"
                               hidefocus="true" data-stat="y_new.singerlist.singerpic"
                               data-singerid="4558" title="周杰伦">
                                <#if singer.singerImg? exists>
                                <img class="singer_list__pic"
                                     src="/upload/${singer.singerImg}"
                                     alt="周杰伦">
                                </#if>
                            </a>
                            <h3 class="singer_list__title"><a
                                        href="/guest/singerDetail?singerId=${singer.id}"
                                        onclick=""
                                        data-id="4558" class="js_singer" data-stat="y_new.singerlist.singername"
                                        title="周杰伦">${singer.singerName}</a></h3>
                        </div>
                    </li>
                </#if>
            </#list>
        </ul>
    </div>


    <ul class="singer_list_txt">
        <#list singerPage.content as singer>
            <#if (singer_index>=10)>
                <li class="singer_list_txt__item"><a
                            href="/guest/singerDetail?singerId=${singer.id}"
                            onclick="" class="singer_list_txt__link js_singer"
                            data-stat="y_new.singerlist.singername" data-singermid="003Nz2So3XXYek" data-singerid="143"
                            title="陈奕迅">${singer.singerName}</a></li>
            </#if>
        </#list>


    </ul>


    <div class="mod_page_nav js_pager_comment">
        <#if (singerPage.totalPages==1)>
            <strong class="current">1</strong>
        <#elseif (singerPage.totalPages>1)&&(singerPage.totalPages<=4)>
            <#if ((singerPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${singerPage.getNumber()},${currentCate})"><span>&lt;</span></a>
            </#if>
            <#list 1..singerPage.totalPages as curindex>
                <#if (singerPage.getNumber()+1)==curindex>
                    <strong class="current">${curindex}</strong>
                <#else >
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                </#if>
            <#else>
                <strong class="current">${curindex}</strong>
            </#list>
            <#if ((singerPage.getNumber()+1)!=singerPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${singerPage.getNumber()+2},${currentCate})"><span>&gt;</span></a>
            </#if>
        <#elseif (singerPage.totalPages>=5)&&(singerPage.totalPages<9)>
            <#if ((singerPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${singerPage.getNumber()},${currentCate})"><span>&lt;</span></a>
            </#if>
            <#if (singerPage.getNumber()>3)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${currentCate})">1</a>
                <strong class="more">...</strong>
                <#list 3..singerPage.totalPages as curindex>
                    <#if (singerPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <#list 1..7 as curindex>
                    <#if (singerPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,${currentCate})">9</a>
            </#if>
            <#if ((singerPage.getNumber()+1)!=singerPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${singerPage.getNumber()+2},${currentCate})"><span>&gt;</span></a>
            </#if>
        <#elseif (singerPage.totalPages>=9)>
            <#if ((singerPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${singerPage.getNumber()},${currentCate})"><span>&lt;</span></a>
            </#if>
            <#if ((singerPage.getNumber()+1)<=4)>
                <#list 1..7 as curindex>
                    <#if (singerPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${singerPage.totalPages},${currentCate})">${singerPage.totalPages}</a>
            <#elseif ((singerPage.totalPages-singerPage.getNumber()-1)>=4)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${currentCate})">1</a>
                <strong class="more">...</strong>
                <#list (singerPage.totalPages-5)..singerPage.totalPages as curindex>
                    <#if (singerPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${currentCate})">1</a>
                <strong class="more">...</strong>
                <#list (singerPage.getNumber()+1-2)..(singerPage.getNumber()+1+2) as curindex>
                    <#if (singerPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${singerPage.totalPages},${currentCate})">${singerPage.totalPages}</a>
            </#if>
            <#if ((singerPage.getNumber()+1)!=singerPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${singerPage.getNumber()+2},${currentCate})"><span>&gt;</span></a>
            </#if>
        </#if>
    </div>

</div>
</div>
<script type="text/javascript">
    function toList(page,coun,sex,label) {
        $.ajax({
            url: '/guest/singertable',
            type: 'GET',
            data: {
                'country':coun,
                'sex': sex,
                'label':label,
                'pageId':page,
            },
            success: function (data) {
                $("#temp").empty();
                $("#temp").append(data);
            }
        });
    }
</script>
