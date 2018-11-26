package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 分类，电影的分类
 */
public class Label {

    private int id;//自增id

    private String name;//标签的名字

    private int parentId;//对应的父标签id

    private int level;//标签的级别

    @Override
    public String toString() {
        return "Label{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", level=" + level +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
