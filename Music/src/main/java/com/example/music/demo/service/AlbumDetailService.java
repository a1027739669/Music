package com.example.music.demo.service;

import com.example.music.demo.entity.AlbumDetail;
import com.example.music.demo.repository.AlbumDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: AlbumDetailService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/26 14:12
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/26 14:12
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public class AlbumDetailService {
    @Autowired
    private AlbumDetailRepository albumDetailRepository;
    public void saveOnt(AlbumDetail albumDetail){
        albumDetailRepository.save(albumDetail);
    }
}
