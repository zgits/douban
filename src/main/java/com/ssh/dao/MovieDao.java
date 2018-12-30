package com.ssh.dao;

import com.ssh.model.Labelmapping;
import com.ssh.model.Movie;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 *
 * 对电影的增删改查
 */
public interface MovieDao {

    /**
     * 添加电影信息
     * @param movie
     * @return
     */
    public Integer insertMovie(Movie movie);

    /**
     * 删除电影信息
     * @param id
     * @return
     */
    public boolean deleteMovie(Integer id);

    /**
     * 修改电影信息
     * @param movie
     * @return
     */
    public boolean updateMovie(Movie movie);

    /**
     * 查询电影信息
     * int begin,int pageSize
     * @return
     */
    public List<Movie> selectMovie();

    /**
     * 获得电影的数量
     * @return
     */
    public Integer getMovieCount();

    /**
     * 用于修改电影信息，获得单个电影信息
     * @param id
     * @return
     */
    public Movie selectMovieById(Integer id);


    /**
     * 根据电影名进行模糊查询
     * @param moviename
     * @param begin
     * @param pageSize
     * @return
     */
    public List<Movie> selectMovieByName(String moviename,int begin,int pageSize);

    /**
     * 根据搜索电影名，返回数量
     * @param moviename
     * @return
     */
    public Integer getMovieCountByName(String moviename);


    /**
     * 得到所有电影信息，用于在上传的时候展示名字
     * @return
     */
    public List<Movie> selectAllMovie();

    /**
     * 得到正在上映的电影信息
     */
    public List<Movie> selectMoving();

    /**
     * 根据id获取电影名
     * @param movieId
     * @return
     */
    public String getMovieNameById(Integer movieId);


    /**
     * 得到一个展示电影名的
     * @return
     */
    public List<Object[]> getAllMovieName();


    /**
     * 批量删除电影
     * @param ids
     * @return
     */
    public boolean deleteMovies(Integer[] ids);
/**
 * 获取一个电影的观众评分进行筛选
 */
public List<Integer> getCommentScore(int id);

public List<Labelmapping> getLabels(int movieId);
}
