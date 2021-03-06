package com.ssh.dao.impl;

import com.ssh.dao.LabelMappingDao;
import com.ssh.model.Labelmapping;
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

    @Override
    public List<Labelmapping> selectLabelMappings(Integer movieId) {
        String hql="from Labelmapping  where movieId=:movieId";
        Query query=sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger("movieId",movieId);
        return query.list();
    }

    @Override
    public boolean updateLabelMapping(List<Labelmapping> labelmappings) {
        String hql="delete from Labelmapping where movieId=:movieId";
        int ret=0;
        try{
            Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
            query.setInteger("movieId", labelmappings.get(0).getMovieId());
            ret = query.executeUpdate();
            insertLabelMapping(labelmappings);
        }catch (Exception e){

        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }

    }

    @Override
    public List<Labelmapping> getLabelMappingByLabelId(Integer labelId) {
        String hql="from Labelmapping  where labelId=:labelId";
        Query query=sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger("labelId",labelId);
        return query.list();
    }

    @Override
    public List<Labelmapping> getAllLabels() {
        String hql="from Labelmapping";
        Query query=sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List<Labelmapping> getMovieLabelmapping() {
        String hql="from Labelmapping group by movieId";
        Query query=sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }
}
