package com.example.music.demo.service;

import com.example.music.demo.entity.*;
import com.example.music.demo.repository.SongRepository;
import com.example.music.demo.repository.SongSheetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.service
 * @ClassName: IndexService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 11:41
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 11:41
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class IndexService {
    @Autowired
    private SongRepository songRepository;
    @Autowired
    private SongSheetRepository songSheetRepository;
    @Autowired
    private SingerService singerService;

    public List<Song> getSongWithHot() {
        return songRepository.getMorePlays();
    }
    public List<Song> getNewMusics() {
        return songRepository.getNewMusics();
    }

    public List<Song> getMoreSearchMusics() {
        return songRepository.getHotSearchMusics();
    }

    public List<Song> getMoreDownMusics() {
        return songRepository.getMoreDownMusics();
    }

    public List<Song> setPlaySong(HttpSession httpSession, Integer id) {
        Song song = songRepository.getOne(id);
        Info info = song.getInfo();
        info.setInfo_plays(info.getInfo_plays() + 1);
        Singer singer = song.getSinger();
        singer.setSupport(singer.getSupport() + 1);
        singerService.save(singer);
        List<Song> playlist = (List<Song>) httpSession.getAttribute("playlist");
        if (playlist != null) {
            int i;
            for(i=0;i<playlist.size();i++){
                if(playlist.get(i).getSongId().equals(id)){
                    Song temp = playlist.get(0);
                    playlist.set(0, song);
                    playlist.set(i, temp);
                    break;
                }
            }
            if(i==playlist.size())
                playlist.add(song);
            httpSession.setAttribute("playlist", playlist);
        } else {
            playlist = new ArrayList<>();
            playlist.add(song);
            httpSession.setAttribute("playlist", playlist);
        }
        return playlist;
    }

    public Page<SongSheet> getSheetList(Integer page, Integer rankMethod) {
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<SongSheet> songSheetList;
        if (rankMethod == 1)
            songSheetList = songSheetRepository.findAll1();
        else {
            songSheetList = songSheetRepository.findAll2();
        }
        int start = (int) pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), songSheetList.size());
        Page<SongSheet> songSheetsPage = new PageImpl<>(songSheetList.subList(start, end), pageable, songSheetList.size());
        List<SongSheet> test = songSheetsPage.getContent();
        return songSheetsPage;
    }

    public Page<SongSheet> getSheetList(Integer page, Integer rankMethod, String label) {
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<SongSheet> songSheetList;
        if (rankMethod == 1)
            songSheetList = songSheetRepository.findAll1();
        else {
            songSheetList = songSheetRepository.findAll2();
        }
        if (!label.equals("全部"))
            for (int i = songSheetList.size() - 1; i >= 0; i--) {
                if (!songSheetList.get(i).getLabels().contains(label))
                    songSheetList.remove(i);
            }
        int start = (int) pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), songSheetList.size());
        Page<SongSheet> songSheetsPage = new PageImpl<>(songSheetList.subList(start, end), pageable, songSheetList.size());
        return songSheetsPage;
    }
}
