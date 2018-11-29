package com.ssh.service;

import com.ssh.model.PageBean;
import com.ssh.model.Trailer_Comment;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public interface Trailer_CommentService {


    /**
     * 插入评论的信息
     * @param trailer_comment
     * @return
     */
    public boolean insertComment(Trailer_Comment trailer_comment);

    /**
     * 查询预告片的相关评论
     * @param trailerId
     * @param currPage
     * @return
     */
    public PageBean<Trailer_Comment> findComment(int trailerId, Integer currPage);

    /**
     * 根据id删除某个用户的评论
     * @param id
     * @return
     */
    public boolean deleteComment(int id);
}
