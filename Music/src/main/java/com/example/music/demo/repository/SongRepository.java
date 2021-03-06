package com.example.music.demo.repository;

import com.example.music.demo.entity.Comment;
import com.example.music.demo.entity.Song;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.repository
 * @ClassName: SongRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 10:11
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 10:11
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface SongRepository extends JpaRepository<Song, Integer>,
        JpaSpecificationExecutor<Song> {
    @Query(nativeQuery = true, value = "select  c.* from song c,info b " +
            "where c.song_id = b.song_id and c.is_online!=0 order by b.info_plays desc  ")
    public List<Song> getMorePlays();
    @Query(nativeQuery = true, value = "select * from song c where c.is_online!=0 order by " +
            "c.song_release desc limit 36")
    public List<Song> getNewMusics();
    @Query(nativeQuery = true, value = "select  c.* from song c,info b " +
            "where c.song_id = b.song_id and c.is_online!=0 order by b.info_search desc ")
    public List<Song> getHotSearchMusics();
    @Query(nativeQuery = true, value = "select  c.* from song c,info b" +
            " where c.song_id = b.song_id and c.is_online!=0 order by b.info_down desc ")
    public List<Song> getMoreDownMusics();
    @Query(nativeQuery = true, value = "select  c.* from song c,info b " +
            "where c.song_id = b.song_id and c.is_online!=0 order by b.info_plays")
    public List<Song> getSongPage();
    @Query(nativeQuery = true, value = "select * from song  c where " +
            "c.song_singer=:singerId and c.is_online!=0 ")
    public List<Song> findAllBySingerId(Integer singerId);
    public List<Song> findAllBySongLabelLikeAndIsOnlineNot(String lebel,Integer flag);
    public List<Song> findAllBySongLanguagesAndIsOnlineNot(String language,Integer flag);
    public List<Song> findAllBySongIdIsInAndIsOnlineNot(Integer[] ids,Integer flag);
}
