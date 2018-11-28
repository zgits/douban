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

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;//自增id

    @Column(name="userId")
    private int userId;//对应用户表中的user的id

    @Column(name="days")
    private int days;//禁言天数

    @Column(name="startTime")
    private Date startTime;//禁言开始时间

    @Column(name="endTime")
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



    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
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


    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }


    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
