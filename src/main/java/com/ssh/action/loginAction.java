package com.ssh.action;

import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ssh.model.User;
import com.ssh.model.UserLogin;
import com.ssh.service.loginService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Controller("login")
public class loginAction extends ActionSupport implements ModelDriven<UserLogin> {
    private UserLogin user1 = new UserLogin();

    @Autowired
    private loginService loginservice;

    public String loginhtml() {
//        loginservice.login(1);
        return "login";
    }
    public String registerhtml() {
//        loginservice.login(1);
        return "register";
    }
    public String bgmainjsp() {
//        loginservice.login(1);
        return "adminmain";
    }
    public String mainjsp() {
//        loginservice.login(1);
        return "usermain";
    }
    public void login() {
        HttpServletResponse response = ServletActionContext.getResponse();
        User user2 = loginservice.login(user1.getEmail(), user1.getPassword());
        String s = JSONObject.toJSONString(user2);
//        JSONObject jsonObject = JSONObject.parseObject(user2.toString());
        try {
//            String s = jsonObject.toJSONString();
            response.getWriter().write(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void register() {
        HttpServletResponse response = ServletActionContext.getResponse();
        int flag = loginservice.register(user1.getEmail(), user1.getPassword(),user1.getUsername());
        String returndata = "{\"flag\":\"" + flag+"\"}";
        JSONObject jsonObject = JSONObject.parseObject(returndata);
        try {
            String s = jsonObject.toJSONString();
            response.getWriter().write(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public UserLogin getModel() {
        return user1;
    }
}
