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
    public Map<Integer,String> getAllLabelsToAddMovie();

    /**
     * 得到所有标签
     */
    public List<Label> getAllLabels();

    /**
     * 删除标签
     */
    public int deleteLabels(Integer[] ids);

    /**
     * 修改标签
     */
    public Label updateLabel(int id);

    /**
     * 添加标签
     */
    public boolean addLabel(Label label);

    /**
     * 根据id查询标签
     */
    public Label getLabelById(int id);
}
