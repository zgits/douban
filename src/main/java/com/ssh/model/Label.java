package com.ssh.model;

import javax.persistence.*;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * 分类，电影的分类
 */
@Entity
@Table(name="label")
public class Label {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="name",columnDefinition="varchar(255) COMMENT '标签的名字'")
    private String name;//标签的名字

    @Column(name="parentId",columnDefinition="integer(5) COMMENT '对应的父标签id'")
    private Integer parentId;//对应的父标签id

    @Column(name="level",columnDefinition="integer(5) COMMENT '标签的级别'")
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
