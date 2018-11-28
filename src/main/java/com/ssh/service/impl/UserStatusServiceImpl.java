package com.ssh.service.impl;

import com.ssh.dao.UserStatusDao;
import com.ssh.model.UserStatus;
import com.ssh.service.UserStatusService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */

/**
 * 实现业务逻辑处理接口
 */
@Service("userStatusService")//通过注解的方式，同样交给spring进行管理，
public class UserStatusServiceImpl implements UserStatusService{

    /**
     * 通过spring注解方式获得一个对象，Resource表示通过名字
     */
    @Resource
    private UserStatusDao userStatusDao;

    /**
     * 插入禁言信息的业务处理接口的实现方法
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

        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DATE, days);// num为增加的天数，可以改变的


        userStatus.setEndTime(ca.getTime());

        System.out.println(userStatus);
        userStatusDao.insertForbiddenWords(userStatus);
//            return true;
//        }

        return false;
    }

    @Override
    public boolean deleteForbidden(Integer id) {
        return userStatusDao.deleteForbidden(id);
    }
}
