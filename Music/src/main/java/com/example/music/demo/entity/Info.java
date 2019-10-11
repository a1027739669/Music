package com.example.music.demo.entity;

import javax.persistence.*;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.entity
 * @ClassName: Info
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 10:11
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 10:11
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Table(name = "info")
public class Info {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer info_id;
    private Integer info_plays;
    private Integer info_search;
    private Integer info_down;
    private Integer song_id;

    public Integer getInfo_id() {
        return info_id;
    }

    public void setInfo_id(Integer info_id) {
        this.info_id = info_id;
    }

    public Integer getInfo_plays() {
        return info_plays;
    }

    public void setInfo_plays(Integer info_plays) {
        this.info_plays = info_plays;
    }

    public Integer getInfo_search() {
        return info_search;
    }

    public void setInfo_search(Integer info_search) {
        this.info_search = info_search;
    }

    public Integer getInfo_down() {
        return info_down;
    }

    public void setInfo_down(Integer info_down) {
        this.info_down = info_down;
    }

    public Integer getSong_id() {
        return song_id;
    }

    public void setSong_id(Integer song_id) {
        this.song_id = song_id;
    }
}
