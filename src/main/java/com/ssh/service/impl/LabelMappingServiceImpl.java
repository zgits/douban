package com.ssh.service.impl;

import com.ssh.dao.LabelMappingDao;
import com.ssh.model.Labelmapping;
import com.ssh.service.LabelMappingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/26.
 */
@Service("LabelMappingService")
public class LabelMappingServiceImpl implements LabelMappingService{

    @Autowired
    private LabelMappingDao labelMappingDao;

    @Override
    public boolean insertLabelMapping(List<Labelmapping> labelmappings) {
        return labelMappingDao.insertLabelMapping(labelmappings);
    }

    @Override
    public List<Labelmapping> selectLabelMappings(Integer movieId) {
        return labelMappingDao.selectLabelMappings(movieId);
    }

    @Override
    public boolean updateLabelMapping(List<Labelmapping> labelmappings) {
        return labelMappingDao.updateLabelMapping(labelmappings);
    }
}
