package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.dao.Movie_ReplyCommentDao;
import com.ssh.dao.Tips_messageDao;
import com.ssh.model.Movie_Replycomment;
import com.ssh.model.Tips_message;
import com.ssh.service.Movie_ReplyCommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Service("Movie_ReplyCommentService")
public class MovieReplyCommentServieImpl implements Movie_ReplyCommentService {

    @Resource
    private Movie_ReplyCommentDao movieReplyCommentDao;

    //当有用户回复的时候需要调用数据库的接口
    @Resource
    private Tips_messageDao tips_messageDao;

    //获得回复者的username，
    @Resource
    private ManagerUserDao managerUserDao;


    @Override
    @Transactional
    public boolean insertReplyComment(Movie_Replycomment movieReplycomment) {
        movieReplycomment.setTime(new Date());
        if (movieReplycomment.getReply_type()==1){//代表是回复评论的
            movieReplycomment.setReply_id(movieReplycomment.getComment_id());
        }else if (movieReplycomment.getReply_type()==2){//代表是回复的回复
            //设置该回复的id为目标回复的id,目标回复id通过前端发送，
            movieReplycomment.setReply_id(movieReplycomment.getId());
        }
        /**
         * 以下是设置消息提醒的
         */
        String username= managerUserDao.getUserName(movieReplycomment.getUserId());
        Tips_message tips_message=new Tips_message();
        tips_message.setSender(username);
        tips_message.setMessage_status(1);//默认未读
        tips_message.setUserId(movieReplycomment.getTo_userId());//设置接收者的id
        tips_message.setTime(new Date());
        tips_message.setMessage("有人回复你："+ movieReplycomment.getContent());//设置为回复内容
        tips_messageDao.insertMessage(tips_message);
        /**
         * 设置消息提醒end
         */
        return movieReplyCommentDao.insertReplyComment(movieReplycomment);
    }

    @Override
    public List<Movie_Replycomment> selectReplyComment(Integer comment_id) {
        return movieReplyCommentDao.selectReplyComment(comment_id);
    }

    @Override
    public boolean deleteReplyComment(Integer id) {

        return movieReplyCommentDao.deleteReplyComment(id);
    }
}
