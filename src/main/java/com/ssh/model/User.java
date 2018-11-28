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

    @GeneratedValue(strategy= GenerationType.AUTO)
    @Id
    @Column(name="id")
    private Integer id;//自增id

    @Column(name="username")
    private String username;//用户名

    @Column(name="password")
    private String password;//密码

    @Column(name="email")
    private String email;//用户邮箱

    @Column(name="head_image")
    private String head_image;//头像地址

    @Column(name="person_profile")
    private String person_profile;//个人简介

    @Column(name="last_login")
    private Date last_login;//登录时间，每次登录更新一次

    @OneToMany
    private List<Tips_message> Tips_messages;//提醒消息集合

    @OneToOne
    private UserStatus userStatus;//用户的状态

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
                ", Tips_messages=" + Tips_messages +
                ", userStatus=" + userStatus +
                '}';
    }

    public UserStatus getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(UserStatus userStatus) {
        this.userStatus = userStatus;
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
