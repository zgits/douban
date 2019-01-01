package com.ssh.dao.impl;

import com.ssh.dao.LabelDao;
import com.ssh.model.Label;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
@Transactional
@Repository("LabelDao")
public class LabelDaoImpl implements LabelDao{


    @Resource
    private SessionFactory sessionFactory;

    @Override
    public List<Label> getAllLabels_2() {
        Query query=sessionFactory.getCurrentSession().createQuery("from Label where level=2");
        return query.list();
    }

    @Override
    public List<Label> getAllLabels_1() {
        Query query=sessionFactory.getCurrentSession().createQuery("from Label where level=1");
        return query.list();
    }

    /**
     * 获取全部标签
     * @return
     */
    @Override
    public List<Label> getAllLabels() {
        String hql="from Label";
        Query query=this.sessionFactory.getCurrentSession().createQuery(hql);
        return(query.list());
    }

    /**
     * 添加新标签
     * @param label
     * @return
     */
    @Override
    public int addLabel(Label label) {
       this.sessionFactory.getCurrentSession().save(label);
        return 1;
    }

    /**
     * 删除标签
     * @param id
     * @return
     */

    @Override
    public int deleteLabels(int id) {
        int count=0;
        String hql="delete from Label where id=:id";
        Query query=this.sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger("id",id);
        count=query.executeUpdate();
        return count;
    }

    /**
     * 修改标签
     * @param
     * @return
     */

    @Override
    public int updateLabel(Label label) {
        try{
            this.sessionFactory.getCurrentSession().update(label);
            return 1;
        }catch (Exception e){
            return 0;
        }
    }


    /**
     * 查询指定标签
     * @param id
     * @return
     */
    @Override
    public Label getLabelById(int id) {
        Label label=new Label();
        String hql="from Label as label where label.id=:id";
        Query query=this.sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger("id",id);
        label=(Label)query.list().get(0);
        return label;
    }

    @Override
    public String getLabelNameById(Integer id) {
        return (String)sessionFactory.getCurrentSession().createQuery(" select name from Label where id=?").setParameter(0,id).uniqueResult();
    }

    @Override
    public List<Object[]> getLabelName(){
        String hql="select id,name from Label where level=1 or level=0";
        Query query=this.sessionFactory.getCurrentSession().createQuery(hql);
        return (query.list());
    }
}
