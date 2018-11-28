package com.ssh.service;

import com.ssh.model.Movie;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public interface MovieServie {


    public boolean insertMovie(Movie movie);


    public boolean deleteMovie(Integer id);


    public boolean updateMovie(Movie movie);


    public List<Movie> seleceMovie();


    public Movie selctMovieById(Integer id);


}
