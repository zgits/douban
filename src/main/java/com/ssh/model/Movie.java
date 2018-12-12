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

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="moviename",columnDefinition="varchar(255) COMMENT '电影名字'")
    private String moviename;//电影名字

    @Column(name="filmscore",columnDefinition=" float(3, 1) COMMENT '电影评分'")
    private Float filmscore;//电影评分

    @Column(name="plot_introduction",columnDefinition="varchar(255) COMMENT '剧情简介'")
    private String plot_introduction;//剧情简介

    @Column(name="length",columnDefinition="integer(5) COMMENT '电影时长'")
    private Integer length;//电影时长

    @Column(name="director",columnDefinition="varchar(255) COMMENT '导演'")
    private String director;//导演

    @Column(name="actor",columnDefinition="varchar(255) COMMENT '演员，有多个演员'")
    private String actor;//演员，有多个演员

    @Column(name="language",columnDefinition="varchar(255) COMMENT '语言种类'")
    private String language;//语言种类

    @Column(name="region",columnDefinition="varchar(255) COMMENT '制片地区'")
    private String region;//制片地区

    @Column(name="release_time",columnDefinition="datetime COMMENT '上映时间'")
    private Date release_time;//上映时间

    @Column(name="release_region",columnDefinition="varchar(255) COMMENT '上映地区'")
    private String release_region;//上映地区

    @OneToMany(targetEntity = Movie_Comment.class,mappedBy = "movieId")
    private List<Movie_Comment> movieComments;//评论内容

    @OneToMany(targetEntity = Image.class,mappedBy = "movieId")
    private List<Image> Images;//电影的海报，图片之类的

    @OneToMany(targetEntity = Trailer.class,mappedBy = "movieId")
    private List<Trailer> Trailers;//电影对应的预告片

    @OneToMany(targetEntity = Labelmapping.class,mappedBy = "movieId")
    private List<Labelmapping> labelmappings;//对应的标签集合

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
                ", movieComments=" + movieComments +
                ", Images=" + Images +
                ", Trailers=" + Trailers +
                ", labelmappings=" + labelmappings +
                '}';
    }



    public List<Labelmapping> getLabelmappings() {
        return labelmappings;
    }

    public void setLabelmappings(List<Labelmapping> labelmappings) {
        this.labelmappings = labelmappings;
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

    public Float getFilmscore() {
        return filmscore;
    }

    public void setFilmscore(Float filmscore) {
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

    public List<Movie_Comment> getMovieComments() {
        return movieComments;
    }

    public void setMovieComments(List<Movie_Comment> movieComments) {
        this.movieComments = movieComments;
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
