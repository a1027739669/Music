<div id="sheetTable">
    <#if sheetsPage? exists>
        <ul class="playlist__list" id="playlist_box" id="list">

            <#list sheetsPage.content as sheet>
                <li class="playlist__item"
                    onmouseover="this.className=(this.className+' playlist__item--hover')"
                    onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                    <div class="playlist__item_box">
                        <div class="playlist__cover mod_cover" style="visibility: visible;"><a
                                    title="油管旅拍Vlog | 备好行囊，上路！" class="js_playlist"
                                    onclick="playAllSheet(${sheet.id})"><img
                                        class="playlist__pic" style="display: block; visibility: visible;"
                                        alt="油管旅拍Vlog | 备好行囊，上路！"
                                        src="/upload/${sheet.sheetImg}"><i
                                        class="mod_cover__icon_play js_play"
                                        data-stat="y_new.playlist.pic_play"></i></a></div>
                        <h4 class="playlist__title"><span class="playlist__title_txt"><a title="油管旅拍Vlog | 备好行囊，上路！"
                                                                                         class="js_playlist"
                                                                                         href="/guest/sheetDetail?sheetId=${sheet.id}"
                                                                                         data-stat="y_new.playlist.dissname"
                                                                                         data-disstid="7088239319">${sheet.sheetName}</a></span>
                        </h4>
                        <div class="playlist__author">

                            <a title="急速电子girl" class="js_user" onclick="setStatCookie&amp;&amp;setStatCookie();"
                               href="//y.qq.com/portal/profile.html?uin=owEs7eEk7wEiNn**#stat=y_new.playlist.creater"
                               data-stat="y_new.playlist.creater" data-uin="owEs7eEk7wEiNn**">${sheet.createId}</a>

                        </div>
                        <div class="playlist__other">
                            播放量：
                            <#if (sheet.support>=10000)>
                                ${sheet.playCount}万
                            <#else >
                                ${sheet.playCount}
                            </#if>

                        </div>
                    </div>
                </li>
            </#list>
        </ul>
    <#else >
        <div class="none_txt">
            <i class="none_txt__symbol"></i>
            <p>什么都没有</p>
        </div>
    </#if>
    <#if sheetsPage? exists>
    <div class="mod_page_nav js_pager_comment">
        <#if (sheetsPage.totalPages==1)>
            <strong class="current">1</strong>
        <#elseif (sheetsPage.totalPages>1)&&(sheetsPage.totalPages<=4)>
            <#if ((sheetsPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus=""
                   onclick="toList(${sheetsPage.getNumber()},${currentRankId},'${currentLabel?js_string}')"><span>&lt;</span></a>
            </#if>
            <#list 1..sheetsPage.totalPages as curindex>
                <#if (sheetsPage.getNumber()+1)==curindex>
                    <strong class="current">${curindex}</strong>
                <#else >
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toList(${curindex},${currentRankId},'${currentLabel?js_string}')">${curindex}</a>
                </#if>
            <#else>
                <strong class="current">${curindex}</strong>
            </#list>
            <#if ((sheetsPage.getNumber()+1)!=sheetsPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus=""
                   onclick="toList(${sheetsPage.getNumber()+2},${currentRankId},'${currentLabel?js_string}')"><span>&gt;</span></a>
            </#if>
        <#elseif (sheetsPage.totalPages>=5)&&(sheetsPage.totalPages<9)>
            <#if ((sheetsPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus=""
                   onclick="toList(${sheetsPage.getNumber()},${currentRankId},'${currentLabel?js_string}')"><span>&lt;</span></a>
            </#if>
            <#if (sheetsPage.getNumber()>3)>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toList(1,${currentRankId},'${currentLabel?js_string}')">1</a>
                <strong class="more">...</strong>
                <#list 3..sheetsPage.totalPages as curindex>
                    <#if (sheetsPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toList(${curindex},${currentRankId},'${currentLabel?js_string}')">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <#list 1..7 as curindex>
                    <#if (sheetsPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toList(${curindex},${currentRankId},'${currentLabel?js_string}')">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toList(9,${currentRankId},'${currentLabel?js_string}')">9</a>
            </#if>
            <#if ((sheetsPage.getNumber()+1)!=sheetsPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus=""
                   onclick="toList(${sheetsPage.getNumber()+2},${currentRankId},'${currentLabel?js_string}')"><span>&gt;</span></a>
            </#if>
        <#elseif (sheetsPage.totalPages>=9)>
            <#if ((sheetsPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus=""
                   onclick="toList(${sheetsPage.getNumber()},${currentRankId},'${currentLabel?js_string}')"><span>&lt;</span></a>
            </#if>
            <#if ((sheetsPage.getNumber()+1)<=4)>
                <#list 1..7 as curindex>
                    <#if (sheetsPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toList(${curindex},${currentRankId},'${currentLabel?js_string}')">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toList(${sheetsPage.totalPages},${currentRankId},'${currentLabel?js_string}')">${sheetsPage.totalPages}</a>
            <#elseif ((sheetsPage.totalPages-sheetsPage.getNumber()-1)>=4)>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toList(1,${currentRankId},'${currentLabel?js_string}')">1</a>
                <strong class="more">...</strong>
                <#list (sheetsPage.totalPages-5)..sheetsPage.totalPages as curindex>
                    <#if (sheetsPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toList(${curindex},${currentRankId},'${currentLabel?js_string}')">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toList(1,${currentRankId},'${currentLabel?js_string}')">1</a>
                <strong class="more">...</strong>
                <#list (sheetsPage.getNumber()+1-2)..(sheetsPage.getNumber()+1+2) as curindex>
                    <#if (sheetsPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toList(${curindex},${currentRankId},'${currentLabel?js_string}')">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toList(${sheetsPage.totalPages},${currentRankId},'${currentLabel?js_string}')">${sheetsPage.totalPages}</a>
            </#if>
            <#if ((sheetsPage.getNumber()+1)!=sheetsPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus=""
                   onclick="toList(${sheetsPage.getNumber()+2},${currentRankId},'${currentLabel?js_string}')"><span>&gt;</span></a>
            </#if>
        </#if>
    </div>
    </#if>
</div>

<script type="text/javascript">
    function toList(page, rankmethod, label) {
        $.ajax({
            url: '/guest/sheettable',
            type: 'GET',
            data: {
                'rankMethod': rankmethod,
                'pageId': page,
                'label': label,
            },
            success: function (data) {
                $("#sheetTable").empty();
                $("#sheetTable").append(data);
            }
        });
    }

    function playAllSheet(sheetId) {
        window.open("/guest/playSheet?sheetId=" + sheetId);
    }
</script>