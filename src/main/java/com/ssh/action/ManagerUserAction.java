package com.ssh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ssh.model.PageBean;
import com.ssh.model.User;
import com.ssh.service.ManagerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
    private Integer id=4;

    private Integer days=20;

    private String reason="5454";

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public String insertForbidden(){
        managerUserService.insertForbiddenWords(id,days,reason);
        return "success";
    }

    /**********禁言用户end************/

    /*******解禁用户start*********/
    public void deleteForbidden(){
        managerUserService.deleteForbidden(id);
    }

    /*******解禁用户end*********/

    /*********删除用户start***********/
    public void deleteUser(){
        managerUserService.deleteUser(id);
    }
    /*********删除用户end*************/

    /*******通过用户名查找用户start*********/
    private String username;

    public void setUsername(String username) {
        this.username = username;
    }

    public void getUsers(){
        managerUserService.selectUserByName(username,currPage);
    }
    /*******通过用户名查找用户end*********/


}
