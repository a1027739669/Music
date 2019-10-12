package com.example.music.demo.entity;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: SongAndDyna
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 20:05
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 20:05
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */

@Data
@Entity
@JsonSerialize
@AllArgsConstructor
public class SongAndDyna implements Serializable {
    @Id
    private Integer song_id;
    private String song_name;
    private String song_singer;
    private String song_time;
    private String song_album;
    private String song_languages;
    private String song_type;
    private String song_release;
    private String song_img;
    private String song_lyrics;
    private String song_file;
    private Integer label_id;
    private Integer album_id;
    private Integer info_id;
    private Integer info_plays;
    private Integer info_search;
    private Integer info_down;

    public SongAndDyna() {
    }
}
