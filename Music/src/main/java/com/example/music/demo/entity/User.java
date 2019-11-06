package com.example.music.demo.entity;

import lombok.Data;

import javax.persistence.*;

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
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String user_image;
    private String username;
    private String password;
    private String last_login;
    private Integer is_super;
    private String nicheng;
    private String email;
    private String create_date;
    private String mobile;
    private String user_qq;
    private String user_wechat;
    private Integer isAlive;
}
