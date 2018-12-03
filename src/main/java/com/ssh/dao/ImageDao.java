package com.ssh.dao;

import com.ssh.model.Image;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/3.
 */
public interface ImageDao {

    /**
     * 添加某个电影的宣传海报
     * @param image
     * @return
     */
    public boolean insertImage(List<Image> image);

    /**
     * 根据图片的id删除图片
     * @param id
     * @return
     */
    public boolean deleteImage(Integer id);

    /**
     * 修改上传或重新上传图片
     * @param image
     * @return
     */
    public boolean updateImage(Image image);

    /**
     * 根据电影id得到电影下的所有图片，不分页
     * @param movieId
     * @return
     */
    public List<Image> getMovieImage(Integer movieId);
}
