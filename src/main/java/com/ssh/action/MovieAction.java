package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.*;
import com.ssh.service.MovieServie;
import com.ssh.util.MovieByDate;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Controller("MovieAction")
public class MovieAction extends ActionSupport {

    @Autowired
    private MovieServie movieServie;


    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    private Movie movie;


    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    /********通过id获取电影信息,用于单击超链接时用*************/
    public String getMovieById() {
        System.out.println(id);
        int count = 0;
        try {
            Movie movie = movieServie.selctMovieById(id);
            List<Integer> scores = movieServie.getCommentScore(id);
            List<Labelmapping> labels = movieServie.getLabels(id);
            count = scores.size();
            ActionContext.getContext().put("oneMovie", movie);
            ActionContext.getContext().put("scores", scores);
            ActionContext.getContext().put("Counts", count);
            ActionContext.getContext().put("labels", labels);
            return "moviedetail";
        } catch (Exception e) {
            return null;
        }

    }

    /*********end************/

    /*********增加电影信息***********/
    private Integer[] labelids;

    public Integer[] getLabelids() {
        return labelids;
    }

    public void setLabelids(Integer[] labelids) {
        this.labelids = labelids;
    }

    public void addMovie() throws IOException {
        System.out.println(movie);
        String flag = "";
        List<Labelmapping> labelmappings = new ArrayList<>();
        try {
            for (Integer id : labelids) {
                Labelmapping labelmapping = new Labelmapping();
                labelmapping.setLabelId(id);
                labelmappings.add(labelmapping);
            }
            movie.setLabelmappings(labelmappings);
            movieServie.insertMovie(movie);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }
    /***********end************/

    /******修改电影信息*******/
    //在修改电影信息时，先获取原来的电影信息，转成特定格式
    public void getMovieToUpdate() throws IOException {

        String movie = "";
        try {
            movie = JSON.toJSONString(movieServie.ToUpdateselctMovieById(id));//使用fastjson将数据转换成json格式

        } catch (Exception e) {
            movie = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        System.out.println(movie);

        writer.write(movie);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    public void updateMovie() throws IOException {
        String flag = "";
        System.out.println("修改的信息" + movie);
        List<Labelmapping> labelmappings = new ArrayList<>();
        try {
            for (Integer id : labelids) {
                Labelmapping labelmapping = new Labelmapping();
                labelmapping.setLabelId(id);
                labelmappings.add(labelmapping);
                System.out.println("修改的分类的id" + id);
            }
            movie.setLabelmappings(labelmappings);
            if (movieServie.updateMovie(movie)) {
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            } else {
                flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        } catch (Exception e) {
            e.printStackTrace();
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }


        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    /*******end******/


    /********删除电影信息********/


    public void deleteMovie() throws IOException {
        String flag = "";
        try {
            if (movieServie.deleteMovie(id)) {
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            } else {
                flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }


        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }
    /********end********/

    /*********查询电影信息************/

    private Integer currPage = 1;

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    //点击页面时所用，即全部
    public String getAllMovies() throws IOException {

        List<Movie> movies = new ArrayList<>();
        try {
            PageBean<Movie> moviePageBean = movieServie.seleceMovie(currPage);
            movies = moviePageBean.getLists();
        } catch (Exception e) {

        }
        if (movies != null) {
            System.out.println("成功取得" + movies.size() + "条数据...");
        } else {
            System.out.println("查询失败...");
        }
        JSONArray arr = new JSONArray();
        //判定最大的读取个数
        //读取数据
        for (Movie movie : movies) {
            JSONObject ob = new JSONObject();
            //将单独的数据装进json数据
            ob.put("id", movie.getId());
            ob.put("moviename", movie.getMoviename());
            ob.put("release_time", movie.getRelease_time());
            String trailername = "";
            for (Trailer trailer : movie.getTrailers()) {
                trailername += trailer.getName() + "<br>";
            }
            System.out.println("预告片名字合集" + trailername);
            String imageName = "";
            for (Image image : movie.getImages()) {
                imageName += image.getName() + "<br>";
            }
            ob.put("trailer", trailername);
            ob.put("image", imageName);
            //装进数组
            arr.add(ob);
        }
        JSONObject ob = new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", movies.size());
        String returndata = ob.toString();
        System.out.println("成功转换" + returndata.length() + "大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out = ServletActionContext.getResponse().getWriter();
            out.println(returndata);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";

    }

    private String movieName;

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    //通过搜索电影名查看电影信息
    public void getMoviesByName() {
        movieServie.selectMovieByName(movieName, currPage);
    }

    //主页面显示正在热映影片
    public String getMoving() {
        List<Movie> movies = movieServie.selectMoving();
        ActionContext.getContext().put("movies", movies);
        return "getMoving";
    }
    /*********end************/


    /************得到所有电影名******************/
    public String getAllMovieName() {

        Map<Integer, String> id_name = new HashMap<>();
        try {
            id_name = movieServie.getAllMovieName();
        } catch (Exception e) {

        }
//      session.setAttribute("allsoft", allsoft);
        if (id_name != null) {
            System.out.println("成功取得" + id_name.size() + "条数据...");
        } else {
            System.out.println("查询失败...");
        }
//      System.out.println("softInfo"+allsoft);
        JSONArray arr = new JSONArray();
        //判定最大的读取个数
        //读取数据
        for (Map.Entry<Integer, String> entry : id_name.entrySet()) {
            JSONObject ob = new JSONObject();
            //将单独的数据装进json数据
            System.out.println("key值：" + entry.getKey() + " value值：" + entry.getValue());
            ob.put("id", entry.getKey());
            ob.put("moviename", entry.getValue());
            //装进数组
            arr.add(ob);
        }
        JSONObject ob = new JSONObject();
        //放置数据
        ob.put("data", arr);
        //放置所有的数据个数
        String returndata = ob.toString();
        System.out.println("成功转换" + returndata.length() + "大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out = ServletActionContext.getResponse().getWriter();
            out.write(returndata);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";

    }

    /*************得到所有电影名end**************/

    private Integer[] ids;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public void deleteMovies() throws IOException {
        String flag = "";
        try {
            if (movieServie.deleteMovies(ids)) {
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
                System.out.println("成功");
            } else {
                flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }

        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        writer.flush();

        writer.close();

    }

    /**
     * 根据分数排序
     *
     * @return
     */
    public String getMovieByScore() {

        List<Movie> list = movieServie.selectAllMovies();
        System.out.println("排序前");
        for (Movie movie : list) {
            System.out.println(movie.getFilmscore());
            if (movie.getFilmscore() == null) {
                movie.setFilmscore(Float.parseFloat("0"));
            }
        }
        Collections.sort(list);
        System.out.println("排序后");
        for (Movie movie : list) {
            System.out.println(movie.getFilmscore());
        }
        ActionContext.getContext().put("rankingmovie", list);
        return "rankingScore";
    }

    /**
     * @return
     */
    public String getMovieByDate() {
        List<Movie> list = movieServie.movieSortByDate();
        System.out.println("排序前");
        for (Movie movie : list) {
            System.out.println(movie.getFilmscore());
            if (movie.getFilmscore() == null) {
                movie.setFilmscore(Float.parseFloat("0"));
            }
        }
        System.out.println("排序后");
        for (Movie movie : list) {
            System.out.println(movie.getFilmscore());
        }
        ActionContext.getContext().put("rankingmovie", list);
        return "rankingDate";
    }

    private String labels;

    public String getLabels() {
        return labels;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public void getMoviesByLabel() throws IOException {


        System.out.println("传递的参数"+labels);

        List<Label> labels1=new ArrayList<>();
        labels1 = JSONObject.parseArray(labels, Label.class);
        for(Label label:labels1){
            System.out.println("转换后的数据："+label.getId());
        }



        String data = "";
        List<Movie> movies;

        try{
            movies=movieServie.getMoviesByLabel(labels1);
            data=JSON.toJSONString(movies);
        }catch (Exception e){

        }

        System.out.println("结果" + data);
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(data);

        writer.flush();

        writer.close();

    }


}
