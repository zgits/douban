package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.stereotype.Controller;

/**
 * Created by 幻夜~星辰 on 2018/12/20.
 */
@Controller("background")
public class backgroundAction extends ActionSupport{

    public String goToBackground(){
        return "success";
    }
}
