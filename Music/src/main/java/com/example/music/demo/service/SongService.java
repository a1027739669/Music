package com.example.music.demo.service;

import com.example.music.demo.entity.Song;
import com.example.music.demo.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

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
    public Song getOneDetail(Integer id){
        return songRepository.getOne(id);
    }

}
