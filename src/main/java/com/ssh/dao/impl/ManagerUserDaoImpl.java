package com.ssh.dao.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.model.User;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("ManagerUserDao")
public class ManagerUserDaoImpl extends HibernateDaoSupport implements ManagerUserDao {


    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }


    @Override
    public User getUserById(Integer id) {

        return null;
//        return (User)sessionFactory.getCurrentSession().createQuery("from User where id=?").setParameter(0,id).uniqueResult();
    }

    @Override
    public int getUserCount() {
        String hql="select count(*) from User";
        List<Long> list= (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }


    @Override
    public List<User> getAllUser(int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        // 查询分页数据
        List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }


    @Override
    public String getUserName(Integer userId) {
        return null;
//        return (String)sessionFactory.getCurrentSession().createQuery("select username from User where id=?").setParameter(0,userId).uniqueResult();

    }


    @Override
    public boolean deleteUser(Integer id) {

//        User user=new User();
//        user.setId(id);
//        try {
//            sessionFactory.getCurrentSession().delete(user);
//            return true;
//        }catch (Exception e){
//            System.out.println(e.getMessage());
//            System.out.println(e.getStackTrace());
//            return false;
//        }
        return false;
    }


}
