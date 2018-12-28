package com.ssh.model;

import javax.persistence.*;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Entity
@Table(name="labelmapping")
public class Labelmapping {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="movieId",columnDefinition="integer(5) COMMENT '对应的电影id'")
    private Integer movieId;//对应的电影id

    @Column(name="labelId",columnDefinition="integer(5) COMMENT '对应的标签id'")
    private Integer labelId;//对应的标签id


    @Column(name="labelName",columnDefinition = "varchar(255) COMMENT '对应的标签名字'")
    private String labelName;//对应的标签名字

    @Override
    public String toString() {
        return "Labelmapping{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", labelId=" + labelId +
                ", labelName='" + labelName + '\'' +
                '}';
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

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }
}
