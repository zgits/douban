package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
public class labelmapping {

    private int id;//自增id

    private int movieId;//对应的电影id

    private int labelId;//对应的标签id

    @Override
    public String toString() {
        return "labelmapping{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", labelId=" + labelId +
                '}';
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

    public int getLabelId() {
        return labelId;
    }

    public void setLabelId(int labelId) {
        this.labelId = labelId;
    }
}
