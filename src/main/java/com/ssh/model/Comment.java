package com.ssh.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 评论电影的bean
 */
@Entity
@Table(name="comment")
public class Comment {

    @GeneratedValue(strategy=GenerationType.AUTO)
    @Id
    @Column(name="id")
    private Integer id;//自增id

    @Column(name="userId")
    private Integer userId;//对应用户表的id

     /**从这里开始是针对电影的评论**/
    @Column(name="score")
    private float score;//用户评论的分数

    @Column(name="number")
    private Integer number;//该条评论的赞数

    @Column(name="movieId")
    private Integer movieId;//对应的电影id

     /**针对电影的到这里结束,后面的评论内容是有共性的**/
    @Column(name="content")
    private String content;//用户评论的内容

    @Column(name="trailerId")
    private Integer trailerId;//对应的预告片id，

    @Column(name="time")
    private Date time;//评论的时间

//    @OneToMany(targetEntity = Replycomment.class)
//    private List<Replycomment> Replycomments;//评论的回复的集合

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", score=" + score +
                ", number=" + number +
                ", movieId=" + movieId +
                ", content='" + content + '\'' +
                ", trailerId=" + trailerId +
                ", time=" + time +
//                ", Replycomments=" + Replycomments +
                '}';
    }

    public Integer getTrailerId() {
        return trailerId;
    }

    public void setTrailerId(Integer trailerId) {
        this.trailerId = trailerId;
    }

//    public List<Replycomment> getReplycomments() {
//        return Replycomments;
//    }

//    public void setReplycomments(List<Replycomment> Replycomments) {
//        this.Replycomments = Replycomments;
//    }

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

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }
}
