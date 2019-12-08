package com.example.music.demo.service;

import com.example.music.demo.entity.Comment;
import com.example.music.demo.entity.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: RankingService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/26 14:31
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/26 14:31
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class RankingService {
    @Autowired
    private SongService songService;
    @Autowired
    private IndexService indexService;
    @Autowired
    private LabelService labelService;

    public Page<Song> getSongRank(Integer page, Integer rankClassId) {
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<Song> songList = new ArrayList<>();
        if (rankClassId <= 3) {
            if (rankClassId == 1) {
                songList = indexService.getMoreSearchMusics();
            } else if (rankClassId == 2) {
                songList = indexService.getSongWithHot();
            } else if (rankClassId == 3) {
                songList = indexService.getMoreDownMusics();
            }
        } else if(rankClassId==4){
            songList = songService.findAllByLauguage("国语");
            Collections.sort(songList, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });

        }
        else if(rankClassId==5){
            songList = songService.findAllByLauguage("粤语");
            Collections.sort(songList, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
        }
        else if(rankClassId==6){
            songList = songService.findAllByLauguage("英语");
            Collections.sort(songList, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
        }
        else if(rankClassId==7){
            songList = songService.findAllByLauguage("韩语");
            Collections.sort(songList, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
        }
        else if(rankClassId==8){
            songList = songService.findAllByLauguage("日语");
            Collections.sort(songList, new Comparator<Song>() {
                @Override
                public int compare(Song o1, Song o2) {
                    return -o1.getInfo().getInfo_plays().compareTo(o2.getInfo().getInfo_plays());
                }
            });
        }

        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > songList.size() ? songList.size() : (start + pageable.getPageSize());
        Page<Song> songPage = new PageImpl<>(songList.subList(start, end), pageable, songList.size());
        return songPage;
    }

}
