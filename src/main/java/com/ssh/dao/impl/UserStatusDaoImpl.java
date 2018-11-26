package com.ssh.dao.impl;

import com.ssh.dao.UserStatusDao;
import com.ssh.model.UserStatus;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
@Transactional
@Repository("userStatusDao")
public class UserStatusDaoImpl implements UserStatusDao{

    /**
     * 数据库插入禁言信息实现接口
     * @param userStatus
     * @return
     */
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public int insertForbiddenWords(UserStatus userStatus) {
        //调用hibernate的接口，实现插入数据库的过程
        System.out.println(userStatus.getDays());
        try{
            sessionFactory.getCurrentSession().save(userStatus);
            System.out.println(userStatus);
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }

        return 0;
    }
}
