package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: SongClass
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/17 16:08
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/17 16:08
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "song_class")
public class SongClass implements Serializable {
    private static final Long serialVersionUID = 246463837566585098L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer labelId;
    private Integer songId;
    private Integer songType;
    @ManyToOne(targetEntity = Label.class,fetch = FetchType.LAZY)
    @JoinColumn(name="labelId",insertable = false,updatable = false,referencedColumnName="id")
    @JsonIgnore
    private Label label;
    @ManyToOne(targetEntity = Song.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name="songId",insertable = false,updatable = false,referencedColumnName="song_id")
    @JsonIgnore
    private Song song;
}
