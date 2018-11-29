package com.ssh.service.impl;

import com.ssh.dao.Movie_CommentDao;
import com.ssh.model.Movie_Comment;
import com.ssh.model.PageBean;
import com.ssh.service.Movie_CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
@Service("Movie_CommentService")
public class MovieCommentServiceImpl implements Movie_CommentService {

    @Autowired
    private Movie_CommentDao movieCommentDao;

    @Override
    public boolean insertComment(Movie_Comment movieComment) {
        movieComment.setTime(new Date());
        return movieCommentDao.insertComment(movieComment);
    }

    @Override
    public PageBean<Movie_Comment> findComment(int movieId, Integer currPage) {
        PageBean<Movie_Comment> pageBean = new PageBean<Movie_Comment>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = movieCommentDao.getCountComment(movieId);
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;
        List<Movie_Comment> list = movieCommentDao.findComment(movieId,begin, pageSize);

        pageBean.setLists(list);
        return pageBean;
    }


    @Override
    public boolean deleteComment(int id) {
        return movieCommentDao.deleteComment(id);
    }
}
