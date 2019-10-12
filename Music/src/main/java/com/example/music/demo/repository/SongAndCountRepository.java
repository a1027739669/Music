package com.example.music.demo.repository;

import com.example.music.demo.entity.SongAndDyna;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.repository
 * @ClassName: SongAndCountRepository
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 20:09
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 20:09
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public interface SongAndCountRepository extends JpaRepository<SongAndDyna, Integer> {
    @Query(value = "select  new com.example.music.demo.entity.SongAndDyna(c.song_id,c.song_name,c.song_singer,c.song_time,c.song_album,c.song_languages,c.song_type,c.song_release,c.song_img,c.song_lyrics,c.song_file,c.label_id,c.album_id,b.info_id,b.info_plays,b.info_search,b.info_down) from Song c,Info b where c.song_id = b.song_id order by b.info_search desc ")
    public List<SongAndDyna> getMoreSearchs(Pageable pageable);

    @Query(value = "select  new com.example.music.demo.entity.SongAndDyna(c.song_id,c.song_name,c.song_singer,c.song_time,c.song_album,c.song_languages,c.song_type,c.song_release,c.song_img,c.song_lyrics,c.song_file,c.label_id,c.album_id,b.info_id,b.info_plays,b.info_search,b.info_down) from Song c,Info b where c.song_id = b.song_id order by b.info_down desc ")
    public List<SongAndDyna> getMoreDowns(Pageable pageable);
}
