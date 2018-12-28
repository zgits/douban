package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 用户bean
 */
public class UserLogin {

    private int id;//自增id

    private String username;//用户名

    private String password;//密码

    private String email;//用户邮箱

    private String head_image;//头像地址

    private String person_profile;//个人简介

    //private List<tips_message> tips_messages;//提醒消息集合


    @Override
    public String toString() {
        return "user{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", head_image='" + head_image + '\'' +
                ", person_profile='" + person_profile + '\'' +
                '}';
    }

/*    public List<tips_message> getTips_messages() {
        return tips_messages;
    }

    public void setTips_messages(List<tips_message> tips_messages) {
        this.tips_messages = tips_messages;
    }*/


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
