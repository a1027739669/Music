<ul class="playlist__list" id="playlist_box" id="list">

  <#list sheetsPage.content as sheet>
    <li class="playlist__item" onmouseover="this.className=(this.className+' playlist__item--hover')"
        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')"
        data-disstid="7088239319">
        <div class="playlist__item_box">
            <div class="playlist__cover mod_cover" style="visibility: visible;"><a
                        title="油管旅拍Vlog | 备好行囊，上路！" class="js_playlist"
                        onclick="setStatCookie&amp;&amp;setStatCookie();"
                        href="https://y.qq.com/n/yqq/playsquare/7088239319.html#stat=y_new.playlist.pic_click"
                        data-stat="y_new.playlist.pic_click" data-disstid="7088239319"><img
                            class="playlist__pic" style="display: block; visibility: visible;"
                            onerror="this.src='//y.gtimg.cn/mediastyle/global/img/cover_playlist.png?max_age=31536000';this.onerror=null;"
                            alt="油管旅拍Vlog | 备好行囊，上路！"
                            src="/upload/${sheet.sheetImg}"
                            data-original="//p.qpic.cn/music_cover/eEEgEM3HemUrFzxVvK50iaSlcZUcY2HFiaDvGQRZSXBay7YwU7yEpVicQ/300?n=1"><i
                            class="mod_cover__icon_play js_play"
                            data-stat="y_new.playlist.pic_play"></i></a></div>
            <h4 class="playlist__title"><span class="playlist__title_txt"><a title="油管旅拍Vlog | 备好行囊，上路！"
                                                                             class="js_playlist"
                                                                             onclick="setStatCookie&amp;&amp;setStatCookie();"
                                                                             href="https://y.qq.com/n/yqq/playsquare/7088239319.html#stat=y_new.playlist.dissname"
                                                                             data-stat="y_new.playlist.dissname"
                                                                             data-disstid="7088239319">${sheet.sheetName}</a></span>
            </h4>
            <div class="playlist__author">

                <a title="急速电子girl" class="js_user" onclick="setStatCookie&amp;&amp;setStatCookie();"
                   href="//y.qq.com/portal/profile.html?uin=owEs7eEk7wEiNn**#stat=y_new.playlist.creater"
                   data-stat="y_new.playlist.creater" data-uin="owEs7eEk7wEiNn**">${sheet.createId}</a>

            </div>
            <div class="playlist__other">
                播放量： ${sheet.support}万
            </div>
            <a class="btn_operate_menu js_playlist_more" href="javascript:;"
               data-stat="y_new.playlist.pic_mod_more" data-id="7088239319" data-type="3"><span
                        class="icon_txt">更多</span></a>
        </div>
    </li>
</#list>
</ul>
