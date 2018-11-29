package com.ssh.dao.impl;

import com.ssh.dao.Trailer_CommentDao;
import com.ssh.model.Trailer_Comment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Transactional
@Repository("Trailer_CommentDao")
public class Trailer_CommentDaoImpl extends HibernateDaoSupport implements Trailer_CommentDao{


    /**
     * 得到spring配置文件中的session工厂对象
     */
    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public boolean insertComment(Trailer_Comment trailer_comment) {
        try{
            this.getSessionFactory().getCurrentSession().save(trailer_comment);

            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }

    }

    /**
     * 根据条件查询
     * @param trailerId
     * @param begin
     * @param pageSize
     * @return
     */
    @Override
    public List<Trailer_Comment> findComment(Integer trailerId, int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Trailer_Comment.class);
        // 查询分页数据
        List<Trailer_Comment> list = (List<Trailer_Comment>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public Integer getCountComment(Integer trailerId) {
        String hql="select count(*) from Trailer_Comment where trailerId ="+trailerId;
        List<Long> list= (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public boolean deleteComment(int id) {
        Session session=this.getSessionFactory().getCurrentSession();
        Trailer_Comment trailer_comment =new Trailer_Comment();
        trailer_comment.setId(id);
        try {
            session.delete(trailer_comment);
            return true;
        }catch (Exception e){

            System.out.println(e.getStackTrace());
            return false;
        }
    }
}
