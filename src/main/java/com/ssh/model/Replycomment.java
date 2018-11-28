package com.ssh.model;


import javax.persistence.*;
import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/20.
 * <p>
 * 评论的回复
 */
@Entity
@Table(name="replycomment")
public class Replycomment {

    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name="id")
    private Integer id;//自增id

    @Column(name="content")
    private String content;//回复的内容

    @Column(name="time")
    private Date time;//回复的时间

    @Column(name="userId")
    private Integer userId;//回复人的id，可以通过这个id查询到用户的其它信息

    @Column(name="to_userId")
    private Integer to_userId;//回复的目标用户的id

    @Column(name="comment_id")
    private Integer comment_id;//要回复评论的id

    @Column(name="reply_type")
    private Integer reply_type;//回复的类型，因为回复可以是针对评论的回复(Comment),1来表示，也可以是针对回复的回复(reply)，2来表示， 通过这个字段来区分两种情景。

    @Column(name="reply_id")
    private Integer reply_id;//回复目标的id，如果reply_type是comment的话，那么reply_id＝comment_id，如果reply_type是reply的话，这表示这条回复的父回复。

    @Override
    public String toString() {
        return "Replycomment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", userId=" + userId +
                ", to_userId=" + to_userId +
                ", comment_id=" + comment_id +
                ", reply_type=" + reply_type +
                ", reply_id=" + reply_id +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTo_userId() {
        return to_userId;
    }

    public void setTo_userId(Integer to_userId) {
        this.to_userId = to_userId;
    }

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public Integer getReply_type() {
        return reply_type;
    }

    public void setReply_type(Integer reply_type) {
        this.reply_type = reply_type;
    }

    public Integer getReply_id() {
        return reply_id;
    }

    public void setReply_id(Integer reply_id) {
        this.reply_id = reply_id;
    }
}
