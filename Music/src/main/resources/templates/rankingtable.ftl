<table class="rank-list-table" id="listrank">


<tr>
    <th class="cell-1">排名</th>
    <th class="cell-2">图片</th>
    <th class="cell-3">歌名</th>
    <th class="cell-4">歌手</th>
    <th class="cell-5">时长</th>
    <th class="cell-6">操作</th>
</tr>
    <#if songPage ? exists>
    <#list songPage.content as label>
<tr>
    <#if label_index<3>
    <td><span class="n1">${label_index+1}</span></td>
    <#else >
    <td><span class="n2">${label_index+1}</span></td>
    </#if>
    <td>
        <a href=""  class="pic" target="play"><img src="/upload/${label.song.song_img}"  width="80" height="80"></a>
    </td>
    <td class="name-cell">
        <h3><a href="" target="play" >${label.song.song_name}</a></h3>
    </td>
    <td>
        <div class="desc">
            <a href="javascript:;" target="_blank" class="type" >${label.song.song_singer}</a>
        </div>
    </td>
    <td>
        <div style="text-align:center;">${label.song.song_time}</div>
    </td>
    <td class="num-cell">
        <span class="list-icon icon-play" data-function="play" title="播放"></span>
        <span class="list-icon icon-download" data-function="download" title="下载"></span>
        <span class="list-icon icon-share" data-function="share" title="分享"></span>
    </td>
</tr>
    </#list>
    </#if>
</table>
