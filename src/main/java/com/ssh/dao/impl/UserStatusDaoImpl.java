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
@Transactional//事务管理
@Repository("userStatusDao")//spring的管理，这个类就交给spring进行管理了，可以通过注解的方式来，，，应该叫自己new吧
public class UserStatusDaoImpl implements UserStatusDao{

    /**
     * 得到spring配置文件中的session工厂对象
     */
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 数据库插入禁言信息实现接口
     * @param userStatus
     * @return
     */
    @Override
    public int insertForbiddenWords(UserStatus userStatus) {
        try{

            sessionFactory.getCurrentSession().save(userStatus);//调用sessionFactory的方法
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }

        return 0;
    }

    /**
     * 数据库删除禁言信息
     * @param id
     * @return
     */
    @Override
    public boolean deleteForbidden(Integer id) {
        UserStatus userStatus=new UserStatus();
        userStatus.setId(id);
        try {
            sessionFactory.getCurrentSession().delete(userStatus);
            return true;
        }catch (Exception e){
            System.out.println(e.getStackTrace());
            return false;
        }

    }

    @Override
    public UserStatus selectUserStatus(Integer userId) {
        return null;
    }
}
