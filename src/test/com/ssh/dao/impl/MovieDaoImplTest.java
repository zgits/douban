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
    public void selectMoving2() throws Exception {
        System.out.println(movieDao.selectMoving());
    }

    @Test
    public void selectMovieById() throws Exception {
     System.out.println(movieDao.getCommentScore(1));
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

//    @Test
//    public void selectMovieById() {
//    }

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