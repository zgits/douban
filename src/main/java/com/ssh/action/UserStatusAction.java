package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.service.UserStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
@Controller("userStatus")//方便在struts中，action中的class直接定义为userStatus，
public class UserStatusAction extends ActionSupport{

    /**
     * 通过spring获得service接口，即服务接口
     */
    @Resource(name="userStatusService")
    private UserStatusService userStatusService;

    /**
     * 需要的参数，改方法
     */
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

    /**
     * action的方法
     * @return
     */
    public String insertForbiddenWords(){
        userStatusService.insertForbiddenWords(userId,days);
        return "forbidden";
    }
}
