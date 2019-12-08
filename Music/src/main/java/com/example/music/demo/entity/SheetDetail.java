package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

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
public class SheetDetail  implements Serializable {
    private static final Long serialVersionUID = 2146465325298825L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer songId;
    private Integer sheetId;
    @ManyToOne(cascade = CascadeType.ALL,targetEntity = Song.class,fetch = FetchType.EAGER)
    @JoinColumn(name="songId",insertable = false,updatable = false,referencedColumnName="songId")
    @JsonIgnore
    private Song song;
    @ManyToOne(targetEntity = SongSheet.class,fetch = FetchType.EAGER)
    @JoinColumn(name = "sheetId" , insertable = false, updatable = false, referencedColumnName = "id")
    private SongSheet songSheet;
}
