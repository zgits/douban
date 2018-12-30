package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.dao.TrailerDao;
import com.ssh.service.TrailerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class TrailerServiceImplTest extends BaseTest {
    @Autowired
    private TrailerService trailerService;

    @Test
    public void insertTrailer() {
        System.out.println(trailerService.addTrailerNum(5));
    }

    @Test
    public void deleteTrailer() {
    }

    @Test
    public void updateTrailer() {
    }

    @Test
    public void getMovieTrailers() {
    }

    @Test
    public void getMovieTrailer() {
    }

    @Test
    public void getAllTrailer() {
        System.out.println(trailerService.getAllTrailers());
    }
}