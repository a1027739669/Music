package com.example.music.demo.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.mapping.FetchProfile;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.entity
 * @ClassName: Song
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 10:05
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 10:05
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Table(name = "song")
@Data
public class Song implements Serializable {
    private static final Long serialVersionUID = 214646383835L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    @OneToOne(fetch = FetchType.LAZY)
    @JoinTable(name = "Info", joinColumns = {@JoinColumn(name = "song_id")}, inverseJoinColumns = {@JoinColumn(name = "song_id")})
    private Info info;
    @ManyToOne(targetEntity = Album.class,fetch = FetchType.LAZY)
    @JoinColumn(name="album_id",insertable = false,updatable = false,referencedColumnName="album_id")
    @JsonIgnore
    private Album album;
}
