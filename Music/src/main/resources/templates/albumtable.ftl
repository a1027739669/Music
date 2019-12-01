<div id="temp">
    <div class="mod_tag" id="tag_list">
        <div class="tag__list">
            <#if currentCate=="华语">
                <a onclick="changeCate(1,'华语')" class="tag__item tag__item--select" data-id="area|1">华语</a>
            <#else >
                <a onclick="changeCate(1,'华语')" class="tag__item" data-id="area|1">华语</a>
            </#if>
            <#if currentCate=="港台">
                <a onclick="changeCate(1,'港台')" class="tag__item tag__item--select" data-id="area|1">港台</a>
            <#else >
                <a onclick="changeCate(1,'港台')" class="tag__item" data-id="area|1">港台</a>
            </#if>
            <#if currentCate=="欧美">
                <a onclick="changeCate(1,'欧美')" class="tag__item tag__item--select" data-id="area|1">欧美</a>
            <#else >
                <a onclick="changeCate(1,'欧美')" class="tag__item" data-id="area|1">欧美</a>
            </#if>
            <#if currentCate=="韩国">
                <a onclick="changeCate(1,'韩国')" class="tag__item tag__item--select" data-id="area|1">韩国</a>
            <#else >
                <a onclick="changeCate(1,'韩国')" class="tag__item" data-id="area|1">韩国</a>
            </#if>
            <#if currentCate=="日本">
                <a onclick="changeCate(1,'日本')" class="tag__item tag__item--select" data-id="area|1">日本</a>
            <#else >
                <a onclick="changeCate(1,'日本')" class="tag__item" data-id="area|1">日本</a>
            </#if>
            <#if currentCate=="其他">
                <a onclick="changeCate(1,'其他')" class="tag__item tag__item--select" data-id="area|1">其他</a>
            <#else >
                <a onclick="changeCate(1,'其他')" class="tag__item" data-id="area|1">其他</a>
            </#if>
        </div>
    </div>
    <div class="mod_part_detail" id="allalbum">
        <div class="mod_playlist mod_playlist--all">
            <ul class="playlist__list" id="album_list">
                <#list albumPage.content as album>
                    <li class="playlist__item"
                        onmouseover="this.className=(this.className+' playlist__item--hover')"
                        onmouseout="this.className=this.className.replace(/ playlist__item--hover/, '')">
                        <div class="playlist__item_box">
                            <div class="playlist__cover mod_cover" style="visibility: visible;">
                                <a class="js_album" onclick="playAllAlbum(${album.albumId})"
                                   data-stat="y_new.album_lib.album_pic">
                                    <img src="/upload/${album.album_img}"
                                         alt="此情此景" class="playlist__pic" style="display: block; visibility: visible;">
                                    <i class="mod_cover__icon_play js_play" data-stat="y_new.album_lib.album_play"></i>
                                </a>
                            </div>
                            <h4 class="playlist__title">
			<span class="playlist__title_txt">
				<a href="/guest/albumDetail?albumId=${album.albumId}"
                   onclick="" class="js_album"
                   data-stat="y_new.album_lib.album_name" data-albummid="002rmKH83FOcnD"
                   title="此情此景">${album.album_name}</a>
			</span>
                            </h4>
                            <div class="playlist__author" title="李佳璐">


                                <#--                    <a href="" class="js_singer"-->
                                <#--                       data-singermid="000kIeH91GinlQ">${album.getSinger().singerName}</a>-->


                            </div>
                            <div class="playlist__other">
                                ${album.album_release}
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>
    <div class="mod_page_nav js_pager_comment">
        <#if (albumPage.totalPages==1)>
            <strong class="current">1</strong>
        <#elseif (albumPage.totalPages>1)&&(albumPage.totalPages<=4)>
            <#if ((albumPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${albumPage.getNumber()},${currentCate})"><span>&lt;</span></a>
            </#if>
            <#list 1..albumPage.totalPages as curindex>
                <#if (albumPage.getNumber()+1)==curindex>
                    <strong class="current">${curindex}</strong>
                <#else >
                    <a href="javascript:;" class="js_pageindex" hidefocus=""
                       onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                </#if>
            <#else>
                <strong class="current">${curindex}</strong>
            </#list>
            <#if ((albumPage.getNumber()+1)!=albumPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${albumPage.getNumber()+2},${currentCate})"><span>&gt;</span></a>
            </#if>
        <#elseif (albumPage.totalPages>=5)&&(albumPage.totalPages<9)>
            <#if ((albumPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${albumPage.getNumber()},${currentCate})"><span>&lt;</span></a>
            </#if>
            <#if (albumPage.getNumber()>3)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${currentCate})">1</a>
                <strong class="more">...</strong>
                <#list 3..albumPage.totalPages as curindex>
                    <#if (albumPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <#list 1..7 as curindex>
                    <#if (albumPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,${currentCate})">9</a>
            </#if>
            <#if ((albumPage.getNumber()+1)!=albumPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${albumPage.getNumber()+2},${currentCate})"><span>&gt;</span></a>
            </#if>
        <#elseif (albumPage.totalPages>=9)>
            <#if ((albumPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${albumPage.getNumber()},${currentCate})"><span>&lt;</span></a>
            </#if>
            <#if ((albumPage.getNumber()+1)<=4)>
                <#list 1..7 as curindex>
                    <#if (albumPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toPage(${albumPage.totalPages},${currentCate})">${albumPage.totalPages}</a>
            <#elseif ((albumPage.totalPages-albumPage.getNumber()-1)>=4)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${currentCate})">1</a>
                <strong class="more">...</strong>
                <#list (albumPage.totalPages-5)..albumPage.totalPages as curindex>
                    <#if (albumPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${currentCate})">1</a>
                <strong class="more">...</strong>
                <#list (albumPage.getNumber()+1-2)..(albumPage.getNumber()+1+2) as curindex>
                    <#if (albumPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus=""
                           onclick="toPage(${curindex},${currentCate})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus=""
                   onclick="toPage(${albumPage.totalPages},${currentCate})">${albumPage.totalPages}</a>
            </#if>
            <#if ((albumPage.getNumber()+1)!=albumPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${albumPage.getNumber()+2},${currentCate})"><span>&gt;</span></a>
            </#if>
        </#if>
    </div>
</div>
<script type="text/javascript">
    function toList(page, cate) {
        $.ajax({
            url: '/guest/albumtable',
            type: 'GET',
            data: {
                'category': cate,
                'pageId': page,
            },
            success: function (data) {
                $("#temp").empty();
                $("#temp").append(data);
            }
        });
    }

    function changeCate(page, cate) {
        $.ajax({
            url: '/guest/albumtable',
            type: 'GET',
            data: {
                'category': cate,
                'pageId': page,
            },
            success: function (data) {
                $("#temp").empty();
                $("#temp").append(data);
            }
        });
    }

    function playAllAlbum(albumId) {
        window.open("/guest/playAlbum?albumId=" + albumId);
    }
</script>