package com.ssh.service.impl;

import com.ssh.dao.TrailerDao;
import com.ssh.dao.Trailer_CommentDao;
import com.ssh.dao.Trailer_ReplyCommentDao;
import com.ssh.model.Trailer;
import com.ssh.service.TrailerService;
import com.ssh.service.Trailer_CommentService;
import com.ssh.service.Trailer_ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 */
@Transactional
@Service("TrailerService")
public class TrailerServiceImpl implements TrailerService{

    @Autowired
    private TrailerDao trailerDao;


    @Autowired
    private  Trailer_CommentService trailer_commentService;




    @Override
    public boolean insertTrailer(List<Trailer> trailers) {
        for (Trailer trailer:trailers){
            trailer.setTime(new Date());
        }
        return trailerDao.insertTrailer(trailers);
    }

    @Override
    public boolean deleteTrailer(Integer id) {
        return trailerDao.deleteTrailer(id);
    }

    @Override
    public boolean updateTrailer(Trailer trailer) {
        trailer.setTime(new Date());
        return trailerDao.updateTrailer(trailer);
    }


    @Override
    public List<Trailer> getMovieTrailers(Integer movieId) {
        List<Trailer> trailers=trailerDao.getMovieTrailers(movieId);
        //后台查看预告片时，不加入评论等信息
//        for (Trailer trailer:trailers){
//
//            //????,有点疑问2018-12-05
//            trailer.setTrailerComments(trailer_commentService.findComment(movieId,1).getLists());
//        }
        return trailers;
    }

    @Override
    public Trailer getMovieTrailer(Integer id) {
        Trailer trailer=trailerDao.getMovieTrailer(id);
        /**
         * 最开始初始化的时候，默认第一页显示，之后要进行下一页刷新的时候，调用评论服务的接口进行刷新
         */
        trailer.setTrailerComments(trailer_commentService.findComment(id,1).getLists());
        return trailer;
    }

    @Override
    public List<Trailer> getAllTrailer() {
        return trailerDao.getAllTrailers();
    }

    @Override
    public boolean deleteTrailers(Integer[] ids) {
        return trailerDao.deleteTrailers(ids);
    }
}
