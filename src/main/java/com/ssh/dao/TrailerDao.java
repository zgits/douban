package com.ssh.dao;

import com.ssh.model.Trailer;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/3.
 */
public interface TrailerDao {


    /**
     * 从这开始是针对后台管理电影时对预告片的方法
     */

    /**
     * 插入多条预告片信息
     * @param trailers
     * @return
     */
    public boolean insertTrailer(List<Trailer> trailers);


    /**
     * 更新预告片信息
     * @param trailer
     * @return
     */
    public boolean updateTrailer(Trailer trailer);

    /**
     * 删除预告片信息，当某条预告片有误时，可以删除该预告片
     * @param id
     * @return
     */
    public boolean deleteTrailer(Integer id);

    /**
     * 根据电影id获取电影下的所有预告片信息，不分页，数量不多
     * @param movieId
     * @return
     */
    public List<Trailer> getMovieTrailers(Integer movieId);

    /**
     * 结束针对后台管理电影时对预告片的方法
     */


    /**
     * 说明一下，这个方法是为了展示评论和回复准备的，因=因为在展示评论和回复的同时，为了方便，就直接把预告片展示了
     * @param id
     * @return
     */
    public Trailer getMovieTrailer(Integer id);


    /**
     * 后台管理媒体信息时所用，得到全部的预告片
     * @return
     */
    public List<Trailer> getAllTrailers();
}
