package com.ssh.service.impl;

import com.ssh.dao.CommentDao;
import com.ssh.model.Comment;
import com.ssh.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
@Service("CommentService")
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentDao commentDao;

    @Override
    public boolean insertComment(Comment comment) {
        comment.setTime(new Date());
        return commentDao.insertComment(comment);
    }

    @Override
    public List<Comment> findComment(int movieId, int trailerId) {
        return null;
    }

    @Override
    public boolean deleteComment(int id) {
        return commentDao.deleteComment(id);
    }
}
