package com.ssh.dao;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */

import com.ssh.model.Comment;

import java.util.List;

/**
 * 评论功能的数据库接口
 */
public interface CommentDao {

    /**
     * 插入评论的信息
     * @param comment
     * @return
     */
    public boolean insertComment(Comment comment);

    /**
     * 查询到电影或者评论的相关评论
     * @param movieId
     * @param trailerId
     * @return
     */
    public List<Comment> findComment(int movieId,int trailerId);

    /**
     * 根据id删除某个用户的评论
     * @param id
     * @return
     */
    public boolean deleteComment(int id);
}
