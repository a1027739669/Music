<#if resultList ? exists>
    <div id="temp">
        <div class="adaptive-list" style="opacity: 1;">
            <#list  resultList.content as result>
                <div class="artist-item unselectable" style="flex: 0 0 16.6667%; max-width: 16.6667%;"><a
                            href="/guest/singerDetail?singerId=${result.id}">
                        <div class="cover"
                             style="background-image: url('/upload/${result.singerImg}');"></div>
                    </a>
                    <div class="info">
                        <div class="name"><a href="/guest/singerDetail?singerId=${result.id}"><span>${result.singerName}</span></a>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
        <div class="mod_page_nav js_pager_comment">
            <#if (resultList.totalPages==1)>
                <strong class="current">1</strong>
            <#elseif (resultList.totalPages>1)&&(resultList.totalPages<=4)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()},${info})"><span>&lt;</span></a>
                </#if>
                <#list 1..resultList.totalPages as curindex>
                    <#if (resultList.getNumber()+1)==curindex>
                        <strong class="current">${curindex}</strong>
                    <#else >
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${info})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()+2},${info})"><span>&gt;</span></a>
                </#if>
            <#elseif (resultList.totalPages>=5)&&(resultList.totalPages<9)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()},${info})"><span>&lt;</span></a>
                </#if>
                <#if (resultList.getNumber()>3)>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${info})">1</a>
                    <strong class="more">...</strong>
                    <#list 3..resultList.totalPages as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                <#else>
                    <#list 1..7 as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,${info})">9</a>
                </#if>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()+2},${info})"><span>&gt;</span></a>
                </#if>
            <#elseif (resultList.totalPages>=9)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()},${info})"><span>&lt;</span></a>
                </#if>
                <#if ((resultList.getNumber()+1)<=4)>
                    <#list 1..7 as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toPage(${resultList.totalPages},${info})">${resultList.totalPages}</a>
                <#elseif ((resultList.totalPages-resultList.getNumber()-1)>=4)>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${info})">1</a>
                    <strong class="more">...</strong>
                    <#list (resultList.totalPages-5)..resultList.totalPages as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                <#else>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${info})">1</a>
                    <strong class="more">...</strong>
                    <#list (resultList.getNumber()+1-2)..(resultList.getNumber()+1+2) as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus=""
                               onclick="toPage(${curindex},${info})">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toPage(${resultList.totalPages},${info})">${resultList.totalPages}</a>
                </#if>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()+2},${info})"><span>&gt;</span></a>
                </#if>
            </#if>
        </div>
    </div>
<#else >
    <div class="none_txt">
        <i class="none_txt__symbol"></i>
        <p>什么都没有</p>
    </div>
</#if>
<script type="text/javascript">
    function toPage(pageId, key) {
        $.ajax({
            url: '/guest/singerresult',
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