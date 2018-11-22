package com.ssh.model;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 电影
 */
public class movie {

    private int id;//自增id

    private String moviename;//电影名字

    private float filmscore;//电影评分

    private String plot_introduction;//剧情简介，可能长度不够

    private int length;//电影时长

    private String director;//导演

    private String actor;//演员，有多个演员，因为演员这个字符串没什么用，就放在一起，可能长度不够

    private String language;//语言种类

    private String region;//制片地区

    private Date release_time;//上映时间

    private String release_region;//上映地区

    private List<comment> comments;//评论内容

    private List<image> images;//电影的海报，图片之类的

    private List<trailer> trailers;//电影对应的预告片

    private List<label> labels;//对应的标签集合

    @Override
    public String toString() {
        return "movie{" +
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
                ", comments=" + comments +
                ", images=" + images +
                ", trailers=" + trailers +
                ", labels=" + labels +
                '}';
    }

    public List<label> getLabels() {
        return labels;
    }

    public void setLabels(List<label> labels) {
        this.labels = labels;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
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

    public List<comment> getComments() {
        return comments;
    }

    public void setComments(List<comment> comments) {
        this.comments = comments;
    }

    public List<image> getImages() {
        return images;
    }

    public void setImages(List<image> images) {
        this.images = images;
    }

    public List<trailer> getTrailers() {
        return trailers;
    }

    public void setTrailers(List<trailer> trailers) {
        this.trailers = trailers;
    }
}
