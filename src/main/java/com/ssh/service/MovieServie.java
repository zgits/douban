package com.ssh.service;

import com.ssh.model.Labelmapping;
import com.ssh.model.Movie;
import com.ssh.model.PageBean;
import com.ssh.model.Trailer;

import java.util.List;
import java.util.Map;

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

    /**
     * 得到正在热映的电影
     * @return
     */
    public List<Movie> selectMoving();

    /**
     * 更新时所用
     * @param id
     * @return
     */
    public Movie ToUpdateselctMovieById(Integer id);


    /**
     * 根据电影id得到电影名，用于后台管理预告片时所用
     * @param movieId
     * @return
     */
    public String getMovieNameById(Integer movieId);


    /**
     * 得到全部的电影名字，转成map
     * @return
     */
    public Map<Integer,String> getAllMovieName();


    /**
     * 批量删除电影信息
     * @param ids
     * @return
     */
    public boolean deleteMovies(Integer[] ids);

/**
 * 获取某电影观众评分
 */
public List<Integer> getCommentScore(int id);

/**
 * 获取某电影标签
 */
public List<Labelmapping> getLabels(int movieId);

    /**
     * 根据电影id获取对应预告片id
     */
    public List<Trailer> getTrailerBymId(int movieid);
}
