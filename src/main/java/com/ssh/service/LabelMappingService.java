package com.ssh.service;

import com.ssh.model.Labelmapping;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/26.
 */
public interface LabelMappingService {

    /**
     * 插入对应的映射
     * @param labelmappings
     * @return
     */
    public boolean insertLabelMapping(List<Labelmapping> labelmappings);


    /**
     * 根据电影id得到电影的分类
     * @param movieId
     * @return
     */
    public List<Labelmapping> selectLabelMappings(Integer movieId);


    /**
     * 更新电影的分类
     * @param labelmappings
     * @return
     */
    public boolean updateLabelMapping(List<Labelmapping> labelmappings);


    /**
     * 根据labelid得到存在的映射
     * @param labelId
     * @return
     */
    public List<Labelmapping> getLabelMappingByLabelId(Integer labelId);

    /**
     * 得到所有
     * @return
     */
    public List<Labelmapping> getAllLabels();


    /**
     * 得到不同电影的
     * @return
     */
    public List<Labelmapping> getMovieLabelmapping();

}
