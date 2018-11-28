package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Movie;
import com.ssh.service.MovieServie;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public class MovieServieImplTest extends BaseTest{

    @Autowired
    private MovieServie movieServie;
    @Test
    public void insertMovie() throws Exception {
    }

    @Test
    public void deleteMovie() throws Exception {
    }

    @Test
    public void updateMovie() throws Exception {
        Movie movie=new Movie();
        movie.setId(1);
        movie.setActor("测试更新");
        System.out.println(movieServie.updateMovie(movie));
    }

    @Test
    public void seleceMovie() throws Exception {
    }

    @Test
    public void selctMovieById() throws Exception {
        System.out.println(movieServie.selctMovieById(1));
    }

}