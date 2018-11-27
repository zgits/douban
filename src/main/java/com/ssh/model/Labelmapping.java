package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
public class Labelmapping {

    private Integer id;//自增id

    private Integer movieId;//对应的电影id

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
