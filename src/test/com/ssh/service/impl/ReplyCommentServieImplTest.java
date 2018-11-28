package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Replycomment;
import com.ssh.service.ReplyCommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public class ReplyCommentServieImplTest extends BaseTest{

    @Autowired
    private ReplyCommentService replyCommentService;

    @Test
    public void insertReplyComment() throws Exception {
        Replycomment replycomment=new Replycomment();
        replycomment.setContent("testdstds");//回复的内容
        replycomment.setUserId(2);//回复人的id
        replycomment.setComment_id(1);//目标评论的id
        replycomment.setReply_type(1);
        replycomment.setTo_userId(1);
        replyCommentService.insertReplyComment(replycomment);

    }

    @Test
    public void selectReplyComment() throws Exception {
    }

    @Test
    public void deleteReplyComment() throws Exception {
    }

}