package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 电影和预告片的图片
 */
public class image {

    private int id;//自增id

    private int movieId;//对应的电影id，可以为空

    private int trailerId;//对应的预告片id，可以为空，两个id分别对应电影和预告片，可以不是同一个id。

    String path;//保存图片的地址

    @Override
    public String toString() {
        return "image{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", trailerId=" + trailerId +
                ", path='" + path + '\'' +
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

    public int getTrailerId() {
        return trailerId;
    }

    public void setTrailerId(int trailerId) {
        this.trailerId = trailerId;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
