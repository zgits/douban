package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.dao.Trailer_CommentDao;
import com.ssh.dao.Trailer_ReplyCommentDao;
import com.ssh.model.PageBean;
import com.ssh.model.Trailer_Comment;
import com.ssh.service.ManagerUserService;
import com.ssh.service.Trailer_CommentService;
import com.ssh.service.Trailer_ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Service("Trailer_CommentSerive")
public class Trailer_CommentServiceImpl implements Trailer_CommentService{


    @Autowired
    private Trailer_CommentDao trailer_commentDao;

    @Autowired
    private Trailer_ReplyCommentDao trailer_replyCommentDao;


    @Autowired
    private ManagerUserDao managerUserDao;

    @Override
    public boolean insertComment(Trailer_Comment trailer_comment) {
        Date date=managerUserDao.selectEndTime(trailer_comment.getUserId());
        trailer_comment.setTime(new Date());
        trailer_comment.setUsername(managerUserDao.getUserName(trailer_comment.getUserId()));
        //判断禁言是否结束
        boolean flag=false;
        if(date==null){
            flag=true;
        }else if(trailer_comment.getTime().after(date)){
            flag=true;
        }else{
            flag=false;
        }
        if (flag){
            return trailer_commentDao.insertComment(trailer_comment);
        }else{
            return false;
        }
    }

    @Override
    public PageBean<Trailer_Comment> findComment(int trailerId, Integer currPage) {
        PageBean<Trailer_Comment> pageBean = new PageBean<Trailer_Comment>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = trailer_commentDao.getCountComment(trailerId);
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
        List<Trailer_Comment> list = trailer_commentDao.findComment(trailerId,begin, pageSize);
        for (Trailer_Comment trailer_comment:list){
            trailer_comment.setTrailerReplycomments(trailer_replyCommentDao.selectReplyComment(trailer_comment.getId()));
        }

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public boolean deleteComment(int id) {
        return trailer_commentDao.deleteComment(id);
    }
}
