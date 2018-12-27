package com.ssh.service;

import com.ssh.model.Label;

import java.util.List;
import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
public interface LabelService {


    /**
     * 得到分类为添加电影所用
     * @return
     */
    public List<Label> getAllLabelsToAddMovie();


    /**
     * 根据id获取分类的名字
     * @param id
     * @return
     */
    public String getLabelNameById(Integer id);
}
