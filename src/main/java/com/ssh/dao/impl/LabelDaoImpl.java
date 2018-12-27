package com.ssh.dao.impl;

import com.ssh.dao.LabelDao;
import com.ssh.model.Label;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
@Transactional
@Repository("LabelDao")
public class LabelDaoImpl implements LabelDao{


    @Resource
    private SessionFactory sessionFactory;

    @Override
    public List<Label> getAllLabels_2() {
        Query query=sessionFactory.getCurrentSession().createQuery("from Label where level=2");
        return query.list();
    }

    @Override
    public String getLabelNameById(Integer id) {
        return (String)sessionFactory.getCurrentSession().createQuery(" select name from Label where id=?").setParameter(0,id).uniqueResult();
    }
}
