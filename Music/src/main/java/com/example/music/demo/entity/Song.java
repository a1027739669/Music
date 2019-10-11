package com.example.music.demo.entity;



import javax.persistence.*;
import java.io.Serializable;

/**
 * @ProjectName: Music
 * @Package: com.example.music.demo.entity
 * @ClassName: Song
 * @Description: java类作用描述
 * @Author: 章宇翔
 * @CreateDate: 2019/10/11 10:05
 * @UpdateUser: 更新者
 * @UpdateDate: 2019/10/11 10:05
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Table(name = "song")
public class Song  implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer song_id;
    private String song_name;
    private String song_singer;
    private String song_time;
    private String song_album;
    private String song_languages;
    private String song_type;
    private String song_release;
    private String song_img;
    private String song_lyrics;
    private String song_file;
    private Integer label_id;
    private Integer album_id;

    public Integer getSong_id() {
        return song_id;
    }

    public void setSong_id(Integer song_id) {
        this.song_id = song_id;
    }

    public String getSong_name() {
        return song_name;
    }

    public void setSong_name(String song_name) {
        this.song_name = song_name;
    }

    public String getSong_singer() {
        return song_singer;
    }

    public void setSong_singer(String song_singer) {
        this.song_singer = song_singer;
    }

    public String getSong_time() {
        return song_time;
    }

    public void setSong_time(String song_time) {
        this.song_time = song_time;
    }

    public String getSong_album() {
        return song_album;
    }

    public void setSong_album(String song_album) {
        this.song_album = song_album;
    }

    public String getSong_languages() {
        return song_languages;
    }

    public void setSong_languages(String song_languages) {
        this.song_languages = song_languages;
    }

    public String getSong_type() {
        return song_type;
    }

    public void setSong_type(String song_type) {
        this.song_type = song_type;
    }

    public String getSong_release() {
        return song_release;
    }

    public void setSong_release(String song_release) {
        this.song_release = song_release;
    }

    public String getSong_img() {
        return song_img;
    }

    public void setSong_img(String song_img) {
        this.song_img = song_img;
    }

    public String getSong_lyrics() {
        return song_lyrics;
    }

    public void setSong_lyrics(String song_lyrics) {
        this.song_lyrics = song_lyrics;
    }

    public String getSong_file() {
        return song_file;
    }

    public void setSong_file(String song_file) {
        this.song_file = song_file;
    }

    public Integer getLabel_id() {
        return label_id;
    }

    public void setLabel_id(Integer label_id) {
        this.label_id = label_id;
    }

    public Integer getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(Integer album_id) {
        this.album_id = album_id;
    }
}
