package com.ssh.dao;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */

import com.ssh.model.Movie_Comment;

import java.util.List;

/**
 * 评论功能的数据库接口
 */
public interface Movie_CommentDao {

    /**
     * 插入评论的信息
     * @param movieComment
     * @return
     */
    public boolean insertComment(Movie_Comment movieComment);

    /**
     * 查询到电影或者评论的相关评论
     * @param movieId
     * @return
     */
    public List<Movie_Comment> findComment(Integer movieId,int begin,int pageSize);

    /**
     * 得到某条电影评论的数量
     * @param movieId
     * @return
     */
    public Integer getCountComment(Integer movieId);

    /**
     * 根据id删除某个用户的评论
     * @param id
     * @return
     */
    public boolean deleteComment(int id);
}
