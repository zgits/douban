package com.ssh.model;

import javax.persistence.*;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Entity
@Table(name="labelmapping")
public class Labelmapping {

    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name="id")
    private Integer id;//自增id

    @Column(name="movieId")
    private Integer movieId;//对应的电影id

    @Column(name="labelId")
    private Integer labelId;//对应的标签id

    @Override
    public String toString() {
        return "Labelmapping{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", labelId=" + labelId +
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
}
