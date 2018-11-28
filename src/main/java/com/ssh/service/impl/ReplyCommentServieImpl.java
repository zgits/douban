package com.ssh.service.impl;

import com.ssh.dao.ReplyCommentDao;
import com.ssh.model.Replycomment;
import com.ssh.service.ReplyCommentService;
import org.springframework.stereotype.Service;

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


    @Override
    public boolean insertReplyComment(Replycomment replycomment) {
        replycomment.setTime(new Date());
        if (replycomment.getReply_type()==1){//代表是回复评论的
            replycomment.setReply_id(replycomment.getComment_id());
        }else if (replycomment.getReply_type()==2){//代表是回复的回复
            //设置该回复的id为目标回复的id,目标回复id通过前端发送，
            replycomment.setReply_id(replycomment.getId());
        }
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
