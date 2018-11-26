package com.ssh.dao.impl;

import com.ssh.dao.UserStatusDao;
import com.ssh.model.UserStatus;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
public class UserStatusDaoImpl extends HibernateDaoSupport implements UserStatusDao{

    /**
     * 数据库插入禁言信息实现接口
     * @param userStatus
     * @return
     */
    @Override
    public int insertForbiddenWords(UserStatus userStatus) {
        //调用hibernate的接口，实现插入数据库的过程
        try{
            this.getHibernateTemplate().save(userStatus);
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }

        return 0;
    }
}
