package com.ssh.model;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 分类，电影的分类
 */
public class Label {

    private Integer id;//自增id

    private String name;//标签的名字

    private Integer parentId;//对应的父标签id

    private Integer level;//标签的级别

    @Override
    public String toString() {
        return "Label{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", level=" + level +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
