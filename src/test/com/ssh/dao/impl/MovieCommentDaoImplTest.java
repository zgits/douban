package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.Movie_CommentDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/30.
 */
public class MovieCommentDaoImplTest extends BaseTest{
    @Test
    public void getMovieIdById() throws Exception {
        System.out.println(movie_commentDao.getMovieIdById(18));
    }

    @Autowired
    private Movie_CommentDao movie_commentDao;
    @Test
    public void getAvgScore() throws Exception {
        System.out.println(movie_commentDao.getAvgScore(1));
    }

}