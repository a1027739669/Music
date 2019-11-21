<div id="commentTable">
<div class="part__hd">
    <h2 class="part__tit">评论<span class="c_tx_thin part__tit_desc js_all_comment_num">共${song.totalComNum}条评论</span>
    </h2>
</div>
<div class="mod_comment js_cmt_input">

    <div class="comment__input">
        <div class="comment__textarea js_comment__textarea  c_bg_normal">
            <div class="comment__textarea_inner">
                <!--c_tx_normal-->
                <!--focus评论框的时候将.comment__textarea_default模块隐藏，同时显示.comment__textarea_input-->
                <div class="comment__textarea_default c_tx_thin js_reply_text_blur" name=""
                     id="reply_text_blur" contenteditable="true">期待你的神评论……
                </div>
                <div class="js_reply_text comment__textarea_input c_tx_normal" name="" id="reply_text"
                     style="display:none;" contenteditable="true"></div>
            </div>
            <!--字数超过后添加comment__tips--warn_tx 去掉c_tx_thin-->
            <#--                <div class="comment__tips js_comment_tips c_tx_thin" data-max="300">剩余<span-->
            <#--                            class="c_tx_highlight">300</span>字-->
            <#--                </div>-->
        </div>
        <a class="comment__face js_cmt_face" href="javascript:;" data-type="reply"><i
                    class="icon_comment icon_comment_face"></i></a>
        <div class="comment__tool"><a href="javascript:;"
                                      class="mod_btn_green comment__tool_btn js_send_reply">发表评论</a>
        </div>

    </div>
</div>
<div class="mod_all_comment js_mod_all">
    <div class="comment_type__title c_b_normal">
        <h2 class="comment_new_count">最新评论(${song.totalComNum})</h2>
    </div>
    <ul class="comment__list js_all_list">

        <#if commentPage ? exists>
            <#list commentPage.content as comment>
                <li class="comment__list_item c_b_normal js_cmt_li" style="visibility: visible;">
                    <a href="javascript:;" class="comment__avatar js_nick" data-uin="1280312987">
                        <img class="js_lazy_comment_pic"
                             alt=" Z-mee"
                             title=" Z-mee" style="display: block; visibility: visible;"
                             src="/upload/${comment.getUser().user_image}">

                    </a>
                    <h4 class="comment__title"><a href="javascript:;" class="c_tx_thin js_nick js_nick_only"
                                                  data-uin="1280312987">${comment.getUser().username}</a>


                    </h4>


                    <p class="c_tx_normal comment__text js_hot_text">
                        ${comment.comment_text}</p>


                    <div class="comment__opt js_comment_opt"
                         data-commentid="song_245156056_1280312987_1574137479">
                        <span class="comment__date c_tx_thin">${comment.commentDate}</span>

                        <a class="comment__report js_cmt_accusation"
                           data-commentid="song_245156056_1280312987_1574137479" href="javascript:;">举报</a>


                        <a class="comment__zan js_cmt_praise "
                           data-commentid="song_245156056_1280312987_1574137479" href="javascript:;"><i
                                    class="icon_comment icon_comment_like"></i><span
                                    class="js_praise_num">${comment.support}</span></a>


                    </div>
                    <div class="js_reply_container"></div>
                </li>
            </#list>
        </#if>
    </ul>

    <div class="mod_page_nav js_pager_comment">
        <#if (commentPage.totalPages==1)>
            <strong class="current">1</strong>
        <#elseif (commentPage.totalPages>1)&&(commentPage.totalPages<=4)>
            <#if ((commentPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${commentPage.getNumber()},${song.song_id})"><span>&lt;</span></a>
            </#if>
            <#list 1..commentPage.totalPages as curindex>
                <#if (commentPage.getNumber()+1)==curindex>
                    <strong class="current">${curindex}</strong>
                <#else >
                    <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${song.song_id})">${curindex}</a>
                </#if>
            <#else>
                <strong class="current">${curindex}</strong>
            </#list>
            <#if ((commentPage.getNumber()+1)!=commentPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${commentPage.getNumber()+2},${song.song_id})"><span>&gt;</span></a>
            </#if>
        <#elseif (commentPage.totalPages>=5)&&(commentPage.totalPages<9)>
            <#if ((commentPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${commentPage.getNumber()},${song.song_id})"><span>&lt;</span></a>
            </#if>
            <#if (commentPage.getNumber()>3)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${song.song_id})">1</a>
                <strong class="more">...</strong>
                <#list 3..commentPage.totalPages as curindex>
                    <#if (commentPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${song.song_id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <#list 1..7 as curindex>
                    <#if (commentPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${song.song_id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(9,${song.song_id})">9</a>
            </#if>
            <#if ((commentPage.getNumber()+1)!=commentPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${commentPage.getNumber()+2},${song.song_id})"><span>&gt;</span></a>
            </#if>
        <#elseif (commentPage.totalPages>=9)>
            <#if ((commentPage.getNumber()+1)!=1)>
                <a href="javascript:;" class="next js_pageindex" title="上一页"
                   hidefocus="" onclick="toPage(${commentPage.getNumber()},${song.song_id})"><span>&lt;</span></a>
            </#if>
            <#if ((commentPage.getNumber()+1)<=4)>
                <#list 1..7 as curindex>
                    <#if (commentPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${song.song_id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${commentPage.totalPages},${song.song_id})">${commentPage.totalPages}</a>
            <#elseif ((commentPage.totalPages-commentPage.getNumber()-1)>=4)>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${song.song_id})">1</a>
                <strong class="more">...</strong>
                <#list (commentPage.totalPages-5)..commentPage.totalPages as curindex>
                    <#if (commentPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${song.song_id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
            <#else>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(1,${song.song_id})">1</a>
                <strong class="more">...</strong>
                <#list (commentPage.getNumber()+1-2)..(commentPage.getNumber()+1+2) as curindex>
                    <#if (commentPage.getNumber()+1)==curindex>
                        <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${curindex},${song.song_id})">${curindex}</a>
                    </#if>
                <#else>
                    <strong class="current">${curindex}</strong>
                </#list>
                <strong class="more">...</strong>
                <a href="javascript:;" class="js_pageindex" hidefocus="" onclick="toPage(${commentPage.totalPages},${song.song_id})">${commentPage.totalPages}</a>
            </#if>
            <#if ((commentPage.getNumber()+1)!=commentPage.totalPages)>
                <a href="javascript:;" class="next js_pageindex" title="下一页"
                   hidefocus="" onclick="toPage(${commentPage.getNumber()+2},${song.song_id})"><span>&gt;</span></a>
            </#if>
        </#if>
    </div>
</div>
</div>
<script type="text/javascript">
    function toPage(num,songId) {
        $.ajax({
            url: '/guest/songDetail',
            type: 'GET',
            data: {
                'songId':songId,
                'pageId': num,
            },
            success: function (data) {
                $("#commentTable").empty();
                $("#commentTable").append(data);
            }
        });
    }
</script>