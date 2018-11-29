package com.ssh.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * <p>
 * 提示消息
 */
@Entity
@Table(name="tips_message")
public class Tips_message {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="userId",columnDefinition="integer(5) COMMENT '对应用户表的id，接收者的id'")
    private Integer userId;//对应用户表的id，接收者的id

    @Column(name="message",columnDefinition="varchar(255) COMMENT '消息内容'")
    private String message;//消息内容

    @Column(name="message_status",columnDefinition="integer(1) COMMENT '消息状态，1，未读，2，已读'")
    private Integer message_status;//消息状态，1，未读，2，已读

    @Column(name="sender",columnDefinition="varchar(255) COMMENT '发送人的名字，用户或者系统'")
    private String sender;//发送人的名字，用户或者系统

    @Column(name="time",columnDefinition="datetime COMMENT '消息的时间'")
    private Date time;//消息的时间

    @Override
    public String toString() {
        return "Tips_messageDao{" +
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
