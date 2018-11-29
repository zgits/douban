package com.ssh.dao.impl;

import com.ssh.dao.MovieDao;
import com.ssh.model.Movie;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("MovieDao")
public class MovieDaoImpl extends HibernateDaoSupport implements MovieDao{

    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public boolean insertMovie(Movie movie) {
        try{
            this.getSessionFactory().getCurrentSession().save(movie);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean deleteMovie(Integer id) {
        Movie movie=new Movie();
        movie.setId(id);
        try {
            this.getSessionFactory().getCurrentSession().delete(movie);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean updateMovie(Movie movie) {
        try{
            this.getSessionFactory().getCurrentSession().update(movie);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List<Movie> selectMovie(int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Movie.class);
        // 查询分页数据
        List<Movie> list = (List<Movie>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public Integer getMovieCount() {
        String hql="select count(*) from Movie";
        List<Long> list= (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }


    @Override
    public Movie selectMovieById(Integer id) {
        return (Movie)this.getSessionFactory().getCurrentSession().createQuery("from Movie where id=?").setParameter(0,id).uniqueResult();

    }

    @Override
    public List<Movie> selectMovieByName(String moviename, int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Movie.class);
        criteria.add(Restrictions.like("moviename",moviename));

        // 查询分页数据
        List<Movie> list = (List<Movie>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public Integer getMovieCountByName(String moviename) {
        String hql="select count(*) from Movie where moviename like %"+moviename+"%";
        List<Long> list= (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }
}
