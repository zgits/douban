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

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="movieId",columnDefinition="integer(5) COMMENT '对应的电影id'")
    private Integer movieId;//对应的电影id

    @Column(name="path",columnDefinition="varchar(255) COMMENT '预告片播放地址'")
    private String path;//预告片播放地址

    @Column(name="name",columnDefinition="varchar(255) COMMENT '预告片的名字'")
    private String name;//预告片的名字

    @Column(name="filename",columnDefinition="varchar(255) COMMENT '文件名'")
    private String filename;

    @Column(name="number",columnDefinition="integer(5) COMMENT '预告片的播放量，用来判断预告片的排名所用'")
    private Integer number;//预告片的播放量，用来判断预告片的排名所用

    @Column(name="time",columnDefinition="datetime COMMENT '预告片上传时间'")
    private Date time;//预告片上传时间

    @Transient
    private Date release_time;//上映时间

    @Transient
    private List<Image> Images;//电影的海报，图片之类的


    /**
     * 为了查看方便，直接就封装了分页
     * 原来是List<Trailer_Comment>
     */
    @OneToMany(targetEntity = Trailer_Comment.class,mappedBy = "trailerId")
    private List<Trailer_Comment> trailerComments;//预告片下的评论集合

//    @OneToMany(targetEntity = Image.class,)
//    private List<Image> Images;//预告片对应的图片


    @Override
    public String toString() {
        return "Trailer{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", path='" + path + '\'' +
                ", name='" + name + '\'' +
                ", filename='" + filename + '\'' +
                ", number=" + number +
                ", time=" + time +
                ", release_time=" + release_time +
                ", Images=" + Images +
                ", trailerComments=" + trailerComments +
                '}';
    }
//    public List<Image> getImages() {
//        return Images;
//    }
//
//    public void setImages(List<Image> Images) {
//        this.Images = Images;
//    }


    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public List<Trailer_Comment> getTrailerComments() {
        return trailerComments;
    }

    public void setTrailerComments(List<Trailer_Comment> trailerComments) {
        this.trailerComments = trailerComments;
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
    public Date getRelease_time() {
        return release_time;
    }

    public void setRelease_time(Date release_time) {
        this.release_time = release_time;
    }

    public List<Image> getImages() {
        return Images;
    }

    public void setImages(List<Image> images) {
        Images = images;
    }


}
