package com.ssh.service;

import com.ssh.model.Image;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 */
public interface ImageService {

    /**
     * 从这开始是针对后台管理电影时对预告片的方法
     */

    /**
     * 增加多张图片
     * @param images
     * @return
     */
    public boolean insertImage(List<Image> images);

    /**
     * 根据图片id删除图片
     * @param id
     * @return
     */
    public boolean deleteImage(Integer id);

    /**
     * 更新图片
     * @param image
     * @return
     */
    public boolean updateImage(Image image);

    /**
     * 根据电影id获得图片
     * @param movieId
     * @return
     */
    public List<Image> getMovieImages(Integer movieId);

    /**
     * end针对后台管理电影时对预告片的方法
     */
}
