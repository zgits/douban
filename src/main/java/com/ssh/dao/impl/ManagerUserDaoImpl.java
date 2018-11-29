package com.ssh.dao.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.model.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
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
        return (User)this.getSessionFactory().getCurrentSession().createQuery("from User where id=?").setParameter(0,id).uniqueResult();
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

        return (String)this.getSessionFactory().getCurrentSession().createQuery("select username from User where id=?").setParameter(0,userId).uniqueResult();

    }


    @Override
    public boolean deleteUser(Integer id) {

        User user=new User();
        user.setId(id);
        try {
            this.getSessionFactory().getCurrentSession().delete(user);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
    }

    /**
     * 禁言信息的处理
     * @param user
     * @return
     */
    @Override
    public boolean insertForbiddenWords(User user) {
        try{
            String hql="update User u set u.days=?,u.startTime=?,u.endTime=? where u.id=?";

            Query query  = this.getSessionFactory().getCurrentSession().createQuery(hql);

            query.setInteger(0,user.getDays());

            query.setDate(1,user.getStartTime());

            query.setDate(2,user.getEndTime());

            query.setInteger(3,user.getId());

            query.executeUpdate();
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public boolean deleteForbidden(Integer id) {
        try{
            String hql="update User u set u.days=null,u.startTime=null,u.endTime=null where u.id=?";

            Query query  = this.getSessionFactory().getCurrentSession().createQuery(hql);

            query.setInteger(0,id);

            query.executeUpdate();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public Date selectEndTime(Integer id) {
        return (Date)this.getSessionFactory().getCurrentSession().createQuery("select endTime from User where id=?").setParameter(0,id).uniqueResult();
    }

    @Override
    public List<User> selectUserByName(String username,int begin,int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
        // 查询分页数据
        List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public Integer getUserCountByName(String username) {
        String hql="select count(*) from User where username like %"+username+"%";
        List<Long> list= (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }


}
