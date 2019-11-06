package com.example.music.demo.repository;

import com.example.music.demo.entity.Song;
import com.example.music.demo.entity.SongClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: SongClassRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/20 11:36
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/20 11:36
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Repository
public interface SongClassRepository extends JpaRepository<SongClass,Integer> {
    @Query(nativeQuery = true,value = "select  c.* from song_class c,info b where c.song_id = b.song_id and c.label_id=:labelId order by b.info_plays desc ")
    public List<SongClass> getSongPage(Integer labelId);
    @Query(nativeQuery = true,value = "select  c.* from song_class c,info b where c.song_id = b.song_id  order by b.info_plays desc ")
    public List<SongClass> getSongPageAll();
}
