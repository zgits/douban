package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.service.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Controller("login")
public class loginAction extends ActionSupport{


    @Autowired
    private loginService loginservice;

    public String login(){
        loginservice.login(1);
        System.out.println("testsss");
        System.out.println("testsss");
        System.out.println("testsss");
        System.out.println("testsss");
        System.out.println("testsss");
        System.out.println("testsss");
        return "index";
    }

}
