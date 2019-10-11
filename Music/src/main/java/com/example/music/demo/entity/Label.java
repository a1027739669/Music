package com.example.music.demo.entity;

import javax.persistence.*;

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
@Table(name = "label")
public class Label {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer label_id;
    private String label_name;

    public Integer getLabel_id() {
        return label_id;
    }

    public void setLabel_id(Integer label_id) {
        this.label_id = label_id;
    }

    public String getLabel_name() {
        return label_name;
    }

    public void setLabel_name(String label_name) {
        this.label_name = label_name;
    }
}
