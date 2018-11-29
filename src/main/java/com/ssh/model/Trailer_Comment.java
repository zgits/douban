package com.ssh.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Entity
@Table(name="trailer_comment")
public class Trailer_Comment {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id",columnDefinition="integer(5) COMMENT '自增id'")
    private Integer id;//自增id

    @Column(name="userId",columnDefinition="integer(5) COMMENT '对应用户表的id'")
    private Integer userId;//对应用户表的id

    @Column(name="trailerId",columnDefinition="integer(5) COMMENT '对应的预告片id'")
    private Integer trailerId;//对应的预告片id

    @Column(name="content",columnDefinition="varchar(255) COMMENT '用户评论的内容'")
    private String content;//用户评论的内容

    @Column(name="time",columnDefinition="datetime COMMENT '评论的时间'")
    private Date time;//评论的时间

    @OneToMany(targetEntity = Trailer_Replycomment.class,mappedBy = "comment_id")
    private List<Trailer_Replycomment> trailerReplycomments;//评论的回复的集合

    @Override
    public String toString() {
        return "Trailer_Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", trailerId=" + trailerId +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", trailerReplycomments=" + trailerReplycomments +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public Integer getTrailerId() {
        return trailerId;
    }

    public void setTrailerId(Integer trailerId) {
        this.trailerId = trailerId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public List<Trailer_Replycomment> getTrailerReplycomments() {
        return trailerReplycomments;
    }

    public void setTrailerReplycomments(List<Trailer_Replycomment> trailerReplycomments) {
        this.trailerReplycomments = trailerReplycomments;
    }
}
