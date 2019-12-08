<div id="temp">
    <#if resultList ? exists>

        <div class="mod_playlist mod_playlist--all">
            <ul class="playlist__list" id="playlist_box">

                <#list resultList.content as result>
                    <li class="playlist__item" data-disstid="7280654115"
                        onmouseover="this.className=(this.className+' playlist__item--hover')"
                        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover" style="visibility: visible;"><a
                                        onclick="playAllSheet(${result.id})" class="js_playlist"
                                        title="快乐驿站：纾解忧郁苦闷的心情" data-disstid="7280654115"
                                        data-stat="y_new.playlist.pic_click"><img
                                            src="/upload/${result.sheetImg}"
                                            class="playlist__pic"
                                            style="display: block; visibility: visible;"><i
                                            class="mod_cover__icon_play js_play"
                                            data-stat="y_new.playlist.pic_play"></i></a></div>
                            <h4 class="playlist__title"><span class="playlist__title_txt"><a
                                            href="/guest/sheetDetail?sheetId=${result.id}"
                                            class="js_playlist"
                                            data-stat="y_new.playlist.dissname" data-disstid="7280654115"
                                           >${result.sheetName}</a></span></h4>
                            <div class="playlist__author">

                                <a href="" class="js_user" data-uin="NKcl7wSP7Kvq"
                                   >${result.getUser().nicheng}</a>

                            </div>
                            <div class="playlist__other">
                                <#if (result.support>=10000)>
                                    播放量： ${(result.support/10000) ? int}万
                                    <#else >
                                        播放量： ${result.support}万
                                </#if>

                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
        <div class="mod_page_nav js_pager_comment">
            <#if (resultList.totalPages==1)>
                <strong class="current">1</strong>
            <#elseif (resultList.totalPages>1)&&(resultList.totalPages<=4)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toSheetPage(${resultList.getNumber()},${info})"><span>&lt;</span></a>
                </#if>
                <#list 1..resultList.totalPages as curindex>
                    <#if (resultList.getNumber()+1)==curindex>
                        <strong class="current">${curindex}</strong>
                    <#else >
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toSheetPage(${curindex},${info})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toSheetPage(${resultList.getNumber()+2},${info})"><span>&gt;</span></a>
                </#if>
            <#elseif (resultList.totalPages>=5)&&(resultList.totalPages<9)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toSheetPage(${resultList.getNumber()},${info})"><span>&lt;</span></a>
                </#if>
                <#if (resultList.getNumber()>3)>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toSheetPage(1,${info})">1</a>
                    <strong class="more">...</strong>
                    <#list 3..resultList.totalPages as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toSheetPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                <#else>
                    <#list 1..7 as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toSheetPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toSheetPage(9,${info})">9</a>
                </#if>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toSheetPage(${resultList.getNumber()+2},${info})"><span>&gt;</span></a>
                </#if>
            <#elseif (resultList.totalPages>=9)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toSheetPage(${resultList.getNumber()},${info})"><span>&lt;</span></a>
                </#if>
                <#if ((resultList.getNumber()+1)<=4)>
                    <#list 1..7 as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toSheetPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toSheetPage(${resultList.totalPages},${info})">${resultList.totalPages}</a>
                <#elseif ((resultList.totalPages-resultList.getNumber()-1)>=4)>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toSheetPage(1,${info})">1</a>
                    <strong class="more">...</strong>
                    <#list (resultList.totalPages-5)..resultList.totalPages as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toSheetPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                <#else>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toSheetPage(1,${info})">1</a>
                    <strong class="more">...</strong>
                    <#list (resultList.getNumber()+1-2)..(resultList.getNumber()+1+2) as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toSheetPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toSheetPage(${resultList.totalPages},${info})">${resultList.totalPages}</a>
                </#if>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toSheetPage(${resultList.getNumber()+2},${info})"><span>&gt;</span></a>
                </#if>
            </#if>
        </div>





    <#else >
        <div class="none_txt">
            <i class="none_txt__symbol"></i>
            <p>什么都没有</p>
        </div>
    </#if>
</div>
<script type="text/javascript">
    function toSheetPage(pageId, key) {
        $.ajax({
            url: '/guest/sheetsearch',
            type: 'GET',
            data: {
                'info': key,
                'pageId': pageId,
            },
            success: function (data) {
                $("#result").empty();
                $("#result").append(data);
            }
        });
    }
</script>