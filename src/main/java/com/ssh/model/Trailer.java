package com.ssh.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 预告片
 */
@Entity
@Table(name="trailer")
public class Trailer {

    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name="id")
    private Integer id;//自增id

    @Column(name="movieId")
    private Integer movieId;//对应的电影id

    @Column(name="path")
    private String path;//预告片播放地址

    @Column(name="name")
    private String name;//预告片的名字

    @Column(name="number")
    private Integer number;//预告片的播放量，用来判断预告片的排名所用

    @Column(name="time")
    private Date time;//预告片上传时间

    @OneToMany
    private List<Comment> Comments;//预告片下的评论集合

    @OneToMany
    private List<Image> Images;//预告片对应的图片

    public List<Comment> getComments() {
        return Comments;
    }

    public void setComments(List<Comment> Comments) {
        this.Comments = Comments;
    }

    @Override
    public String toString() {
        return "Trailer{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", path='" + path + '\'' +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", time=" + time +
                ", Comments=" + Comments +
                ", Images=" + Images +
                '}';
    }

    public List<Image> getImages() {
        return Images;
    }

    public void setImages(List<Image> Images) {
        this.Images = Images;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


}
