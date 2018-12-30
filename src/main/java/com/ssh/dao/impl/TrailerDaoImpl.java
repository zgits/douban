package com.ssh.dao.impl;

import com.ssh.dao.TrailerDao;
import com.ssh.model.Trailer;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/3.
 */
@Transactional
@Repository("TrailerDao")
public class TrailerDaoImpl extends HibernateDaoSupport implements TrailerDao{

    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }


    /**
     * 从这开始是针对后台管理电影时对预告片的方法
     */


    @Override
    public boolean insertTrailer(List<Trailer> trailers) {
       try{
           for (Trailer trailer:trailers){
               this.getSessionFactory().getCurrentSession().save(trailer);
           }

           return true;
       }catch (Exception e){
           return false;
       }
    }

    @Override
    public boolean updateTrailer(Trailer trailer) {
        try{
            this.getSessionFactory().getCurrentSession().update(trailer);
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public boolean deleteTrailer(Integer id) {
        Trailer trailer=new Trailer();
        trailer.setId(id);

        try{
            this.getSessionFactory().getCurrentSession().delete(trailer);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List<Trailer> getMovieTrailers(Integer movieId) {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Trailer where movieId=?").setParameter(0,movieId);
        return query.list();
    }

    @Override
    public Trailer getMovieTrailer(Integer id) {
        return (Trailer) this.getSessionFactory().getCurrentSession().createQuery("from Trailer where id=?").setParameter(0,id).uniqueResult();
    }


    @Override
    public List<Trailer> getAllTrailer() {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Trailer");
        return  query.list();
    }
    @Override
    public List<Trailer> getAllTrailers() {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Trailer");
        return query.list();
    }

    @Override
    public boolean deleteTrailers(Integer[] ids) {
        String hql="delete from Trailer where id in (:ids)";
        int ret=0;
        try{
            Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(hql);
            query.setParameterList("ids", ids);
            ret = query.executeUpdate();
        }catch (Exception e){

        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }


    public int addTrailerNum(Trailer trailer){
        try{
            this.getSessionFactory().getCurrentSession().update(trailer);
            return 1;
        }catch (Exception e){
            return 0;
        }
    }
}
