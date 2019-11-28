package com.example.music.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: Singer
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/11/8 20:40
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/11/8 20:40
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Data
@Entity
@Table(name = "singer")
public class Singer implements Serializable {
    private static final Long serialVersionUID = 214646383835244321L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String singerName;
    @Temporal(TemporalType.DATE)
    private Date birthday;
    private String introduction;
    private String country;
    private String singerImg;
    private String sex;
    private String labels;
    private Integer support;
    @Transient
    private Integer totalSongs;
    @Transient
    private Integer totalAlbums;
}
