package com.ssh.dao;

import com.ssh.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/17.
 */
public class MovieDaoTest extends BaseTest{

    @Autowired
    private MovieDao movieDao;
    @Test
    public void selectMovieById() throws Exception {
        System.out.println(movieDao.selectMovieById(1));
    }

}