<div id="list">
    <ul class="songlist__header">
        <li class="songlist__edit sprite">
            <input type="checkbox" class="songlist__checkbox js_check_all">
        </li>
        <li class="songlist__header_name">歌曲</li>
        <li class="songlist__header_author">歌手</li>
        <li class="songlist__header_time">时长</li>
    </ul>
    <#list songList.content as song>
        <#if (song_index%2==0)>
            <#if (((pageIndex-1)*20+song_index+1)<=2)>
                <li mid="244499239" ix="0">
                    <div class="songlist__item" onmouseover="this.className=(this.className+' songlist__item--hover')"
                         onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                        <div class="songlist__edit songlist__edit--check sprite">
                            <input type="checkbox" class="songlist__checkbox">
                        </div>

                        <div class="songlist__number  songlist__number--top">${(pageIndex-1)*20+song_index+1}</div>

                        <div class="songlist__songname">

                        <span class="songlist__songname_txt" style="visibility: visible;">
			    <a href="" class="songlist__cover album_name"><img
                            src="/upload/${song.song_img}"
                            alt="那男孩还好吗" class="songlist__pic" style="display: block; visibility: visible;"></a>
			    <a href="" class="js_song" title="那男孩还好吗 ">${song.song_name}</a>

			</span>
                            <div class="mod_list_menu">
                                <a href="javascript:;" class="list_menu__item list_menu__play js_play" title="播放">
                                    <i class="list_menu__icon_play"></i>
                                    <span class="icon_txt">播放</span>
                                </a>
                                <a href="javascript:;" class="list_menu__item list_menu__add js_fav" title="添加到歌单"
                                   aria-haspopup="true" data-target="menu_add">
                                    <i class="list_menu__icon_add"></i>
                                    <span class="icon_txt">添加到歌单</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__down js_down" title="VIP下载"
                                   aria-haspopup="true" data-target="menu_down">
                                    <i class="list_menu__icon_down_vip"></i>
                                    <span class="icon_txt">VIP下载</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__share js_share" title="分享"
                                   aria-haspopup="true" data-aria="menu_share">
                                    <i class="list_menu__icon_share"></i>
                                    <span class="icon_txt">分享</span>
                                </a>
                            </div>
                        </div>

                        <div class="songlist__artist" title="Uu">


                            <a href="https://y.qq.com/n/yqq/singer/003yGiqM2qF7Gm.html" data-singermid="003yGiqM2qF7Gm"
                               data-singerid="3298773" title="Uu" class="singer_name">${song.getSinger().singerName}</a>

                        </div>
                        <div class="songlist__time">${song.song_time}</div>
                        <div class="songlist__other">

                        </div>
                    </div>
                </li>
            <#else >
                <li mid="244499239" ix="0">
                    <div class="songlist__item" onmouseover="this.className=(this.className+' songlist__item--hover')"
                         onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                        <div class="songlist__edit songlist__edit--check sprite">
                            <input type="checkbox" class="songlist__checkbox">
                        </div>

                        <div class="songlist__number">${(pageIndex-1)*20+song_index+1}</div>

                        <div class="songlist__songname">

                        <span class="songlist__songname_txt" style="visibility: visible;">
			    <a href="" class="songlist__cover album_name"><img
                            src="/upload/${song.song_img}"
                            alt="那男孩还好吗" class="songlist__pic" style="display: block; visibility: visible;"></a>
			    <a href="" class="js_song" title="那男孩还好吗 ">${song.song_name}</a>

			</span>
                            <div class="mod_list_menu">
                                <a href="javascript:;" class="list_menu__item list_menu__play js_play" title="播放">
                                    <i class="list_menu__icon_play"></i>
                                    <span class="icon_txt">播放</span>
                                </a>
                                <a href="javascript:;" class="list_menu__item list_menu__add js_fav" title="添加到歌单"
                                   aria-haspopup="true" data-target="menu_add">
                                    <i class="list_menu__icon_add"></i>
                                    <span class="icon_txt">添加到歌单</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__down js_down" title="VIP下载"
                                   aria-haspopup="true" data-target="menu_down">
                                    <i class="list_menu__icon_down_vip"></i>
                                    <span class="icon_txt">VIP下载</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__share js_share" title="分享"
                                   aria-haspopup="true" data-aria="menu_share">
                                    <i class="list_menu__icon_share"></i>
                                    <span class="icon_txt">分享</span>
                                </a>
                            </div>
                        </div>

                        <div class="songlist__artist" title="Uu">


                            <a href="https://y.qq.com/n/yqq/singer/003yGiqM2qF7Gm.html" data-singermid="003yGiqM2qF7Gm"
                               data-singerid="3298773" title="Uu" class="singer_name">${song.getSinger().singerName}</a>

                        </div>
                        <div class="songlist__time">${song.song_time}</div>
                        <div class="songlist__other">

                        </div>
                    </div>
                </li>
            </#if>
        <#else >
            <#if (((pageIndex-1)*20+song_index+1)<=2)>
                <li mid="244497931" ix="1">
                    <div class="songlist__item songlist__item--even "
                         onmouseover="this.className=(this.className+' songlist__item--hover')"
                         onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                        <div class="songlist__edit songlist__edit--check sprite">
                            <input type="checkbox" class="songlist__checkbox">
                        </div>

                        <div class="songlist__number  songlist__number--top">${(pageIndex-1)*20+song_index+1}</div>


                        <div class="songlist__songname">




                            <span class="songlist__songname_txt" style="visibility: visible;">
			    <a href="https://y.qq.com/n/yqq/album/003K2eEI2aPyyh.html" class="songlist__cover album_name"
                   data-albummid="003K2eEI2aPyyh" data-albumid="9131771"><img
                            src="/upload/${song.song_img}"
                            alt="一生与你擦肩而过" class="songlist__pic" style="display: block; visibility: visible;"></a>
			    <a href="https://y.qq.com/n/yqq/song/000xRG4E4diqXD.html" class="js_song"
                   title="一生与你擦肩而过 ">${song.song_name}</a>

			</span>
                            <div class="mod_list_menu">
                                <a href="javascript:;" class="list_menu__item list_menu__play js_play" title="播放">
                                    <i class="list_menu__icon_play"></i>
                                    <span class="icon_txt">播放</span>
                                </a>
                                <a href="javascript:;" class="list_menu__item list_menu__add js_fav" title="添加到歌单"
                                   aria-haspopup="true" data-target="menu_add">
                                    <i class="list_menu__icon_add"></i>
                                    <span class="icon_txt">添加到歌单</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__down js_down" title="VIP下载"
                                   aria-haspopup="true" data-target="menu_down">
                                    <i class="list_menu__icon_down_vip"></i>
                                    <span class="icon_txt">VIP下载</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__share js_share" title="分享"
                                   aria-haspopup="true" data-aria="menu_share">
                                    <i class="list_menu__icon_share"></i>
                                    <span class="icon_txt">分享</span>
                                </a>
                            </div>
                        </div>

                        <div class="songlist__artist" title="阿悠悠">


                            <a href="https://y.qq.com/n/yqq/singer/002oKQfI4E0PBk.html" data-singermid="002oKQfI4E0PBk"
                               data-singerid="3026094" title="阿悠悠"
                               class="singer_name">${song.getSinger().singerName}</a>

                        </div>
                        <div class="songlist__time">${song.song_time}</div>
                        <div class="songlist__other">

                        </div>
                    </div>
                </li>
            <#else >
                <li mid="244497931" ix="1">
                    <div class="songlist__item songlist__item--even "
                         onmouseover="this.className=(this.className+' songlist__item--hover')"
                         onmouseout="this.className=this.className.replace(/ songlist__item--hover/, '')">
                        <div class="songlist__edit songlist__edit--check sprite">
                            <input type="checkbox" class="songlist__checkbox">
                        </div>

                        <div class="songlist__number">${(pageIndex-1)*20+song_index+1}</div>


                        <div class="songlist__songname">




                            <span class="songlist__songname_txt" style="visibility: visible;">
			    <a href="https://y.qq.com/n/yqq/album/003K2eEI2aPyyh.html" class="songlist__cover album_name"
                   data-albummid="003K2eEI2aPyyh" data-albumid="9131771"><img
                            src="/upload/${song.song_img}"
                            alt="一生与你擦肩而过" class="songlist__pic" style="display: block; visibility: visible;"></a>
			    <a href="https://y.qq.com/n/yqq/song/000xRG4E4diqXD.html" class="js_song"
                   title="一生与你擦肩而过 ">${song.song_name}</a>

			</span>
                            <div class="mod_list_menu">
                                <a href="javascript:;" class="list_menu__item list_menu__play js_play" title="播放">
                                    <i class="list_menu__icon_play"></i>
                                    <span class="icon_txt">播放</span>
                                </a>
                                <a href="javascript:;" class="list_menu__item list_menu__add js_fav" title="添加到歌单"
                                   aria-haspopup="true" data-target="menu_add">
                                    <i class="list_menu__icon_add"></i>
                                    <span class="icon_txt">添加到歌单</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__down js_down" title="VIP下载"
                                   aria-haspopup="true" data-target="menu_down">
                                    <i class="list_menu__icon_down_vip"></i>
                                    <span class="icon_txt">VIP下载</span>
                                </a>

                                <a href="javascript:;" class="list_menu__item list_menu__share js_share" title="分享"
                                   aria-haspopup="true" data-aria="menu_share">
                                    <i class="list_menu__icon_share"></i>
                                    <span class="icon_txt">分享</span>
                                </a>
                            </div>
                        </div>

                        <div class="songlist__artist" title="阿悠悠">


                            <a href="https://y.qq.com/n/yqq/singer/002oKQfI4E0PBk.html" data-singermid="002oKQfI4E0PBk"
                               data-singerid="3026094" title="阿悠悠"
                               class="singer_name">${song.getSinger().singerName}</a>

                        </div>
                        <div class="songlist__time">${song.song_time}</div>
                        <div class="songlist__other">

                        </div>
                    </div>
                </li>
            </#if>
        </#if>
    </#list>
    <div class="mod_page_nav js_pager_comment">
        <#if (songList.totalPages==1)>
            <strong class="current">1</strong>
        <#elseif (songList.totalPages>1)&&(songList.totalPages<=4)>
            <#if ((songList.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${songList.getNumber()},${classId})"><span>&lt;</span></a>
            </#if>
            <#list 1..songList.totalPages as curindex>
                <#if (songList.getNumber()+1)==curindex>
                    <strong class="current">${curindex}</strong>
                <#else >
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toPage(${curindex},${classId})">${curindex}</a>
                </#if>
            <#else>
                <strong class="current">${curindex}</strong>
            </#list>
            <#if ((songList.getNumber()+1)!=songList.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${songList.getNumber()+2},${classId})"><span>&gt;</span></a>
            </#if>
        <#elseif (songList.totalPages>=5)&&(songList.totalPages<9)>
            <#if ((songList.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${songList.getNumber()},${classId})"><span>&lt;</span></a>
            </#if>
            <#if (songList.getNumber()>3)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${classId})">1</a>
                <strong class="more">...</strong>
                <#list 3..songList.totalPages as curindex>
                    <#if (songList.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${classId})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <#list 1..7 as curindex>
                    <#if (songList.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${classId})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,${classId})">9</a>
            </#if>
            <#if ((songList.getNumber()+1)!=songList.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${songList.getNumber()+2},${classId})"><span>&gt;</span></a>
            </#if>
        <#elseif (songList.totalPages>=9)>
            <#if ((songList.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${songList.getNumber()},${classId})"><span>&lt;</span></a>
            </#if>
            <#if ((songList.getNumber()+1)<=4)>
                <#list 1..7 as curindex>
                    <#if (songList.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${classId})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toPage(${songList.totalPages},${classId})">${songList.totalPages}</a>
            <#elseif ((songList.totalPages-songList.getNumber()-1)>=4)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${classId})">1</a>
                <strong class="more">...</strong>
                <#list (songList.totalPages-5)..songList.totalPages as curindex>
                    <#if (songList.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${classId})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${classId})">1</a>
                <strong class="more">...</strong>
                <#list (songList.getNumber()+1-2)..(songList.getNumber()+1+2) as curindex>
                    <#if (songList.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${classId})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toPage(${songList.totalPages},${classId})">${songList.totalPages}</a>
            </#if>
            <#if ((songList.getNumber()+1)!=songList.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${songList.getNumber()+2},${classId})"><span>&gt;</span></a>
            </#if>
        </#if>
    </div>
</div>
<script type="text/javascript">
    function toPage(num, classId) {
        $.ajax({
            url: '/guest/rankDetail',
            type: 'GET',
            data: {
                'rankClassId': classId,
                'pageId': num,
            },
            success: function (data) {
                $("#songList").empty();
                $("#songList").append(data);
            }
        });
    }
</script>