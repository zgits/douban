package com.ssh.dao.impl;

import com.ssh.dao.Movie_ReplyCommentDao;
import com.ssh.model.Movie_Replycomment;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("Movie_ReplyCommentDao")
public class MovieReplyCommentDaoImpl implements Movie_ReplyCommentDao {

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;


    @Override
    public boolean insertReplyComment(Movie_Replycomment movieReplycomment) {
        try{
            sessionFactory.getCurrentSession().save(movieReplycomment);
            return true;
        }catch (Exception e){
            return false;
        }


    }

    @Override
    public List<Movie_Replycomment> selectReplyComment(Integer comment_id) {
        String hql="from Movie_Replycomment  where comment_id= ?";
        Query query=sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,comment_id);
        return query.list();
    }

    @Override
    public boolean deleteReplyComment(Integer id) {
        Movie_Replycomment movieReplycomment =new Movie_Replycomment();
        movieReplycomment.setId(id);
        try {
            sessionFactory.getCurrentSession().delete(movieReplycomment);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }

    }
}
