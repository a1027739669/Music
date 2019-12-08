package com.example.music.demo.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: UserCollection
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/12/1 17:59
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/12/1 17:59
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "usercollection")
public class UserCollection {
    private static final Long serialVersionUID = 92542246924598L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer sheetId;
    private Integer userId;
    @ManyToOne(targetEntity = SongSheet.class,fetch = FetchType.EAGER)
    @JoinColumn(name="sheetId",insertable =false,updatable =false)
    @JsonIgnore
    private SongSheet songSheet;
    @ManyToOne(targetEntity = User.class,fetch = FetchType.EAGER)
    @JoinColumn(name = "userId" , insertable = false, updatable = false, referencedColumnName = "id")
    private User user;
}
