package com.ssh.dao.impl;

import com.ssh.dao.loginDao;
import com.ssh.model.User;
import com.ssh.model.UserLogin;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Date;
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
    public Integer login(String username, String password) {

        try{
            Query query = this.getSessionFactory().getCurrentSession().createQuery("from User where username=:username and password=:password");
            query.setParameter("username",username);
            query.setParameter("password",password);

            if (query.list().size()>0){
                String hql="update User u set u.last_login=? where u.id=?";

                Query query1  = this.getSessionFactory().getCurrentSession().createQuery(hql);

                User user=(User)query.list().get(0);
                query1.setParameter(0,new Date());
                query1.setInteger(1,user.getId());

                query1.executeUpdate();

                return user.getId();
            }else{
                return 0;
            }
        }catch (Exception e){
            return 0;
        }




    }

    @Override
    public boolean checkUsername(String username) {
        try{
            Query query = this.getSessionFactory().getCurrentSession().createQuery("from User where username=:username");
            query.setParameter("username",username);


            if (query.list().size()>0){

                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean checkPhone(String phone) {
        try{
            Query query = this.getSessionFactory().getCurrentSession().createQuery("from User where phone=:phone");
            query.setParameter("phone",phone);


            if (query.list().size()>0){

                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean register(String phone, String username, String password) {
        try{
            User user=new User();
            user.setPassword(password);
            user.setUsername(username);
            user.setPhone(phone);
            Serializable save = this.getSessionFactory().getCurrentSession().save(user);

            if((int)save>0){
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            return false;
        }

    }

//    @Override
//
//    public User login(String email, String password) {
//        User user1 = new User();
//        String hql = "from User where email = ? and password = ?";
//        List<User> list = (List<User>) this.getHibernateTemplate().find(hql, email, password);
//        if (list.size() == 0) {
//            return user1;
//        }
//        user1 = list.get(0);
//        return user1;
//    }

//    @Override
//    public int findByEmail(String email) {
//        String hql = "from user where email = ?";
//        List<UserLogin> list = (List<UserLogin>) this.getHibernateTemplate().find(hql, email);
//        if (list.size() == 0) {
//            return 1;
//        }
//        return -1;
//    }
//
//    @Override
//    @Transactional
//    public int register(String email, String password, String userName) {
//        UserLogin user1 = new UserLogin();
//        user1.setPassword(password);
//        user1.setUsername(userName);
//        user1.setEmail(email);
//        Session currentSession = this.getSessionFactory().getCurrentSession();
//        currentSession.save(user1);
//        return -1;
//    }
}
