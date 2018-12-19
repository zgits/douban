package com.ssh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Image;
import com.ssh.model.Movie;
import com.ssh.model.Trailer;
import com.ssh.service.MovieServie;
import com.ssh.service.TrailerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("Trailer")
public class TrailerAction extends ActionSupport{


    @Autowired
    private TrailerService trailerService;
    @Autowired
    private MovieServie movieServie;



    /**根据id获取预告片信息，包括评论，我（zjf）的主要是评论********/

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

    /**
     * 预告片
     * @return
     */
    public String getAllTrailer(){
        List<Trailer> trailers =trailerService.getAllTrailer();
        List<Movie> movies=movieServie.selectMoving();
        ActionContext.getContext().put("trailers",trailers);
        ActionContext.getContext().put("movies",movies);
        return "success";
    }
}
