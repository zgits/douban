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
    public List<Trailer> getMovieTrailer(Integer movieId) {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Trailer");
        return query.list();
    }
}
