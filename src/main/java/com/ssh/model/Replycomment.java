package com.ssh.model;

import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/20.
 * <p>
 * 评论的回复
 */
public class Replycomment {

    private int id;//自增id

    private String content;//回复的内容

    private Date time;//回复的时间

    private int userId;//回复人的id，可以通过这个id查询到用户的其它信息

    private int to_userId;//回复的目标用户的id

    private int comment_id;//要回复评论的id

    private int reply_type;//回复的类型，因为回复可以是针对评论的回复(Comment),1来表示，也可以是针对回复的回复(reply)，2来表示， 通过这个字段来区分两种情景。

    private int reply_id;//回复目标的id，如果reply_type是comment的话，那么reply_id＝comment_id，如果reply_type是reply的话，这表示这条回复的父回复。

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTo_userId() {
        return to_userId;
    }

    public void setTo_userId(int to_userId) {
        this.to_userId = to_userId;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getReply_type() {
        return reply_type;
    }

    public void setReply_type(int reply_type) {
        this.reply_type = reply_type;
    }

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }
}
