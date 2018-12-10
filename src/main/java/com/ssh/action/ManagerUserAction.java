package com.ssh.action;

import com.alibaba.fastjson.JSON;
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
        PageBean<User> pageBean = managerUserService.getUsers(currPage);
        ActionContext.getContext().put("pageBean",pageBean);
        return "findAll";
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
