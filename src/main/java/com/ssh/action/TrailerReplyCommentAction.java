package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Trailer_Replycomment;
import com.ssh.service.Trailer_ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("TrailerReplyComment")
public class TrailerReplyCommentAction extends ActionSupport{


    @Autowired
    private Trailer_ReplyCommentService trailer_replyCommentService;
    /****增加回复***/
    private Trailer_Replycomment trailer_replycomment;

    public void setTrailer_replycomment(Trailer_Replycomment trailer_replycomment) {
        this.trailer_replycomment = trailer_replycomment;
    }

    public void insertReplyComment(){
        trailer_replyCommentService.insertReplyComment(trailer_replycomment);
    }
    /***增加回复end***/

    /*******删除回复*******/
    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public void deleteReplyComment(){
        trailer_replyCommentService.deleteReplyComment(id);

    }
    /*******删除回复end*******/

}
