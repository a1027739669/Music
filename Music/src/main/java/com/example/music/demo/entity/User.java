package com.example.music.demo.entity;

import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: User
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 18:29
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 18:29
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "myuser")
@DynamicUpdate
public class User  implements Serializable {
    private static final Long serialVersionUID = 2464097246924598L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String user_image;
    private String username;
    private String password;
    @Temporal(TemporalType.TIMESTAMP)
    private Date last_login;
    private String introduction;
    private Integer is_super;
    private String nicheng;
    private String email;
    @Temporal(TemporalType.DATE)
    private Date create_date;
    private String mobile;
    private String user_qq;
    private String user_wechat;
    private Integer isAlive;
    private Integer reported;
    private String userSex;
    @OneToMany(targetEntity = UserCollection.class,cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,mappedBy ="user")
    public List<UserCollection> userCollections;
}
