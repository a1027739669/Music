package com.example.music.demo.entity;


import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * @ProjectName: MusicPro
 * @Package: com.example.music.demo.entity
 * @ClassName: Comment
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/16 11:35
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/16 11:35
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "comment")
public class Comment implements Serializable {
    private static final Long serialVersionUID=2141253325246858568L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer comment_id;
    private String comment_text;
    private Integer comment_user;
    @Temporal(TemporalType.DATE)
    private Date commentDate;
    private Integer songId;
    private Integer support;
    @ManyToOne(targetEntity = User.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "comment_user",insertable = false,updatable = false,referencedColumnName = "id")
    private User user;

}
