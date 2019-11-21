package com.example.music.demo.service;

import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.repository.SongSheetRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
    public Integer getSize(){
        return songSheetRepository.findAll().size();
    }
    public List<SongSheet> getRandomSheet(List<Integer> numbers){
        return songSheetRepository.findByIdIn(numbers);
    }
    public SongSheet findById(Integer id){
        return songSheetRepository.findSongSheetById(id);
    }
}
