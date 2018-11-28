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
 */
@Controller("ManagerUser")
public class ManagerUserAction extends ActionSupport {


    private User user=new User();

    @Autowired
    private ManagerUserService managerUserService;



    //当前页数
    private Integer currPage=1;

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    /**
     * 分页查询部门
     * @return
     */
    public String findAll(){
        PageBean<User> pageBean = managerUserService.getUsers(currPage);
        ActionContext.getContext().put("pageBean",pageBean);
        return "findAll";
    }
}
