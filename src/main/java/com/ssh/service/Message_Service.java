package com.ssh.service;

import com.ssh.model.PageBean;
import com.ssh.model.Tips_message;

import java.util.List;

public interface Message_Service {
    public List<Tips_message> getMessage(int id);

    public PageBean<Tips_message> findMessage(int trailerId,int status,Integer currPage);

    public int updateMessage(Integer[] ids);

    public int deleteMessage(Integer[] ids);
}
