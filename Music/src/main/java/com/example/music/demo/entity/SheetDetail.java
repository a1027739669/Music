package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: SheetDetail
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/22 19:12
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/22 19:12
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "sheetdetail")
public class SheetDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer songId;
    private Integer sheetId;
    @ManyToOne(targetEntity = Song.class,fetch = FetchType.LAZY)
    @JoinColumn(name="songId",insertable = false,updatable = false,referencedColumnName="song_id")
    @JsonIgnore
    private Song song;
}
