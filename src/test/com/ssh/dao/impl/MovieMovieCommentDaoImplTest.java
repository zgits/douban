package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.Movie_CommentDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
public class MovieMovieCommentDaoImplTest extends BaseTest{

    @Autowired
    private Movie_CommentDao movieCommentDao;

    @Test
    public void insertComment() throws Exception {
    }

    @Test
    public void findComment() throws Exception {
    }

    @Test
    public void deleteComment() throws Exception {

        movieCommentDao.deleteComment(1);

    }

}