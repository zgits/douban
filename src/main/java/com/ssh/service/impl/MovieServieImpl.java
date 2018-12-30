package com.ssh.service.impl;

import com.ssh.dao.ImageDao;
import com.ssh.dao.MovieDao;
import com.ssh.dao.TrailerDao;
import com.ssh.model.Labelmapping;
import com.ssh.model.Movie;
import com.ssh.model.PageBean;
import com.ssh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Service("MovieServie")
public class MovieServieImpl implements MovieServie{

    @Autowired
    private MovieDao movieDao;

    /**
     * 用来得到电影下的预告片用
     */
    @Autowired
    private ImageService imageService;

    @Autowired
    private TrailerService trailerService;

    @Autowired
    private Movie_CommentService movie_commentService;

    @Autowired
    private LabelMappingService labelMappingService;

    @Autowired
    private LabelService labelService;

    @Override
    public boolean insertMovie(Movie movie) {
        Integer id=movieDao.insertMovie(movie);
        if(id!=0){
            for (Labelmapping labelmapping:movie.getLabelmappings()){
                labelmapping.setMovieId(id);
                labelmapping.setLabelName(labelService.getLabelNameById(labelmapping.getLabelId()));
            }
            labelMappingService.insertLabelMapping(movie.getLabelmappings());
            return true;
        }else{
            return false;
        }

    }

    @Override
    public boolean deleteMovie(Integer id) {
        return movieDao.deleteMovie(id);
    }

    @Override
    public boolean updateMovie(Movie movie) {

        boolean flag1=movieDao.updateMovie(movie);

        Integer movieId=movie.getId();

        for (Labelmapping labelmapping:movie.getLabelmappings()){
            labelmapping.setMovieId(movieId);
            labelmapping.setLabelName(labelService.getLabelNameById(labelmapping.getLabelId()));
        }
        boolean flag2=labelMappingService.updateLabelMapping(movie.getLabelmappings());
        if(flag1&&flag2){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public PageBean<Movie> seleceMovie(Integer currPage) {
        PageBean<Movie> pageBean = new PageBean<Movie>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = movieDao.getMovieCount();
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;
        List<Movie> list = movieDao.selectMovie();
//        for (Movie movie:list){
//            movie.setImages(imageService.getMovieImages(movie.getId()));
//            movie.setTrailers(trailerService.getMovieTrailers(movie.getId()));
//           // movie.setMovieComments(movie_commentService.findComment(movie.getId(),1));
//        }

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public Movie selctMovieById(Integer id) {
        Movie movie=movieDao.selectMovieById(id);
        movie.setImages(imageService.getMovieImages(movie.getId()));
        movie.setTrailers(trailerService.getMovieTrailers(movie.getId()));
        movie.setMovieComments(movie_commentService.findComment(movie.getId(),1).getLists());
        return movie;
    }

    @Override
    public PageBean<Movie> selectMovieByName(String moviename,Integer currPage) {
        PageBean<Movie> pageBean = new PageBean<Movie>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = movieDao.getMovieCountByName(moviename);
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;
        List<Movie> list = movieDao.selectMovieByName(moviename,begin, pageSize);

        for (Movie movie:list){
            movie.setImages(imageService.getMovieImages(movie.getId()));
            movie.setTrailers(trailerService.getMovieTrailers(movie.getId()));
            movie.setMovieComments(movie_commentService.findComment(movie.getId(),1).getLists());

        }
        pageBean.setLists(list);
        return pageBean;
    }

    /**
     * 得到全部电影信息，用于上传用,就不加其他信息了，主要是用于获取电影名和id
     * @return
     */
    @Override
    public List<Movie> selectAllMovies() {
        List<Movie> movies=movieDao.selectAllMovie();
//        for (Movie movie:movies){
//            movie.setImages(imageService.getMovieImages(movie.getId()));
//            movie.setTrailers(trailerService.getMovieTrailers(movie.getId()));
//            movie.setMovieComments(movie_commentService.findComment(movie.getId(),1).getLists());

        //}
        return movies;
    }

    @Override
    public List<Movie> selectMoving() {
        List<Movie> movies=movieDao.selectMoving();
        for(Movie movie:movies){
            movie.setImages(imageService.getMovieImages(movie.getId()));
        }
        return movies;
    }

    @Override
    public Movie ToUpdateselctMovieById(Integer id) {

        System.out.println("service查询");
        return  movieDao.selectMovieById(id);
    }

    @Override
    public String getMovieNameById(Integer movieId) {
        return movieDao.getMovieNameById(movieId);
    }

    @Override
    public Map<Integer, String> getAllMovieName() {
        Map<Integer, String> id_name=new HashMap<>();
        List<Object[]> list=movieDao.getAllMovieName();
        for (Object[] object:list){
            for(int i=0;i<object.length;i+=2){
                id_name.put((Integer) object[i],(String)object[i+1]);
            }
        }
        return id_name;
    }

    @Override
    public boolean deleteMovies(Integer[] ids) {
        return movieDao.deleteMovies(ids);
    }
     @Override
    public List<Integer> getCommentScore(int id){
        return movieDao.getCommentScore(id);
    }


    public List<Labelmapping> getLabels(int movieId){
        return(movieDao.getLabels(movieId));
    }
}
