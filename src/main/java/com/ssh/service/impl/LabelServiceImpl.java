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
}
