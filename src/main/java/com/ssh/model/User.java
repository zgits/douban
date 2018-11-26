package com.ssh.model;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 用户bean
 */
public class User {

    private int id;//自增id

    private String username;//用户名

    private String password;//密码

    private String emial;//用户邮箱

    private String head_image;//头像地址

    private String person_profile;//个人简介

    private Date last_login;//登录时间，每次登录更新一次

    private List<Tips_message> Tips_messages;//提醒消息集合

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", emial='" + emial + '\'' +
                ", head_image='" + head_image + '\'' +
                ", person_profile='" + person_profile + '\'' +
                ", last_login=" + last_login +
                ", Tips_messages=" + Tips_messages +
                '}';
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


    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getEmial() {
        return emial;
    }

    public void setEmial(String emial) {
        this.emial = emial;
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
