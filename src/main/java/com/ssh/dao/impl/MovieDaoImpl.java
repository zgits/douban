package com.ssh.dao.impl;

import com.ssh.dao.MovieDao;
import com.ssh.model.Movie;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("MovieDao")
public class MovieDaoImpl implements MovieDao{

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public boolean insertMovie(Movie movie) {
        try{
            sessionFactory.getCurrentSession().save(movie);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean deleteMovie(Integer id) {
        Movie movie=new Movie();
        movie.setId(id);
        try {
            sessionFactory.getCurrentSession().delete(movie);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean updateMovie(Movie movie) {
        try{
            sessionFactory.getCurrentSession().update(movie);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List<Movie> selectMovie() {
        return null;
    }

    @Override
    public Movie selectMovieById(Integer id) {
        return (Movie)sessionFactory.getCurrentSession().createQuery("from Movie where id=?").setParameter(0,id).uniqueResult();

    }
}
