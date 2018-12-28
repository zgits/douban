package com.ssh.dao;

import com.ssh.model.Tips_message;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 *
 * 这个是有人回复的时候，向被回复人发送消息，即在消息提醒的表中插入数据
 */
public interface Tips_messageDao {

    /**
     * 有人回复时，将回复的消息插入到数据库中
     * @param tips_message
     * @return
     */
    public boolean insertMessage(Tips_message tips_message);

/**
 * 查看在线消息
 */
public List<Tips_message> getMessage(int id);

/**
 * 删除信息
 */
public int deleteMessage(Integer[] ids);

/**
 * 分页信息数量
 */
public Integer getCountMessage(int userId,int status);

/**
 * 查询分页的消息
 */

public List<Tips_message> findMessage(Integer userId, int status,int begin, int pageSize);
/**
 * 更改消息状态
 */
public int  updateStatus(Integer[] ids);
}
