<div id="table2">
    <div class="mod_part">
        <div class="part__hd">
            <h2 class="part__tit">单曲</h2>

        </div>

        <div class="mod_songlist">
            <ul class="songlist__header">
                <li class="songlist__edit songlist__edit--check sprite">
                    <input type="checkbox" class="songlist__checkbox">
                </li>
                <li class="songlist__header_name">歌曲</li>
                <li class="songlist__header_album">专辑</li>
                <li class="songlist__header_time">时长</li>
            </ul>

            <ul class="songlist__list">
                <#if songPage ? exists>
                    <#list songPage.content as song>
                        <li mid="237773700">
                            <div class="songlist__item">
                                <div class="songlist__edit songlist__edit--check sprite">
                                    <input type="checkbox" class="songlist__checkbox">
                                </div>
                                <div class="songlist__number">${song_index+1}</div>
                                <div class="songlist__songname">

                                    <span class="songlist__songname_txt"><a
                                                href="//y.qq.com/n/yqq/song/001qvvgF38HVc4.html"
                                                class="js_song" title="说好不哭（with 五月天阿信）">${song.song_name}</a></span>
                                    <div class="mod_list_menu">
                                        <a href="//y.qq.com/portal/player.html"
                                           class="list_menu__item list_menu__play js_play" title="播放">
                                            <i class="list_menu__icon_play"></i>
                                            <span class="icon_txt">播放</span>
                                        </a>
                                        <a href="javascript:;" class="list_menu__item list_menu__add js_fav"
                                           title="添加到歌单"
                                           aria-haspopup="true" data-target="menu_add">
                                            <i class="list_menu__icon_add"></i>
                                            <span class="icon_txt">添加到歌单</span>
                                        </a>

                                        <a href="javascript:;" class="list_menu__item list_menu__down js_down"
                                           title="VIP下载"
                                           aria-haspopup="true" data-target="menu_down">
                                            <i class="list_menu__icon_down_vip"></i>
                                            <span class="icon_txt">VIP下载</span>
                                        </a>

                                    </div>
                                </div>
                                <div class="songlist__album">

                                    <a href="" title="说好不哭（with 五月天阿信）">${song.getAlbum().album_name}</a>

                                </div>
                                <div class="songlist__time">${song.song_time}</div>
                                <div class="songlist__other">
                                </div>
                            </div>
                        </li>
                    </#list>

                <#else >
                    <div class="none_txt" style="display:none;">
                        <i class="none_txt__symbol"></i>
                        <p>该歌手还没有发表过专辑</p>
                    </div>
                </#if>
            </ul>
        </div>
    </div>
    <div class="mod_page_nav js_pager_comment">
        <#if (songPage.totalPages==1)>
            <strong class="current">1</strong>
        <#elseif (songPage.totalPages>1)&&(songPage.totalPages<=4)>
            <#if ((songPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${songPage.getNumber()},${singer.id})"><span>&lt;</span></a>
            </#if>
            <#list 1..songPage.totalPages as curindex>
                <#if (songPage.getNumber()+1)==curindex>
                    <strong class="current">${curindex}</strong>
                <#else >
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toPage(${curindex},${singer.id})">${curindex}</a>
                </#if>
            <#else>
                <strong class="current">${curindex}</strong>
            </#list>
            <#if ((songPage.getNumber()+1)!=songPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${songPage.getNumber()+2},${singer.id})"><span>&gt;</span></a>
            </#if>
        <#elseif (songPage.totalPages>=5)&&(songPage.totalPages<9)>
            <#if ((songPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${songPage.getNumber()},${singer.id})"><span>&lt;</span></a>
            </#if>
            <#if (songPage.getNumber()>3)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${singer.id})">1</a>
                <strong class="more">...</strong>
                <#list 3..songPage.totalPages as curindex>
                    <#if (songPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${singer.id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <#list 1..7 as curindex>
                    <#if (songPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${singer.id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,${singer.id})">9</a>
            </#if>
            <#if ((songPage.getNumber()+1)!=songPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${songPage.getNumber()+2},${singer.id})"><span>&gt;</span></a>
            </#if>
        <#elseif (songPage.totalPages>=9)>
            <#if ((songPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${songPage.getNumber()},${singer.id})"><span>&lt;</span></a>
            </#if>
            <#if ((songPage.getNumber()+1)<=4)>
                <#list 1..7 as curindex>
                    <#if (songPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${singer.id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toPage(${songPage.totalPages},${singer.id})">${songPage.totalPages}</a>
            <#elseif ((songPage.totalPages-songPage.getNumber()-1)>=4)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${singer.id})">1</a>
                <strong class="more">...</strong>
                <#list (songPage.totalPages-5)..songPage.totalPages as curindex>
                    <#if (songPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${singer.id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${singer.id})">1</a>
                <strong class="more">...</strong>
                <#list (songPage.getNumber()+1-2)..(songPage.getNumber()+1+2) as curindex>
                    <#if (songPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${singer.id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toPage(${songPage.totalPages},${singer.id})">${songPage.totalPages}</a>
            </#if>
            <#if ((songPage.getNumber()+1)!=songPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${songPage.getNumber()+2},${singer.id})"><span>&gt;</span></a>
            </#if>
        </#if>
    </div>


</div>
<script type="text/javascript">
    function toPage(num, singerId) {
        $.ajax({
            url: '/guest/singerSongs',
            type: 'GET',
            data: {
                'singerId': singerId,
                'pageId': num,
            },
            success: function (data) {
                $("#table2").empty();
                $("#table2").append(data);
            }
        });
    }
</script>