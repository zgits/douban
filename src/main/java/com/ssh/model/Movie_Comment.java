package com.ssh.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 评论电影的bean
 */
@Entity
@Table(name="movie_comment")
public class Movie_Comment {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="userId",columnDefinition="integer(5) COMMENT '对应用户表的id'")
    private Integer userId;//对应用户表的id

    @Column(name="username",columnDefinition="varchar(255) COMMENT '对应用户表的名字'")
    private String username;

    @Column(name="score",columnDefinition="integer(2) COMMENT '用户评论的分数'")
    private Integer score;//用户评论的分数


    @Column(name="movieId",columnDefinition="integer(5) COMMENT '对应的电影id'")
    private Integer movieId;//对应的电影id

    @Column(name="content",columnDefinition="varchar(255) COMMENT '用户评论的内容'")
    private String content;//用户评论的内容

    @Column(name="time",columnDefinition="datetime COMMENT '评论的时间'")
    private Date time;//评论的时间

    @OneToMany(targetEntity = Movie_Replycomment.class,mappedBy = "comment_id")
    private List<Movie_Replycomment> movieReplycomments;//评论的回复的集合

    @Override
    public String toString() {
        return "Movie_Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", score=" + score +
                ", movieId=" + movieId +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", movieReplycomments=" + movieReplycomments +
                '}';
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Movie_Replycomment> getMovieReplycomments() {
        return movieReplycomments;
    }

    public void setMovieReplycomments(List<Movie_Replycomment> movieReplycomments) {
        this.movieReplycomments = movieReplycomments;
    }



    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }
}
