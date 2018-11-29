package com.ssh.service.impl;

import com.ssh.dao.MovieDao;
import com.ssh.model.Movie;
import com.ssh.model.PageBean;
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
    public PageBean<Movie> seleceMovie(Integer currPage) {
        PageBean<Movie> pageBean = new PageBean<Movie>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = movieDao.getMovieCount();
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;
        List<Movie> list = movieDao.selectMovie(begin, pageSize);

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public Movie selctMovieById(Integer id) {
        return movieDao.selectMovieById(id);
    }

    @Override
    public PageBean<Movie> selectMovieByName(String moviename,Integer currPage) {
        PageBean<Movie> pageBean = new PageBean<Movie>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = movieDao.getMovieCountByName(moviename);
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;
        List<Movie> list = movieDao.selectMovieByName(moviename,begin, pageSize);

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public List<Movie> selectAllMovies() {
        return movieDao.selectAllMovie();
    }
}
