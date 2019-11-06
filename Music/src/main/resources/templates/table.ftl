<div id="table">
    <div class="content">
        <div id="J_CommentList">
            <ul class="comment-list">
                <#if commentPage ? exists>
                    <#list commentPage.content as comment>

                        <li class="comment-item ">
                            <div class="comments-user">
                <span class="face">
                      <img src="/upload/${comment.getUser().user_image}"
                           width="60px" height="60px"/>
                </span>
                            </div>
                            <div class="comments-list-content">
                                <div class="single-score clearfix">
                                    <span class="date">${comment.commentDate}</span>
                                    <div><span class="score">${comment.getUser().nicheng}</span></div>
                                </div>
                                <!--comments-content-->
                                <div class="comments-content">
                                    <div class="J_CommentContent comment-height-limit">
                                        <div class="content-inner">
                                            <div class="comments-words">
                                                <p>${comment.comment_text}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                    </#list>
                </#if>
            </ul>
            <div class="page-box">
                <div class="pagebar" id="pageBar">
                    <a class="next" onclick="toPage(1,${song.song_id})"
                       target="_self">首页<i></i></a>
                    <#if commentPage.hasPrevious()>
                        <a onclick="toPage(${commentPage.getNumber()},${song.song_id})" class="prev"
                           target="_self"><i></i>上一页</a>
                    </#if>
                    <#if ((commentPage.totalPages-commentPage.getNumber())>=10)>
                        <#list 0..9 as pageIndex>
                            <#if pageIndex==commentPage.getNumber()%10>
                                <span class="sel">${commentPage.getNumber()+1}</span>
                            <#else >
                                <a onclick="toPage(${pageIndex+1+(commentPage.getNumber()/10?int)*10},${song.song_id})"
                                   >${pageIndex+1+((commentPage.getNumber()/10)?floor)*10}</a>
                            </#if>
                        </#list>
                    <#else>
                        <#list 0..commentPage.totalPages-1 as pageIndex>
                            <#if pageIndex==commentPage.getNumber()>
                                <span class="sel">${pageIndex+1}</span>
                            <#else >
                                <a onclick="toPage(${pageIndex+1},${song.song_id})" >${pageIndex+1}</a>
                            </#if>
                        </#list>
                    </#if>
                    <#if commentPage.hasNext()>
                        <a onclick="toPage(${commentPage.getNumber()+2},${song.song_id})" class="next"
                           target="_self">下一页<i></i></a>
                    </#if>
                    <a onclick="toPage(${commentPage.totalPages},${song.song_id})" class="next"
                       target="_self">尾页<i></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function toPage(num, songId) {
        $.ajax({
            url: '/songDetail',
            type: 'GET',
            data: {
                'songId': songId,
                'pageId': num,
            },
            success: function (data) {
                $("#table").empty();
                $("#table").append(data);
            }
        });
    }
</script>
