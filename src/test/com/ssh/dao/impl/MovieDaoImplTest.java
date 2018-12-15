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
    @Autowired
    private MovieDao movieDao;
    @Test
    public void  selectMoving(){
       System.out.println(movieDao.selectMoving());
    }

    @Test
    public void setSessionFactory0() {
    }

    @Test
    public void insertMovie() {
    }

    @Test
    public void deleteMovie() {
    }

    @Test
    public void updateMovie() {
    }

    @Test
    public void selectMovie() {
    }

    @Test
    public void getMovieCount() {
    }

    @Test
    public void selectMovieById() {
    }

    @Test
    public void selectMovieByName() {
    }

    @Test
    public void getMovieCountByName() {
    }

    @Test
    public void selectAllMovie() {
    }

    @Test
    public void selectMoving1() {
    }
}