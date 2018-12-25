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
    public Map<Integer, String> getAllLabelsToAddMovie() {

        List<Label> labels=labelDao.getAllLabels_2();
        Map<Integer,String> id_name=new HashMap<>();
        for(Label label:labels){
            id_name.put(label.getId(),label.getName());
        }
        return id_name;
    }
}
