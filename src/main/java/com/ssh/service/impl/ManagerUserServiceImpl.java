package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.dao.Tips_messageDao;
import com.ssh.model.PageBean;
import com.ssh.model.Tips_message;
import com.ssh.model.User;
import com.ssh.service.ManagerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
@Service("ManagerUserService")
public class ManagerUserServiceImpl implements ManagerUserService{

    @Autowired
    private ManagerUserDao managerUserDao;

    @Autowired
    private Tips_messageDao tips_messageDao;


    @Override
    public boolean deleteUser(Integer id) {
        return managerUserDao.deleteUser(id);
    }

    @Override
    public PageBean<User> getUsers(Integer currPage) {
        PageBean<User> pageBean = new PageBean<User>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = managerUserDao.getUserCount();
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;

        //后台取消了分页，改为前端使用分页，对于管理员管理用户，
        //原参数：begin, pageSize
        List<User> list = managerUserDao.getAllUser();

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public boolean insertForbiddenWords(int userId, int days,String reason) {
        User user=new User();
        user.setId(userId);
        user.setDays(days);
        user.setReason(reason);
        user.setStartTime(new Date());
        System.out.println(user.getStartTime());
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DATE, days);//
        user.setEndTime(ca.getTime());

        /**
         * 以下是设置消息提醒的
         */
        String username="系统";
        Tips_message tips_message=new Tips_message();
        tips_message.setSender(username);
        tips_message.setMessage_status(1);//默认未读
        tips_message.setUserId(userId);//设置接收者的id
        tips_message.setTime(new Date());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        tips_message.setMessage("系统消息：您由于"+reason+"原因已被系统禁言"+days+"天,于"+sdf.format(ca.getTime())+"解禁" );//设置为回复内容
        tips_messageDao.insertMessage(tips_message);

        return managerUserDao.insertForbiddenWords(user);
    }

    @Override
    public boolean deleteForbidden(Integer id) {
        return managerUserDao.deleteForbidden(id);
    }

    @Override
    public Date selectEndTime(Integer id) {
        return managerUserDao.selectEndTime(id);
    }

    @Override
    public PageBean<User> selectUserByName(String username, Integer currPage) {
        PageBean<User> pageBean = new PageBean<User>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = managerUserDao.getUserCountByName(username);
        pageBean.setTotalCount(totalCount);
        // 封装页数
        int totalPage;
        if(totalCount%pageSize == 0){
            totalPage = totalCount/pageSize;
        }else{
            totalPage = totalCount/pageSize+1;
        }
        pageBean.setTotalPage(totalPage);
        // 封装当前页记录
        int begin= (currPage - 1)*pageSize;
        List<User> list = managerUserDao.selectUserByName(username,begin, pageSize);

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public String getUsername(Integer id) {
        return managerUserDao.getUserName(id);
    }

    @Override
    public boolean deleteUsers(Integer[] ids) {
        System.out.println("批量删除用户中的ids"+ids);
        return managerUserDao.deleteUsers(ids);
    }

    @Override
    public User getUser(int id) {
        User user=managerUserDao.getUserById(id);
        return user;
    }
    @Override
    public User getUserByIdToPersonInfo(Integer id) {
        return managerUserDao.getUserByIdToPerson(id);
    }

    @Override
    public boolean updateUser(User user) {
        return managerUserDao.updateUser(user);
    }

    @Override
    public boolean updatePassword(Integer id, String password) {
        return managerUserDao.updatePassword(id,password);
    }

    @Override
    public String getPhoneById(Integer id) {
        return managerUserDao.getPhoneById(id);
    }


}
