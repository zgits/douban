package com.ssh.service;

import com.ssh.model.Movie;
import com.ssh.model.PageBean;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public interface MovieServie {


    /**
     * 新增电影信息
     * @param movie
     * @return
     */
    public boolean insertMovie(Movie movie);


    /**
     * 通过id删除电影信息
     * @param id
     * @return
     */
    public boolean deleteMovie(Integer id);


    /**
     * 更新电影信息
     * @param movie
     * @return
     */
    public boolean updateMovie(Movie movie);


    /**
     * 获得全部电影信息
     * @return
     */
    public PageBean<Movie> seleceMovie(Integer currPage);


    /**
     * 根据id查询电影信息
     * @param id
     * @return
     */
    public Movie selctMovieById(Integer id);

    /**
     * 根据电影名进行模糊查询
     * @param moviename
     * @return
     */
    public PageBean<Movie> selectMovieByName(String moviename,Integer currPage);

    /**
     * 得到全部的电影信息，用于上传用
     * @return
     */
    public List<Movie> selectAllMovies();


}
