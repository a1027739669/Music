package com.example.music.demo.service;

import com.example.music.demo.entity.Song;
import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.repository.SongSheetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: SongSheetService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/14 20:18
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/14 20:18
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class SongSheetService {
    @Autowired
    private SongSheetRepository songSheetRepository;

    public Integer getSize() {
        return songSheetRepository.findAll().size();
    }

    public List<SongSheet> getRandomSheet(List<Integer> numbers) {
        return songSheetRepository.findByIdIn(numbers);
    }

    public SongSheet findById(Integer id) {
        return songSheetRepository.findSongSheetById(id);
    }

    public List<SongSheet> findAllLikeSheet(Integer id) {
        return songSheetRepository.findAllByUserIdOrCreateId(id);
    }

    public List<SongSheet> findMyCreate(Integer id) {
        return songSheetRepository.findAllByCreateId(id);
    }

    public List<SongSheet> findMyCreateLimit(Integer id) {
        Pageable pageable = PageRequest.of(0, 5);
        List<SongSheet> songSheetList = songSheetRepository.findAllByCreateId(id);
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > songSheetList.size() ? songSheetList.size() : (start + pageable.getPageSize());
        return songSheetList.subList(start,end);
    }

    public List<SongSheet> findMyConlection(Integer id) {
        return songSheetRepository.findAllByUserId(id);
    }

    public void insertSheet(SongSheet songSheet) {
        songSheetRepository.save(songSheet);
    }

    public List<SongSheet> findByCreateId(Integer id) {
        return songSheetRepository.findByCreateId(id);
    }

    public List<SongSheet> findByLabelsLike(String label) {
        Pageable pageable = PageRequest.of(0, 6);
        List<SongSheet> songSheetList = songSheetRepository.findByLabelsLike("%" + label + "%");
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > songSheetList.size() ? songSheetList.size() : (start + pageable.getPageSize());
        return songSheetList.subList(start,end);
    }
}
