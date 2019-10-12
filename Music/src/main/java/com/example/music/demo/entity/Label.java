package com.example.music.demo.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.entity
 * @ClassName: Label
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 11:52
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 11:52
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Data
@Table(name = "label")
public class Label implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer label_id;
    private String label_name;


}
