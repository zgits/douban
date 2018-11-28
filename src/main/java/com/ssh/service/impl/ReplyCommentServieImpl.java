package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.dao.ReplyCommentDao;
import com.ssh.dao.Tips_messageDao;
import com.ssh.model.Replycomment;
import com.ssh.model.Tips_message;
import com.ssh.service.ReplyCommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Service("ReplyCommentService")
public class ReplyCommentServieImpl implements ReplyCommentService{

    @Resource
    private ReplyCommentDao replyCommentDao;

    //当有用户回复的时候需要调用数据库的接口
    @Resource
    private Tips_messageDao tips_messageDao;

    //获得回复者的username，
    @Resource
    private ManagerUserDao managerUserDao;


    @Override
    @Transactional
    public boolean insertReplyComment(Replycomment replycomment) {
        replycomment.setTime(new Date());
        if (replycomment.getReply_type()==1){//代表是回复评论的
            replycomment.setReply_id(replycomment.getComment_id());
        }else if (replycomment.getReply_type()==2){//代表是回复的回复
            //设置该回复的id为目标回复的id,目标回复id通过前端发送，
            replycomment.setReply_id(replycomment.getId());
        }
        /**
         * 以下是设置消息提醒的
         */
        String username= managerUserDao.getUserName(replycomment.getUserId());
        Tips_message tips_message=new Tips_message();
        tips_message.setSender(username);
        tips_message.setMessage_status(1);//默认未读
        tips_message.setUserId(replycomment.getTo_userId());//设置接收者的id
        tips_message.setTime(new Date());
        tips_message.setMessage("有人回复你："+replycomment.getContent());//设置为回复内容
        tips_messageDao.insertMessage(tips_message);
        /**
         * 设置消息提醒end
         */
        return replyCommentDao.insertReplyComment(replycomment);
    }

    @Override
    public List<Replycomment> selectReplyComment(Integer comment_id) {
        return null;
    }

    @Override
    public boolean deleteReplyComment(Integer id) {

        return replyCommentDao.deleteReplyComment(id);
    }
}
