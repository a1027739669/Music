package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.entity
 * @ClassName: Info
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 10:11
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 10:11
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Table(name = "info")
@Data
public class Info implements Serializable {
    private static final Long serialVersionUID=214125332523664767L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer info_id;
    private Integer info_plays;
    private Integer info_search;
    private Integer info_down;
    private Integer songId;

    @OneToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name = "songId", referencedColumnName = "songId",insertable = false,updatable =false)
    private Song song;

}
