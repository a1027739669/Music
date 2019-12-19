package com.example.music.demo.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


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
    private static final Long serialVersionUID = 21464638383509887L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer songId;
    private String song_name;
    private Integer songSinger;
    private String song_time;
    private String songLanguages;
    @Temporal(TemporalType.DATE)
    private Date song_release;
    private String song_img;
    private String song_lyrics;
    private String song_file;
    private Integer album_id;
    private Integer isOnline;
    private String songLabel;

    @OneToOne(mappedBy = "song")
    private Info info;

    @ManyToOne(targetEntity = Album.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "album_id", insertable = false, updatable = false)
    @JsonIgnore
    private Album album;
    @ManyToOne(targetEntity = Singer.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "songSinger", insertable = false, updatable = false)
    private Singer singer;
    @Transient
    private Integer totalComNum;
}
