package com.ssh.dao.impl;

import com.ssh.dao.Trailer_ReplyCommentDao;
import com.ssh.model.Trailer_Replycomment;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Transactional
@Repository("Trailer_ReplyCommentDao")
public class Trailer_ReplyCommentDaoImpl implements Trailer_ReplyCommentDao{

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public boolean insertReplyComment(Trailer_Replycomment trailer_replycomment) {
        try{
            sessionFactory.getCurrentSession().save(trailer_replycomment);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List<Trailer_Replycomment> selectReplyComment(Integer comment_id) {
        String hql="from Trailer_ReplyComment  where comment_id= ?";
        Query query=sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0,comment_id);
        return query.list();
    }

    @Override
    public boolean deleteReplyComment(Integer id) {
        Trailer_Replycomment trailer_replycomment =new Trailer_Replycomment();
        trailer_replycomment.setId(id);
        try {
            sessionFactory.getCurrentSession().delete(trailer_replycomment);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
