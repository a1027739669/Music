package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: Album
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 14:13
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 14:13
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "album")
public class Album implements Serializable {
    private static final Long serialVersionUID=2141253325248708908L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer albumId;
    private String album_name;
    private String album_img;
    @Temporal(TemporalType.DATE)
    private Date album_release;
    private Integer album_singer;
    private String introduction;
    private String labels;
    @ManyToOne(targetEntity = Singer.class,fetch = FetchType.EAGER)
    @JoinColumn(name="album_singer",insertable =false,updatable =false)
    @JsonIgnore
    private Singer singer;
    @OneToMany(targetEntity = AlbumDetail.class,cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy ="album")
    public List<AlbumDetail> details;

}
