package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Trailer_Replycomment;
import com.ssh.service.Trailer_ReplyCommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public class Trailer_ReplyCommentServiceImplTest extends BaseTest{

    @Autowired
    private Trailer_ReplyCommentService replyCommentService;

    @Test
    public void insertReplyComment() throws Exception {
        Trailer_Replycomment trailer_replycomment=new Trailer_Replycomment();
        trailer_replycomment.setContent("我来回复你 了");
        trailer_replycomment.setReply_type(1);
        trailer_replycomment.setComment_id(1);
        trailer_replycomment.setTo_userId(1);
        trailer_replycomment.setUserId(1);
        System.out.println(replyCommentService.insertReplyComment(trailer_replycomment));
    }

    @Test
    public void selectReplyComment() throws Exception {
    }

    @Test
    public void deleteReplyComment() throws Exception {
    }

}