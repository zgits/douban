package com.ssh.service.impl;

import com.ssh.dao.UserStatusDao;
import com.ssh.model.UserStatus;
import com.ssh.service.UserStatusService;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
public class UserStatusServiceImpl implements UserStatusService{

    @Autowired
    private UserStatusDao userStatusDao;

    /**
     * 插入禁言信息的业务处理接口
     * @param userId,days
     * @return
     */
    @Override
    public boolean insertForbiddenWords(int userId,int days) {

        UserStatus userStatus=new UserStatus();
        userStatus.setUserId(userId);
        userStatus.setDays(days);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        userStatus.setStartTime(new Date());// new Date()为获取当前系统时间

//        userStatus.setEndTime(new Date()+days);

        if (userStatusDao.insertForbiddenWords(userStatus)!=0){
            return true;
        }

        return false;
    }
}
