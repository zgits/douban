package com.ssh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Trailer;
import com.ssh.service.TrailerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("Trailer")
public class TrailerAction extends ActionSupport{


    @Autowired
    private TrailerService trailerService;

    /**根据id获取预告片信息，包括评论，我的主要是评论********/

    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTrailer(){

        Trailer trailer=trailerService.getMovieTrailer(id);
        ActionContext.getContext().put("OneTrailer",trailer);
        return "success";
    }
    /************根据id获取预告片及评论end**************/
}
