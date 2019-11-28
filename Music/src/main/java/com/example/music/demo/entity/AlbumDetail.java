package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: AlbumDetail
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/26 14:06
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/26 14:06
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "albumdetail")
public class AlbumDetail implements Serializable {
    private static final Long serialVersionUID = 241465325298825L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer songId;
    private Integer albumId;
    @ManyToOne(cascade = CascadeType.ALL,targetEntity = Song.class,fetch = FetchType.EAGER)
    @JoinColumn(name="songId",insertable = false,updatable = false,referencedColumnName="song_id")
    @JsonIgnore
    private Song song;
    @ManyToOne(targetEntity = Album.class,fetch = FetchType.EAGER)
    @JoinColumn(name = "albumId" , insertable = false, updatable = false, referencedColumnName = "album_id")
    private Album album;
}
