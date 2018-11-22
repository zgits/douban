package com.ssh.model;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 预告片
 */
public class trailer {

    private int id;//自增id

    private int movieId;//对应的电影id

    private String path;//预告片播放地址

    private String name;//预告片的名字

    private int number;//预告片的播放量，用来判断预告片的排名所用

    private Date time;//预告片上传时间

    private List<comment> comments;//预告片下的评论集合

    private List<image> images;//预告片对应的图片

    public List<comment> getComments() {
        return comments;
    }

    public void setComments(List<comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "trailer{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", path='" + path + '\'' +
                ", name='" + name + '\'' +
                ", number=" + number +
                ", time=" + time +
                ", comments=" + comments +
                ", images=" + images +
                '}';
    }

    public List<image> getImages() {
        return images;
    }

    public void setImages(List<image> images) {
        this.images = images;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }


}
