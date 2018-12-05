package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Trailer;
import com.ssh.service.Trailer_CommentService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 *
 * 对预告片评论的action
 */
@Controller("TrailerComment")
public class TrailerCommentAction extends ActionSupport{

    @Resource
    private Trailer_CommentService trailer_commentService;

    //根据trailerId得到评论
    private Integer trailerId;

    private Integer currPage=1;

    public Integer getTrailerId() {
        return trailerId;
    }

    public void setTrailerId(Integer trailerId) {
        this.trailerId = trailerId;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public String getTrailer(){
        return null;
    }
    //end

}
