package com.ssh.dao;

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
    public boolean insertMovie(Movie movie);

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
     * @return
     */
    public List<Movie> selectMovie();

    /**
     * 用于修改电影信息，获得单个电影信息
     * @param id
     * @return
     */
    public Movie selectMovieById(Integer id);
}
