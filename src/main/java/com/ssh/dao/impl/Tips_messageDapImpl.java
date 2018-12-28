package com.ssh.dao.impl;

import com.ssh.dao.Tips_messageDao;
import com.ssh.model.Tips_message;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Transactional
@Repository("Tips_messageDao")
public class Tips_messageDapImpl extends HibernateDaoSupport implements Tips_messageDao{


    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }
    /**
     * 将消息插入到数据库中
     * @param tips_message
     * @return
     */
    @Override
    public boolean insertMessage(Tips_message tips_message) {
        try{
            this.getSessionFactory().getCurrentSession().save(tips_message);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    @Override
    public List<Tips_message> getMessage(int id){
        List<Tips_message> messages;
        String hql="from Tips_message as message where message.userId=:id";
        Query query=this.getSessionFactory().getCurrentSession().createQuery(hql);
        query.setInteger("id",id);
        messages=(List<Tips_message>)query.list();
        return messages;
    }

    @Override
    public int deleteMessage(Integer[] ids) {
        int count=0;
        String hql="delete from Tips_message where id in (:ids)";
        try{
            Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(hql);
            query.setParameterList("ids", ids);
            count= query.executeUpdate();
        }catch (Exception e){
            System.out.println("删除失败");
        }
        return count;
    }

    @Override
    public Integer getCountMessage(int userId,int status) {
        String hql="select count(*) from Tips_message where userId=? and message_status=?";
        List<Long> list=(List<Long>) this.getHibernateTemplate().find(hql,new Integer[]{userId,status});
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<Tips_message> findMessage(Integer userId,int status, int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Tips_message.class);
        criteria.add(Restrictions.eq("userId",userId));
        criteria.add(Restrictions.eq("message_status",status));
        // 查询分页数据
        List<Tips_message> list = (List<Tips_message>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;

    }

    @Override
    public int updateStatus(Integer[] ids) {
        int count = 0;
        String hql = "update Tips_message message set message.message_status=2 where id in (:ids)";
        Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
        query.setParameterList("ids", ids);
        count = query.executeUpdate();
        return  count;
    }
}
