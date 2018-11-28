package com.ssh.service.impl;

import com.ssh.dao.MovieDao;
import com.ssh.model.Movie;
import com.ssh.service.MovieServie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Service("MovieServie")
public class MovieServieImpl implements MovieServie{

    @Autowired
    private MovieDao movieDao;

    @Override
    public boolean insertMovie(Movie movie) {
        return movieDao.insertMovie(movie);
    }

    @Override
    public boolean deleteMovie(Integer id) {
        return movieDao.deleteMovie(id);
    }

    @Override
    public boolean updateMovie(Movie movie) {
        return movieDao.updateMovie(movie);
    }

    @Override
    public List<Movie> seleceMovie() {
        return null;
    }

    @Override
    public Movie selctMovieById(Integer id) {
        return movieDao.selectMovieById(id);
    }
}
