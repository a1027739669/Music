package com.example.music.demo.service;

import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.LabelRepository;
import com.example.music.demo.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
    private LabelRepository labelRepository;


    public List<Song> getSongWithHot() {
        return songRepository.getMorePlays();
    }

    public List<Label> getAllLabel() {
        return labelRepository.findAll();
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
        List<Song> playlist= (List<Song>) httpSession.getAttribute("playlist");
        if (playlist!=null) {
            int index=playlist.indexOf(song);
            if(index==-1)
            playlist.add(0, song);
            else
                {
                    Song temp=playlist.get(0);
                    playlist.set(0,song);
                    playlist.set(index,temp);
                }
            httpSession.setAttribute("playlist", playlist);
        } else {
            playlist = new ArrayList<>();
            playlist.add(song);
            httpSession.setAttribute("playlist", playlist);
        }
        return playlist;
    }

}
