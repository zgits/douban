package com.ssh.dao.impl;

import com.ssh.dao.ImageDao;
import com.ssh.model.Image;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/3.
 */
@Transactional
@Repository("ImageDao")
public class ImageDaoImpl extends HibernateDaoSupport implements ImageDao{

    @Resource
    public void setSessionFactory0(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Override
    public boolean insertImage(List<Image> image) {

        /**
         * 该方法对于大量数据效率有点低，暂时这样用
         */
        try{
            for (Image image1:image){
                this.getSessionFactory().getCurrentSession().save(image1);
            }

            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }

    }

    @Override
    public boolean deleteImage(Integer id) {
        Image image=new Image();
        image.setId(id);
        try{
            this.getSessionFactory().getCurrentSession().delete(image);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean updateImage(Image image) {
        try{
            this.getSessionFactory().getCurrentSession().update(image);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List<Image> getMovieImages(Integer movieId) {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Image where movieId=:movieId");
        query.setInteger("movieId",movieId);
        return query.list();
    }

    @Override
    public List<Image> getAllImage() {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Image");
        return query.list();
    }

    @Override
    public boolean deleteImages(Integer[] ids) {
        String hql="delete from Image where id in (:ids)";
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

    @Override
    public Image getImageById(Integer id) {
        Query query=this.getSessionFactory().getCurrentSession().createQuery("from Image where id=:id");
        query.setInteger("id",id);
        if(query.list().size()>0){
            return (Image)query.list().get(0);
        }else{
            return null;
        }

    }
}
