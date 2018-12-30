package com.ssh.dao.impl;

import com.ssh.dao.Movie_CommentDao;
import com.ssh.model.Movie_Comment;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
@Transactional
@Repository("Movie_CommentDao")
public class MovieCommentDaoImpl extends HibernateDaoSupport implements Movie_CommentDao {

    /**
     * 得到spring配置文件中的session工厂对象
     */
    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    /**
     * 插入评论信息到数据库接口实现
     * @param movieComment
     * @return
     */
    @Override
    public boolean insertComment(Movie_Comment movieComment) {
        try{
            this.getSessionFactory().getCurrentSession().save(movieComment);

        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
        return true;

    }

    @Override
    public List<Movie_Comment> findComment(Integer movieId, int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Movie_Comment.class);
        criteria.add(Restrictions.eq("movieId",movieId));
        // 查询分页数据
        List<Movie_Comment> list = (List<Movie_Comment>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public Integer getCountComment(Integer movieId) {
        String hql="select count(*) from Movie_Comment where movieId ="+movieId;
        List<Long> list= (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public Float getAvgScore(Integer movieId) {
        String hql="select avg(score) from Movie_Comment where movieId ="+movieId;
        List<Double> list= (List<Double>) this.getHibernateTemplate().find(hql);
        System.out.println(list.size());
        System.out.println(list.get(0));
        if (list.size()>0&&list.get(0)!=null){
            return list.get(0).floatValue();
        }
        return null;
    }

    @Override
    public Integer getMovieIdById(Integer id) {
        String hql="select movieId from Movie_Comment where id=:id";
        Query query=this.getSessionFactory().getCurrentSession().createQuery(hql);
        query.setParameter("id",id);
        List<Integer> list=query.list();
        return list.get(0).intValue();
    }

    @Override
    public List<Movie_Comment> alreadyRated(Integer userId,Integer movieId) {
        String hql="from Movie_Comment where userId=:userId and movieId=:movieId";
        Query query=this.getSessionFactory().getCurrentSession().createQuery(hql);
        query.setParameter("userId",userId);
        query.setParameter("movieId",movieId);
        List<Movie_Comment> list=query.list();
        return list;
    }


    /**
     * 删除评论实现
     * @param id
     * @return
     */
    @Override
    public boolean deleteComment(int id) {
        Session session=this.getSessionFactory().getCurrentSession();
        Movie_Comment movieComment =new Movie_Comment();
        movieComment.setId(id);
        try {
            session.delete(movieComment);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }

    }
}
