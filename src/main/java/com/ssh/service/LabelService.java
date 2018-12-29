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
    //public Map<Integer,String> getAllLabelsToAddMovie();

    /**
     * 得到所有标签
     */
    public List<Label> getAllLabels();

    /**
     * 删除标签
     */
    public boolean deleteLabels(int id);

    /**
     * 修改标签
     */
    public boolean updateLabel(Label label);

    /**
     * 添加标签
     */
    public boolean addLabel(Label label);

    /**
     * 根据id查询标签
     */
    public Label getLabelById(int id);



    public List<Label> getAllLabelsToAddMovie();


    /**
     * 根据id获取分类的名字
     * @param id
     * @return
     */
    public String getLabelNameById(Integer id);


    /**
     * 得到父类标签的信息
     * @return
     */
    public Map<Integer,String> getLableName();
}
