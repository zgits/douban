package com.ssh.dao;

import com.ssh.model.Label;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
public interface LabelDao {


    /**
     * 得到等级为level2的分类
     * @return
     */
    public List<Label> getAllLabels_2();

}
