package com.ssh.dao.impl;

import com.ssh.dao.ReplyCommentDao;
import com.ssh.model.Replycomment;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("ReplyCommentDao")
public class ReplyCommentDaoImpl implements ReplyCommentDao{

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;


    @Override
    public boolean insertReplyComment(Replycomment replycomment) {
        try{
            sessionFactory.getCurrentSession().save(replycomment);
            return true;
        }catch (Exception e){
            return false;
        }


    }

    @Override
    public List<Replycomment> selectReplyComment(Integer comment_id) {
        //sessionFactory.getCurrentSession().get
        return null;
    }

    @Override
    public boolean deleteReplyComment(Integer id) {
        Replycomment replycomment=new Replycomment();
        replycomment.setId(id);
        try {
            sessionFactory.getCurrentSession().delete(replycomment);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }

    }
}
