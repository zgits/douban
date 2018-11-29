package com.ssh.service;

import com.ssh.model.Movie_Comment;
import com.ssh.model.PageBean;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
public interface Movie_CommentService {

    /**
     * 插入评论的信息
     * @param movieComment
     * @return
     */
    public boolean insertComment(Movie_Comment movieComment);

    /**
     * 查询到电影评论的相关评论
     * @param movieId
     * @return
     */
    public PageBean<Movie_Comment> findComment(int movieId,Integer currPage);

    /**
     * 根据id删除某个用户的评论
     * @param id
     * @return
     */
    public boolean deleteComment(int id);
}
