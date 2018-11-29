package com.ssh.model;


import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 用户bean
 */
@Entity
@Table(name="user")
public class User {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="username",columnDefinition="varchar(255) COMMENT '用户名'")
    private String username;//用户名

    @Column(name="password",columnDefinition="varchar(255) COMMENT '密码'")
    private String password;//密码

    @Column(name="email",columnDefinition="varchar(255) COMMENT '用户邮箱'")
    private String email;//用户邮箱

    @Column(name="head_image",columnDefinition="varchar(255) COMMENT '头像地址'")
    private String head_image;//头像地址

    @Column(name="person_profile",columnDefinition="varchar(255) COMMENT '个人简介'")
    private String person_profile;//个人简介

    @Column(name="last_login",columnDefinition="datetime COMMENT '登录时间，每次登录更新一次'")
    private Date last_login;//登录时间，每次登录更新一次

    @Column(name="days",columnDefinition="integer(5) COMMENT '禁言天数'")
    private Integer days;//禁言天数

    @Column(name="startTime",columnDefinition="datetime COMMENT '禁言开始时间'")
    private Date startTime;//禁言开始时间

    @Column(name="endTime",columnDefinition="datetime COMMENT '禁言结束时间'")
    private Date endTime;//禁言结束时间

    @OneToMany(targetEntity = Tips_message.class,mappedBy = "userId")
    private List<Tips_message> Tips_messages;//提醒消息集合

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", head_image='" + head_image + '\'' +
                ", person_profile='" + person_profile + '\'' +
                ", last_login=" + last_login +
                ", days=" + days +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", Tips_messages=" + Tips_messages +
                '}';
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
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

    public Date getLast_login() {
        return last_login;
    }

    public void setLast_login(Date last_login) {
        this.last_login = last_login;
    }


    public List<Tips_message> getTips_messages() {
        return Tips_messages;
    }

    public void setTips_messages(List<Tips_message> Tips_messages) {
        this.Tips_messages = Tips_messages;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHead_image() {
        return head_image;
    }

    public void setHead_image(String head_image) {
        this.head_image = head_image;
    }

    public String getPerson_profile() {
        return person_profile;
    }

    public void setPerson_profile(String person_profile) {
        this.person_profile = person_profile;
    }

}
