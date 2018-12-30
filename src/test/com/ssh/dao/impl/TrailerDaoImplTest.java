package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.TrailerDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/18.
 */
public class TrailerDaoImplTest extends BaseTest{
    @Test
    public void getAllTrailers() throws Exception {
        System.out.println(trailerDao.getAllTrailer());
    }

    @Autowired
    private TrailerDao trailerDao;
    @Test
    public void getMovieTrailers() throws Exception {
        System.out.println(trailerDao.getMovieTrailers(1));
    }

}