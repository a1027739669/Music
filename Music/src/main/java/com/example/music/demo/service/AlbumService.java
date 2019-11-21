package com.example.music.demo.service;

import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.repository.AlbumRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.service
 * @ClassName: AlbumService
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/15 16:04
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/15 16:04
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class AlbumService {
    @Autowired
    private AlbumRepository albumRepository;
    public List<Album> getNewAlbums(){
        return albumRepository.getNewAlbums();
    }
    public List<Album> findAlbumBySingerId(Integer singerId){
        return albumRepository.findAllByAlbum_singer(singerId);
    }
}
