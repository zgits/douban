package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 电影和预告片的图片
 */
public class image {

    private int id;//自增id

    private int movieId;//对应的电影id，可以为空

    //取消了上传预告片图片的功能，改为了从后台截取视频的图片传到前端。

    private String path;//保存图片的地址

    @Override
    public String toString() {
        return "image{" +
                "id=" + id +
                ", movieId=" + movieId +
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


    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
