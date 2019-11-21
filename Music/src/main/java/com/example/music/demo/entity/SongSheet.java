package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.validator.constraints.EAN;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
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
public class SongSheet  implements Serializable {
    private static final Long serialVersionUID = 24646383756924598L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String sheetName;
    private Integer userId;
    private Float support;
    @Temporal(TemporalType.DATE)
    private Date createDate;
    private String introduction;
    private Integer createId;
    private Integer isShare;
    private String sheetImg;
    private Integer playCount;
    @OneToMany(targetEntity = SheetDetail.class,cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy ="songSheet")
    public List<SheetDetail> details;
    @ManyToOne(targetEntity = User.class,fetch = FetchType.EAGER)
    @JoinColumn(name="createId",insertable = false,updatable = false,referencedColumnName="id")
    @JsonIgnore
    private User user;
}
