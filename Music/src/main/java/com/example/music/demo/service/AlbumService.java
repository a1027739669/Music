package com.example.music.demo.service;

import com.example.music.demo.entity.Album;
import com.example.music.demo.entity.Singer;
import com.example.music.demo.entity.SongSheet;
import com.example.music.demo.repository.AlbumRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Comparator;
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

    public List<Album> getNewAlbums() {
        return albumRepository.getNewAlbums();
    }

    public List<Album> findAlbumBySingerId(Integer singerId) {
        return albumRepository.findAllByAlbum_singer(singerId);
    }

    public Page<Album> getAlbumList(Integer page, String category) {
        Pageable pageable = PageRequest.of(page - 1, 20);
        List<Album> albumList = albumRepository.findByLabelsLike("%" + category + "%");
        Collections.sort(albumList, new Comparator<Album>() {
            @Override
            public int compare(Album o1, Album o2) {
                return -o1.getAlbum_release().compareTo(o2.getAlbum_release());
            }
        });
        for (int i = albumList.size() -1; i >=0 ; i--) {
            if(albumList.get(i).getAlbumId().equals(1))
                albumList.remove(i);
        }
        int start = (int) pageable.getOffset();
        int end = (start + pageable.getPageSize()) > albumList.size() ? albumList.size() : (start + pageable.getPageSize());
        Page<Album> albums = new PageImpl<>(albumList.subList(start, end), pageable, albumList.size());
        return albums;
    }

    public Album findByAlbumId(Integer albumId){
        return albumRepository.findAlbumByAlbumId(albumId);
    }

    public List<Album> findOthers(Integer id) {
        return albumRepository.findAllByAlbum_singer2(id);
    }
}
