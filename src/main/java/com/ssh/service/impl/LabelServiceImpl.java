package com.ssh.service.impl;

import com.ssh.dao.LabelDao;
import com.ssh.model.Label;
import com.ssh.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
@Service("LabelService")
public class LabelServiceImpl implements LabelService{

    @Autowired
    private LabelDao labelDao;

    @Override
    public List<Label> getAllLabelsToAddMovie() {

        return labelDao.getAllLabels_2();

    }

    @Override
    public String getLabelNameById(Integer id) {
        return labelDao.getLabelNameById(id);
    }

    @Override
    public List<Label> getAllLabels() {
        List<Label> labels=labelDao.getAllLabels();
        return labels;
    }


    @Override
    public int deleteLabels(Integer[] ids) {
        int count=labelDao.deleteLabels(ids);
        return count;
    }

    @Override
    public Label updateLabel(int id) {
        return null;
    }

    @Override
    public boolean addLabel(Label label) {
        return false;
    }

    @Override
    public Label getLabelById(int id) {
        Label label=labelDao.getLabelById(id);
        return label;
    }
}
