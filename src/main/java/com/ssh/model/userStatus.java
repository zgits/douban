package com.ssh.model;

import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/22.
 *
 * 用户的状态
 */
public class userStatus {

    private int id;//自增id

    private int userId;//对应用户表中的user的id

    private Date startTime;//禁言开始时间

    private Date endTime;//禁言结束时间

    @Override
    public String toString() {
        return "userStatus{" +
                "id=" + id +
                ", userId=" + userId +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
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
