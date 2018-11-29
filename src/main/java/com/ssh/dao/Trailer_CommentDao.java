package com.ssh.dao;

import com.ssh.model.Trailer_Comment;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public interface Trailer_CommentDao {


    /**
     * 插入评论的信息
     * @param trailer_comment
     * @return
     */
    public boolean insertComment(Trailer_Comment trailer_comment);

    /**
     * 查询到预告片的评论
     * @param trailerId
     * @param begin
     * @param pageSize
     * @return
     */
    public List<Trailer_Comment> findComment(Integer trailerId, int begin, int pageSize);

    /**
     * 得到某条预告片评论的数量
     * @param trailerId
     * @return
     */
    public Integer getCountComment(Integer trailerId);

    /**
     * 根据id删除某个用户的评论
     * @param id
     * @return
     */
    public boolean deleteComment(int id);
}
