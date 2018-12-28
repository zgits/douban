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
     * 根据id获取标签
     */
    public Label getLabelById(int id);

    /**
     * 根据id获得分类的名字
     * @param id
     * @return
     */
    public String getLabelNameById(Integer id);

}
