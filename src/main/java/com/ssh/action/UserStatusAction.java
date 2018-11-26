package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.service.UserStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
@Controller("userStatus")
public class UserStatusAction extends ActionSupport{

    @Resource(name="userStatusService")
    private UserStatusService userStatusService;

    private int userId;
    private int days;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public String insertForbiddenWords(){
        userStatusService.insertForbiddenWords(userId,days);
        return "forbidden";
    }
}
