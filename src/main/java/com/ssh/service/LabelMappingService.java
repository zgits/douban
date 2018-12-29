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

}
