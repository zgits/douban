package com.ssh.service.impl;

import com.ssh.dao.Tips_messageDao;
import com.ssh.model.PageBean;
import com.ssh.model.Tips_message;
import com.ssh.service.Message_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("MessageService")
public class Message_ServiceImpl implements Message_Service {

    @Autowired
    private Tips_messageDao tips_messageDao;

    @Override
    public List<Tips_message> getMessage(int id){
        return tips_messageDao.getMessage(id);
    }

    @Override
    public PageBean<Tips_message> findMessage(int userId,int status, Integer currPage) {
        PageBean<Tips_message> pageBean = new PageBean<Tips_message>();
        // 封装当前页数
        pageBean.setCurrPage(currPage);
        // 封装每页记录数
        int pageSize = 5;
        //封装消息状态
        //int status=1;
        pageBean.setPageSize(pageSize);
        // 封装总记录数
        int totalCount = tips_messageDao.getCountMessage(userId,status);
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
        List<Tips_message> list = tips_messageDao.findMessage(userId,status,begin, pageSize);
        pageBean.setLists(list);
        return pageBean;
    }

    @Override
    public int updateMessage(Integer[] ids) {
        int count=tips_messageDao.updateStatus(ids);
        return count;
    }
    public int deleteMessage(Integer[] ids){
        int count=tips_messageDao.deleteMessage(ids);
        return count;
    }
}
