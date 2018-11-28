package com.ssh.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 电影
 */
@Entity
@Table(name="movie")
public class Movie {

    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name="id")
    private Integer id;//自增id

    @Column(name="moviename")
    private String moviename;//电影名字

    @Column(name="filmscore")
    private float filmscore;//电影评分

    @Column(name="plot_introduction")
    private String plot_introduction;//剧情简介

    @Column(name="length")
    private Integer length;//电影时长

    @Column(name="director")
    private String director;//导演

    @Column(name="actor")
    private String actor;//演员，有多个演员

    @Column(name="language")
    private String language;//语言种类

    @Column(name="region")
    private String region;//制片地区

    @Column(name="release_time")
    private Date release_time;//上映时间

    @Column(name="release_region")
    private String release_region;//上映地区

    @OneToMany
    private List<Comment> Comments;//评论内容

    @OneToMany
    private List<Image> Images;//电影的海报，图片之类的

    @OneToMany
    private List<Trailer> Trailers;//电影对应的预告片

    @OneToMany
    private List<Label> Labels;//对应的标签集合

    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", moviename='" + moviename + '\'' +
                ", filmscore=" + filmscore +
                ", plot_introduction='" + plot_introduction + '\'' +
                ", length=" + length +
                ", director='" + director + '\'' +
                ", actor='" + actor + '\'' +
                ", language='" + language + '\'' +
                ", region='" + region + '\'' +
                ", release_time=" + release_time +
                ", release_region='" + release_region + '\'' +
                ", Comments=" + Comments +
                ", Images=" + Images +
                ", Trailers=" + Trailers +
                ", Labels=" + Labels +
                '}';
    }

    public List<Label> getLabels() {
        return Labels;
    }

    public void setLabels(List<Label> Labels) {
        this.Labels = Labels;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMoviename() {
        return moviename;
    }

    public void setMoviename(String moviename) {
        this.moviename = moviename;
    }

    public float getFilmscore() {
        return filmscore;
    }

    public void setFilmscore(float filmscore) {
        this.filmscore = filmscore;
    }

    public String getPlot_introduction() {
        return plot_introduction;
    }

    public void setPlot_introduction(String plot_introduction) {
        this.plot_introduction = plot_introduction;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Date getRelease_time() {
        return release_time;
    }

    public void setRelease_time(Date release_time) {
        this.release_time = release_time;
    }

    public String getRelease_region() {
        return release_region;
    }

    public void setRelease_region(String release_region) {
        this.release_region = release_region;
    }

    public List<Comment> getComments() {
        return Comments;
    }

    public void setComments(List<Comment> Comments) {
        this.Comments = Comments;
    }

    public List<Image> getImages() {
        return Images;
    }

    public void setImages(List<Image> Images) {
        this.Images = Images;
    }

    public List<Trailer> getTrailers() {
        return Trailers;
    }

    public void setTrailers(List<Trailer> Trailers) {
        this.Trailers = Trailers;
    }
}
