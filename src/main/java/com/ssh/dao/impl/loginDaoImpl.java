package com.ssh.dao.impl;

import com.ssh.dao.loginDao;
import com.ssh.model.login;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Repository("loginDao")
public class loginDaoImpl extends HibernateDaoSupport implements loginDao {


    private SessionFactory sessionFactory;
    @Autowired
    public void setSessionFacotry(SessionFactory sessionFacotry) {
        super.setSessionFactory(sessionFacotry);
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }



    @Override
    public login loginDao(int id) {
        login login=new login();
        login.setPassword("sdsfd");
        login.setUsername("sdfsdf");
        sessionFactory.getCurrentSession().save(login);
        return null;
    }
}
