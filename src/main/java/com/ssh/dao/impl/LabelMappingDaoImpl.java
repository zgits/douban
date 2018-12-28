package com.ssh.dao.impl;

import com.ssh.dao.LabelMappingDao;
import com.ssh.model.Labelmapping;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
@Transactional
@Repository("LabelMappingDao")
public class LabelMappingDaoImpl implements LabelMappingDao{

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public boolean insertLabelMapping(List<Labelmapping> labelmappings) {
        try{
            for(Labelmapping labelmapping:labelmappings){
                sessionFactory.getCurrentSession().save(labelmapping);
            }
            return true;
        }catch (Exception e){
            return false;
        }

    }
}
