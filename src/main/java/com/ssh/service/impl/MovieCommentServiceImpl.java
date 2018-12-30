package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.dao.MovieDao;
import com.ssh.dao.Movie_CommentDao;
import com.ssh.dao.Movie_ReplyCommentDao;
import com.ssh.model.Movie_Comment;
import com.ssh.model.PageBean;
import com.ssh.service.ManagerUserService;
import com.ssh.service.Movie_CommentService;
import com.ssh.service.Movie_ReplyCommentService;
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

    @Autowired
    private Movie_ReplyCommentService movie_replyCommentService;

    @Autowired
    private ManagerUserService managerUserService;

    @Autowired
    private MovieDao movieDao;

    @Override
    public boolean insertComment(Movie_Comment movieComment) {

        Date date=managerUserService.selectEndTime(movieComment.getUserId());


        movieComment.setTime(new Date());
        movieComment.setUsername(managerUserService.getUsername(movieComment.getUserId()));
        //判断禁言是否结束
        boolean flag=false;
        if(date==null) {
            flag = true;
        }else if (movieComment.getTime().after(date)){
             flag=true;
        }else{
            flag=false;
        }
        if (flag){
            boolean flag1=movieCommentDao.insertComment(movieComment);
            //做电影评分的计算
            if(flag1){
                Float filmsocre=movieCommentDao.getAvgScore(movieComment.getMovieId());
                flag1=movieDao.updateMovieScore(filmsocre,movieComment.getMovieId());
            }
            return flag1;
        }else{
            return false;
        }

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

        for (Movie_Comment movie_comment:list){
            movie_comment.setMovieReplycomments(movie_replyCommentService.selectReplyComment(movie_comment.getId()));
        }
        pageBean.setLists(list);
        return pageBean;
    }


    @Override
    public boolean deleteComment(int id) {
        Integer movieId=movieCommentDao.getMovieIdById(id);
        boolean flag=movieCommentDao.deleteComment(id);
        if(flag){
            boolean flag2=movieDao.updateMovieScore(movieCommentDao.getAvgScore(movieId),movieId);
            return flag2;
        }else{
            return false;
        }
    }

    @Override
    public boolean alreadyRated(Integer userId,Integer movieId) {
        boolean flag=true;
        List<Movie_Comment> movie_comments=movieCommentDao.alreadyRated(userId,movieId);
        for(Movie_Comment movie_comment:movie_comments){
            if(movie_comment.getScore()!=null){
                flag=false;
                break;
            }
        }
        return flag;
    }
}
