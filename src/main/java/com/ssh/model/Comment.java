package com.ssh.model;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 评论电影的bean
 */
public class Comment {


    private int id;//自增id

    private int userId;//对应用户表的id

     /**从这里开始是针对电影的评论**/
    private float score;//用户评论的分数

    private int number;//该条评论的赞数

    private int movieId;//对应的电影id

     /**针对电影的到这里结束,后面的评论内容是有共性的**/

    private String content;//用户评论的内容

    private int trailerId;//对应的预告片id，

    private Date time;//评论的时间

    private List<Replycomment> Replycomments;//评论的回复的集合

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
                ", Replycomments=" + Replycomments +
                '}';
    }

    public int getTrailerId() {
        return trailerId;
    }

    public void setTrailerId(int trailerId) {
        this.trailerId = trailerId;
    }

    public List<Replycomment> getReplycomments() {
        return Replycomments;
    }

    public void setReplycomments(List<Replycomment> Replycomments) {
        this.Replycomments = Replycomments;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }
}
