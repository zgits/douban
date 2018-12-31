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
    public List<Label> getAllLabels_1() {
        return labelDao.getAllLabels_1();
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
    public boolean deleteLabels(int id) {
        int count=labelDao.deleteLabels(id);
       if(count!=0){
           return true;
       }else {
           return  false;
       }
    }

    @Override
    public boolean updateLabel(Label label) {
        try {
            if (label.getParentId() == 0) {
                label.setLevel(1);
            } else {
                label.setLevel(2);
            }
            labelDao.updateLabel(label);
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public boolean addLabel(Label label) {
       try {
           if (label.getParentId() == 0) {
               label.setLevel(1);
           } else {
               label.setLevel(2);
           }
           labelDao.addLabel(label);
           return true;
       }catch (Exception e){
           return false;
       }
    }

    @Override
    public Label getLabelById(int id) {
        Label label=labelDao.getLabelById(id);
        return label;
    }

    @Override
    public Map<Integer, String> getLableName() {
        Map<Integer, String> id_name=new HashMap<>();
        List<Object[]> list=labelDao.getLabelName();
        for (Object[] object:list){
            for(int i=0;i<object.length;i+=2){
                id_name.put((Integer) object[i],(String)object[i+1]);
            }
        }
        return id_name;

    }
}
