package com.ssh.model;

import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * <p>
 * 提示消息
 */
public class Tips_message {

    private Integer id;//自增id

    private Integer userId;//对应用户表的id，接收者的id

    private String message;//消息内容

    private Integer message_status;//消息状态，1，未读，2，已读

    private String sender;//发送人的名字，用户或者系统

    private Date time;//消息的时间

    @Override
    public String toString() {
        return "Tips_message{" +
                "id=" + id +
                ", userId=" + userId +
                ", message='" + message + '\'' +
                ", message_status=" + message_status +
                ", sender='" + sender + '\'' +
                ", time=" + time +
                '}';
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getMessage_status() {
        return message_status;
    }

    public void setMessage_status(Integer message_status) {
        this.message_status = message_status;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
