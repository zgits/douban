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
}
