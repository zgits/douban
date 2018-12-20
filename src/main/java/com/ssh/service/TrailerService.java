package com.ssh.service;

import com.ssh.model.Trailer;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 */
public interface TrailerService {


    /**
     * 从这开始是针对后台管理电影时对预告片的方法
     */


    /**
     * 增加多条预告片信息
     * @param trailers
     * @return
     */
    public boolean insertTrailer(List<Trailer> trailers);

    /**
     * 通过id删除预告片信息
     * @param id
     * @return
     */
    public boolean deleteTrailer(Integer id);

    /**
     * 更新预告片信息
     * @param trailer
     * @return
     */
    public boolean updateTrailer(Trailer trailer);

    /**
     * 查询某个电影下的所有预告片
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
     * 得到所有的预告片，用于后台管理预告片所用
     * @return
     */
    public List<Trailer> getAllTrailer();

    /**
     * 批量删除预告片
     * @param ids
     * @return
     */
    public boolean deleteTrailers(Integer[] ids);
}
