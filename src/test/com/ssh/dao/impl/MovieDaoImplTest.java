package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.MovieDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/12.
 */
public class MovieDaoImplTest extends BaseTest{
    @Test
    public void selectMovieById() throws Exception {

    }

    @Test
    public void getAllMovieName() throws Exception {
        System.out.println(movieDao.getAllMovieName().get(0)[1]);
    }

    @Autowired
    private MovieDao movieDao;
    @Test
    public void getMovieNameById() throws Exception {

        System.out.println(movieDao.getMovieNameById(1));
    }

    @Test
    public void selectAllMovie() throws Exception {
    }

}