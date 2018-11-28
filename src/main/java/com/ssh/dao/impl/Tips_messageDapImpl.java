package com.ssh.dao.impl;

import com.ssh.dao.Tips_messageDao;
import com.ssh.model.Tips_message;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("Tips_messageDao")
public class Tips_messageDapImpl implements Tips_messageDao{


    @Resource
    private SessionFactory sessionFactory;
    /**
     * 将消息插入到数据库中
     * @param tips_message
     * @return
     */
    @Override
    public boolean insertMessage(Tips_message tips_message) {
        try{
            sessionFactory.getCurrentSession().save(tips_message);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
