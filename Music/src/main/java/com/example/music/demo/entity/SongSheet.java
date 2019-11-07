package com.example.music.demo.entity;

import lombok.Data;
import org.hibernate.validator.constraints.EAN;

import javax.persistence.*;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: SongSheet
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/22 19:07
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/22 19:07
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "songsheet")
public class SongSheet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer sheetId;
    private String sheetName;
    private Integer userId;
    private Integer support;
    private String createDate;
    private String introduction;
    private Integer createId;
    private Integer isShare;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "sheet_to_sheetdetail",joinColumns = {@JoinColumn(name = "sheetId")},inverseJoinColumns = {@JoinColumn(name = "sheetId",insertable = false,updatable = false)})
    public List<SheetDetail> details;
    
}
