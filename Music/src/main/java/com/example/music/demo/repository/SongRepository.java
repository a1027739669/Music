package com.example.music.demo.repository;

import com.example.music.demo.entity.Song;
import com.example.music.demo.entity.SongAndDyna;
import org.springframework.data.jpa.repository.JpaRepository;
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
public interface SongRepository extends JpaRepository<Song,Integer> {
    @Query(nativeQuery = true,value = "select  c.* from song c,info b where c.song_id = b.song_id order by b.info_plays desc limit 10 ")
    public List<Song> getMorePlays();
    @Query(nativeQuery = true,value = "select * from song c order by c.song_release desc limit 3")
    public List<Song> getNewMusics();
    @Query(nativeQuery = true,value = "select  c.* from song c,info b where c.song_id = b.song_id order by b.info_search desc limit 6")
    public List<Song> getHotSearchMusics();
}
