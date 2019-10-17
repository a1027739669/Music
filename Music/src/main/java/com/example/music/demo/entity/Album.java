package com.example.music.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

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
    private static final Long serialVersionUID=2141253325246858568L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer album_id;
    private String album_name;
    private String album_img;
    private String album_release;
    private String album_singer;
}
