package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ssh.model.PageBean;
import com.ssh.model.User;
import com.ssh.service.ManagerUserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 *
 * 后台对用户的管理的action
 */
@Controller("ManagerUser")
public class ManagerUserAction extends ActionSupport {


    @Autowired
    private ManagerUserService managerUserService;

    //当前页数
    private Integer currPage=1;

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    /**
     * 分页查询用户
     * @return
     */
    public String findAll(){

        System.out.println("已经进来了...");

        List<User> users=new ArrayList<>();
        try{
            PageBean<User> pageBean = managerUserService.getUsers(currPage);
            users=pageBean.getLists();
        }catch (Exception e){

        }
        if(users!=null){
            System.out.println("成功取得"+users.size()+"条数据...");
        }else{
            System.out.println("查询失败...");
        }
        JSONArray arr=new JSONArray();

        //读取数据
        for(User user:users){
            JSONObject ob=new JSONObject();
            //将单独的数据装进json数据
            ob.put("id", user.getId());
            ob.put("username", user.getUsername());
            ob.put("email", user.getEmail());
            ob.put("password",user.getPassword());
            ob.put("endtime",user.getEndTime());
            ob.put("last_login",user.getLast_login());
            //装进数组
            arr.add(ob);
        }
        JSONObject ob=new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", users.size());
        String returndata=ob.toString();
        System.out.println("成功转换"+returndata.length()+"大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out=ServletActionContext.getResponse().getWriter();
            out.println(returndata);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

    /*********禁言用户start***********/
    private Integer id;

    private Integer days;

    private String reason;

    public Integer getId() {
        return id;
    }

    public Integer getDays() {
        return days;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public void insertForbidden() throws IOException {
        String flag ="";
        try{
            managerUserService.insertForbiddenWords(id,days,reason);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式

        }catch (Exception e){

            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }
        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();


    }

    /**********禁言用户end************/

    /*******解禁用户start*********/
    public void deleteForbidden() throws IOException {
       String flag="";
        try{

            managerUserService.deleteForbidden(id);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }


        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    /*******解禁用户end*********/

    /*********删除用户start***********/
    public void deleteUser() throws IOException {
        String flag ="";
        try{
            managerUserService.deleteUser(id);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();

    }
    /*********删除用户end*************/

    /*******通过用户名查找用户start*********/
    private String username;

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void getUsers(){
        managerUserService.selectUserByName(username,currPage);
    }
    /*******通过用户名查找用户end*********/



}
