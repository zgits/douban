package com.ssh.dao;

import com.ssh.model.Tips_message;

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
}
