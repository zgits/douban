package com.ssh.dao.impl;

import com.ssh.dao.StaticDao;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 */
@Transactional
@Repository("StaticDao")
public class StaticDaoImpl implements StaticDao{

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public List<String> getAllCountry() {
        //sessionFactory.getCurrentSession().createQuery()
        return null;
    }

    @Override
    public List<String> getAllLanguage() {
        return null;
    }
}
