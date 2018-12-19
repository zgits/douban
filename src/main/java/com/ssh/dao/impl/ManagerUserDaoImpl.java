package com.ssh.dao.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.model.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
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


    /**
     * 2018-12-18，取消了后台的分页，改为了前台，对于管理员管理用户使用
     * int begin, int pageSize
     * @return
     */
    @Override
    public List<User> getAllUser() {
//        DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
//        // 查询分页数据
//        List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);

        String hql="from User";
        Query query=this.getSessionFactory().getCurrentSession().createQuery(hql);
        return query.list();
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
            String hql="update User u set u.days=:days,u.startTime=:startTime,u.endTime=:endTime,u.reason=:reason where u.id=:id";

            Query query  = this.getSessionFactory().getCurrentSession().createQuery(hql);

            query.setParameter("days",user.getDays());

            query.setParameter("startTime",user.getStartTime());

            query.setParameter("endTime",user.getEndTime());

            query.setParameter("reason",user.getReason());

            query.setParameter("id",user.getId());

            query.executeUpdate();
            return true;
        }catch (Exception e){
            return false;
        }

    }

    @Override
    public boolean deleteForbidden(Integer id) {
        try{
            String hql="update User u set u.days=null,u.startTime=null,u.endTime=null,u.reason=null where u.id=?";

            Query query  = this.getSessionFactory().getCurrentSession().createQuery(hql);

            query.setInteger(0,id);

            query.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
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
        criteria.add(Restrictions.like("username",username));

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

    @Override
    public boolean deleteUsers(Integer[] ids) {
        String hql="delete from User where id in (:ids)";
        int ret=0;
        try{
            Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(hql);
            query.setParameterList("ids", ids);
            ret = query.executeUpdate();
        }catch (Exception e){

        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }


}
