package com.ssh.service.impl;

import com.ssh.dao.Movie_CommentDao;
import com.ssh.model.Movie_Comment;
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
    Movie_CommentDao movieCommentDao;

    @Override
    public boolean insertComment(Movie_Comment movieComment) {
        movieComment.setTime(new Date());
        return movieCommentDao.insertComment(movieComment);
    }

    @Override
    public List<Movie_Comment> findComment(int movieId, int trailerId) {
        return null;
    }

    @Override
    public boolean deleteComment(int id) {
        return movieCommentDao.deleteComment(id);
    }
}
