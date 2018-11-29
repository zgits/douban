package com.ssh.service.impl;

import com.ssh.dao.ManagerUserDao;
import com.ssh.model.PageBean;
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
        List<User> list = managerUserDao.getAllUser(begin, pageSize);

        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public boolean insertForbiddenWords(int userId, int days) {
        User user=new User();
        user.setId(userId);
        user.setDays(days);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        user.setStartTime(new Date());
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DATE, days);//
        user.setEndTime(ca.getTime());
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



}
