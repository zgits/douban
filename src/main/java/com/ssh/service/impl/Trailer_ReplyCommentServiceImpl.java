package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.dao.Tips_messageDao;
import com.ssh.dao.Trailer_ReplyCommentDao;
import com.ssh.model.Tips_message;
import com.ssh.model.Trailer_Replycomment;
import com.ssh.service.Trailer_ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Service("Trailer_ReplyCommentService")
public class Trailer_ReplyCommentServiceImpl implements Trailer_ReplyCommentService{

    @Autowired
    private Trailer_ReplyCommentDao trailer_replyCommentDao;

    //当有用户回复的时候需要调用数据库的接口
    @Resource
    private Tips_messageDao tips_messageDao;

    //获得回复者的username，
    @Resource
    private ManagerUserDao managerUserDao;

    @Override
    public boolean insertReplyComment(Trailer_Replycomment trailer_replycomment) {
        Date date=managerUserDao.selectEndTime(trailer_replycomment.getUserId());
        trailer_replycomment.setTime(new Date());
        trailer_replycomment.setUsername(managerUserDao.getUserName(trailer_replycomment.getUserId()));
        trailer_replycomment.setTo_userIdusername(managerUserDao.getUserName(trailer_replycomment.getTo_userId()));

        boolean flag=false;
        if(date==null){
            flag=true;
        }else if(trailer_replycomment.getTime().after(date)){
            flag=true;
        }else{
            flag=false;
        }
        if (flag){
            if (trailer_replycomment.getReply_type()==1){//代表是回复评论的
                trailer_replycomment.setReply_id(trailer_replycomment.getComment_id());
            }else if (trailer_replycomment.getReply_type()==2){//代表是回复的回复
                //设置该回复的id为目标回复的id,目标回复id通过前端发送，
                trailer_replycomment.setReply_id(trailer_replycomment.getId());
            }
            /**
             * 以下是设置消息提醒的
             */
            String username= managerUserDao.getUserName(trailer_replycomment.getUserId());
            Tips_message tips_message=new Tips_message();
            tips_message.setSender(username);
            tips_message.setMessage_status(1);//默认未读
            tips_message.setUserId(trailer_replycomment.getTo_userId());//设置接收者的id
            tips_message.setTime(new Date());
            tips_message.setMessage("有人回复你："+ trailer_replycomment.getContent());//设置为回复内容
            tips_messageDao.insertMessage(tips_message);
            /**
             * 设置消息提醒end
             */
            return trailer_replyCommentDao.insertReplyComment(trailer_replycomment);
        }else{
            return false;
        }

    }

    @Override
    public List<Trailer_Replycomment> selectReplyComment(Integer comment_id) {
        return trailer_replyCommentDao.selectReplyComment(comment_id);
    }

    @Override
    public boolean deleteReplyComment(Integer id) {
        return trailer_replyCommentDao.deleteReplyComment(id);
    }
}
