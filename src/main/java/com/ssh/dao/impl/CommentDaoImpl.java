package com.ssh.dao.impl;

import com.ssh.dao.CommentDao;
import com.ssh.model.Movie_Comment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
@Transactional
@Repository("CommentDao")
public class CommentDaoImpl implements CommentDao{

    /**
     * 得到spring配置文件中的session工厂对象
     */
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 插入评论信息到数据库接口实现
     * @param movieComment
     * @return
     */
    @Override
    public boolean insertComment(Movie_Comment movieComment) {
        try{
            sessionFactory.getCurrentSession().save(movieComment);

        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }
        return true;

    }

    /**
     * 查找评论实现
     * @param movieId
     * @param trailerId
     * @return
     */
    @Override
    public List<Movie_Comment> findComment(int movieId, int trailerId) {




        return null;
    }

    /**
     * https://blog.csdn.net/eson_15/article/details/51360804
     * 删除评论实现
     * @param id
     * @return
     */
    @Override
    public boolean deleteComment(int id) {
        Session session=sessionFactory.getCurrentSession();
        Movie_Comment movieComment =new Movie_Comment();
        movieComment.setId(id);
        try {
            session.delete(movieComment);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            return false;
        }

    }
}
