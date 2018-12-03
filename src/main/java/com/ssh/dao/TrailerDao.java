package com.ssh.dao;

import com.ssh.model.Trailer;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/3.
 */
public interface TrailerDao {


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
    public List<Trailer> getMovieTrailer(Integer movieId);
}
