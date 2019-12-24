<#if resultList ? exists>
    <div id="temp">
        <div class="table idle song-table search-songs">
            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th class="th-index" style="width: 8%;">#</th>
                        <th class="th-songName" style="width: 23%;">歌曲</th>
                        <th class="th-artist" style="width: 23%;">歌手</th>
                        <th class="th-album" style="width: 23%;">专辑</th>
                        <th class="th-duration" style="width: 23%;">时长</th>
                    </tr>
                    <tr class="division">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <#list resultList.content as result>
                        <#if (result_index%2==0)>
                            <tr class="even">
                                <td>
                                    <div class="index-container"><span class="em index">${result_index+1}</span>
                                        <div class="audio-icon unselectable">
                                            <div class="column paused" style="animation-delay: -1.2s;"></div>
                                            <div class="column paused"></div>
                                            <div class="column paused" style="animation-delay: -1.5s;"></div>
                                            <div class="column paused" style="animation-delay: -0.9s;"></div>
                                            <div class="column paused" style="animation-delay: -0.6s;"></div>
                                        </div>
                                        <div class="iconfont play-btn" onclick="playSong(${result.songId})"></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="songName-container">
                                        <div class="song-name em"><a
                                                    href="/guest/detail?songId=${result.songId}"><span>${result.song_name}</span></a></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="artist-container">
                                        <div class="singers"><a href="/guest/singerDetail?singerId=${result.getSinger().id}"><span><span
                                                            >${result.getSinger().singerName}</span></span></a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="album-container">
                                        <div class="album"><a
                                                    href="/guest/albumDetail?${result.getAlbum().albumId}"><span>${result.getAlbum().albumName}</span></a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="duration-container ops-container"><span
                                                class="duration">${result.getSong_time()}</span>
                                        <div class="operations ops-right">

                                            <div class="ops-item">
                                                <div class="iconfont" onclick="downSingle(${result.songId})"></div>
                                            </div>
                                            <div class="ops-item">
                                                <div class="iconfont" onclick="addtosheet(this,${result.songId})"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        <#else >
                            <tr class="odd">
                                <td>
                                    <div class="index-container"><span class="em index">${result_index+1}</span>
                                        <div class="audio-icon unselectable">
                                            <div class="column paused" style="animation-delay: -1.2s;"></div>
                                            <div class="column paused"></div>
                                            <div class="column paused" style="animation-delay: -1.5s;"></div>
                                            <div class="column paused" style="animation-delay: -0.9s;"></div>
                                            <div class="column paused" style="animation-delay: -0.6s;"></div>
                                        </div>
                                        <div class="iconfont play-btn" onclick="playSong(${result.songId})"></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="songName-container">
                                        <div class="song-name em"><a
                                                    href="/guest/detail?songId=${result.songId}"><span>${result.song_name}</span></a></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="artist-container">
                                        <div class="singers"><a href="/guest/singerDetail?singerId=${result.getSinger().id}"><span><span
                                                           >${result.getSinger().singerName}</span></span></a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="album-container">
                                        <div class="album"><a
                                                    href="/guest/albumDetail?albumId=${result.getAlbum().albumId}"><span>${result.getAlbum().albumName}</span></a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="duration-container ops-container"><span
                                                class="duration">${result.getSong_time()}</span>
                                        <div class="operations ops-right">
                                            <div class="ops-item">
                                                <div class="iconfont" onclick="downSingle(${result.songId})"></div>
                                            </div>
                                            <div class="ops-item">
                                                <div class="iconfont" onclick="addtosheet(this,${result.songId})"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                        </#if>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mod_page_nav js_pager_comment">
            <#if (resultList.totalPages==1)>
                <strong class="current">1</strong>
            <#elseif (resultList.totalPages>1)&&(resultList.totalPages<=4)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()},'${info}')"><span>&lt;</span></a>
                </#if>
                <#list 1..resultList.totalPages as curindex>
                    <#if (resultList.getNumber()+1)==curindex>
                        <strong class="current">${curindex}</strong>
                    <#else >
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},'${info}')">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()+2},''${info}'')"><span>&gt;</span></a>
                </#if>
            <#elseif (resultList.totalPages>=5)&&(resultList.totalPages<9)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()},'${info}')"><span>&lt;</span></a>
                </#if>
                <#if (resultList.getNumber()>3)>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,'${info}')">1</a>
                    <strong class="more">...</strong>
                    <#list 3..resultList.totalPages as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},'${info}')">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                <#else>
                    <#list 1..7 as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},'${info}')">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,'${info}')">9</a>
                </#if>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()+2},'${info}')"><span>&gt;</span></a>
                </#if>
            <#elseif (resultList.totalPages>=9)>
                <#if ((resultList.getNumber()+1)!=1)>
                    <a href="javascript:;" class="next js_pageindex" title="上一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()},'${info}')"><span>&lt;</span></a>
                </#if>
                <#if ((resultList.getNumber()+1)<=4)>
                    <#list 1..7 as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},'${info}')">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${resultList.totalPages},'${info}')">${resultList.totalPages}</a>
                <#elseif ((resultList.totalPages-resultList.getNumber()-1)>=4)>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,'${info}')">1</a>
                    <strong class="more">...</strong>
                    <#list (resultList.totalPages-5)..resultList.totalPages as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},'${info}')">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                <#else>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,'${info}')">1</a>
                    <strong class="more">...</strong>
                    <#list (resultList.getNumber()+1-2)..(resultList.getNumber()+1+2) as curindex>
                        <#if (resultList.getNumber()+1)==curindex>
                            <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},'${info}')">${curindex}</a>
                        </#if>
                    <#else>
                        <strong class="current">${curindex}</strong>
                    </#list>
                    <strong class="more">...</strong>
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${resultList.totalPages},'${info}')">${resultList.totalPages}</a>
                </#if>
                <#if ((resultList.getNumber()+1)!=resultList.totalPages)>
                    <a href="javascript:;" class="next js_pageindex" title="下一页"
                       hidefocus="" onclick="toPage(${resultList.getNumber()+2},'${info}')"><span>&gt;</span></a>
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
            url: '/guest/SRtable',
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