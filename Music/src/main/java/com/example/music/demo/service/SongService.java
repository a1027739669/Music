package com.example.music.demo.service;

import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: SongService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 13:26
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 13:26
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class SongService {
    @Autowired
    private SongRepository songRepository;

    public Song getOneDetail(Integer id) {
        return songRepository.getOne(id);
    }
//
//    public Page<SongClass> getSongPage(Integer labelId, Integer pageId) {
//        Pageable pageable = PageRequest.of(pageId - 1, 20);
//        List<SongClass> songClassList = new ArrayList<>();
//        if (labelId != 0) {
//            songClassList = songClassRepository.getSongPage(labelId);
//        } else {
//            songClassList = songClassRepository.getSongPageAll();
//        }
//        int start = (int) pageable.getOffset();
//        int end = (start + pageable.getPageSize()) > songClassList.size() ? songClassList.size() : (start + pageable.getPageSize());
//        Page<SongClass> songClassPage = new PageImpl<>(songClassList.subList(start, end), pageable, songClassList.size());
//        return songClassPage;
//    }

    public List<Song> getNewMusicies(){
        return songRepository.getNewMusics();
    }
    public Page<Song> getSongPages(Integer page, Integer singerId) {
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<Song> songList = songRepository.findAllBySingerId(singerId);
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > songList.size() ? songList.size() : (start + pageable.getPageSize());
        Page<Song> songPage = new PageImpl<>(songList.subList(start, end), pageable, songList.size());
        return songPage;
    }

    public Integer getTotalSongNumber(Integer singerId) {
        return songRepository.findAllBySingerId(singerId).size();
    }

    public List<Song> findAllByLabelsLike(String label){
        return songRepository.findAllBySongLabelLike("%"+label+"%");
    }


}
