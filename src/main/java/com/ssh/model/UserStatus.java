package com.ssh.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/22.
 *
 * 用户的状态
 */
@Entity
@Table(name="userstatus")
public class UserStatus {

    private int id;//自增id

    private int userId;//对应用户表中的user的id

    private int days;//禁言天数

    private Date startTime;//禁言开始时间

    private Date endTime;//禁言结束时间


    @Override
    public String toString() {
        return "UserStatus{" +
                "id=" + id +
                ", userId=" + userId +
                ", days=" + days +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }

    @Basic
    @Column(name="days")
    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    @Id
    @Column(name="id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name="userId")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name="startTime")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Basic
    @Column(name="endTime")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
