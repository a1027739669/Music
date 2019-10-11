package com.example.music.demo.service;

import com.example.music.demo.entity.Label;
import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.LabelRepository;
import com.example.music.demo.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List<Song> getSongWithHot(){
        return songRepository.getMorePlays();
    }
    public List<Label> getAllLabel(){
        return labelRepository.findAll();
    }
}
