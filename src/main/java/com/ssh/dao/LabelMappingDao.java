package com.ssh.dao;

import com.ssh.model.Labelmapping;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
public interface LabelMappingDao {

    /**
     * 插入电影的映射
     * @param labelmappings
     * @return
     */
    public boolean insertLabelMapping(List<Labelmapping> labelmappings);


}
