package com.ssh.dao.impl;

import com.ssh.dao.loginDao;
import com.ssh.model.User;
import com.ssh.model.UserLogin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Repository("loginDao")
@Transactional
public class loginDaoImpl extends HibernateDaoSupport implements loginDao {

    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override

    public User login(String email, String password) {
        User user1 = new User();
        String hql = "from User where email = ? and password = ?";
        List<User> list = (List<User>) this.getHibernateTemplate().find(hql, email, password);
        if (list.size() == 0) {
            return user1;
        }
        user1 = list.get(0);
        return user1;
    }

    @Override
    public int findByEmail(String email) {
        String hql = "from user where email = ?";
        List<UserLogin> list = (List<UserLogin>) this.getHibernateTemplate().find(hql, email);
        if (list.size() == 0) {
            return 1;
        }
        return -1;
    }

    @Override
    @Transactional
    public int register(String email, String password, String userName) {
        UserLogin user1 = new UserLogin();
        user1.setPassword(password);
        user1.setUsername(userName);
        user1.setEmail(email);
        Session currentSession = this.getSessionFactory().getCurrentSession();
        currentSession.save(user1);
        return -1;
    }
}
