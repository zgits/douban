package com.ssh.dao.impl;

import com.ssh.dao.MovieDao;
import com.ssh.model.Movie;
import org.hibernate.Query;
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

    /**
     * int begin, int pageSize
     * @return
     */
    @Override
    public List<Movie> selectMovie() {
//        DetachedCriteria criteria = DetachedCriteria.forClass(Movie.class);
//        // 查询分页数据
//        List<Movie> list = (List<Movie>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        String hql="from Movie";
        Query query=this.getSessionFactory().getCurrentSession().createQuery(hql);
        return query.list();
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
        System.out.println("dao查询");
        String hql="from Movie as movie where movie.id=:id";
        Query query=this.getSessionFactory().getCurrentSession().createQuery(hql);
        query.setInteger("id",id);
        return (Movie)query.list().get(0);

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

    @Override
    public List<Movie> selectAllMovie() {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Movie");
        return query.list();
    }

    @Override
    public String getMovieNameById(Integer movieId) {

        return (String)this.getSessionFactory().getCurrentSession().createQuery(" select moviename from Movie where id=?").setParameter(0,movieId).uniqueResult();

    }

    @Override
    public List<Object[]> getAllMovieName() {
        String hql = " select id,moviename from Movie";

        Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);

        //默认查询出来的list里存放的是一个Object数组

        return query.list();
    }

    @Override
    public boolean deleteMovies(Integer[] ids) {
        String hql="delete from Movie where id in (:ids)";
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


}
