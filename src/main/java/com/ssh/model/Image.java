package com.ssh.model;

import javax.persistence.*;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 电影和预告片的图片
 */
@Entity
@Table(name="image")
public class Image {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="movieId",columnDefinition="integer(5) COMMENT '对应的电影id'")
    private Integer movieId;//对应的电影id

    //取消了上传预告片图片的功能，改为了从后台截取视频的图片传到前端。

    @Column(name="path",columnDefinition="varchar(255) COMMENT '保存图片的地址'")
    private String path;//保存图片的地址

    @Column(name="imagename",columnDefinition="varchar(255) COMMENT '图片的文件名字'")
    private String imageName;//图片的文件名字

    @Column(name="name",columnDefinition = "varchar(255) COMMENT '图片的实际名字'")
    private String name;//图片的名字

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", path='" + path + '\'' +
                ", imageName='" + imageName + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
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
}
