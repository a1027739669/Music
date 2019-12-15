package com.example.music.demo.repository;

import com.example.music.demo.entity.Album;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: AlbumRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/15 16:03
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/15 16:03
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface AlbumRepository extends JpaRepository<Album, Integer> {
    @Query(nativeQuery = true, value = "select * from album c " +
            "order by c.album_release desc limit 10")
    public List<Album> getNewAlbums();
    @Query(nativeQuery = true, value = "select * from album c " +
            "where c.album_singer =:singerId order by c.album_release" +
            " desc limit 5")
    public List<Album> findAllByAlbum_singer(Integer singerId);
    public List<Album> findByLabelsLike(String label);
    public Album findAlbumByAlbumId(Integer albumId);
    @Query(nativeQuery = true, value = "select * from album c " +
            "where c.album_singer =:singerId order by c.album_release" +
            " desc limit 7")
    public List<Album> findAllByAlbum_singer2(Integer singerId);
    public List<Album> findAllByAlbumNameLike(String name);
}
