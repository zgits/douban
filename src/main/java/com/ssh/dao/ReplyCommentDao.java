package com.ssh.dao;

import com.ssh.model.Replycomment;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public interface ReplyCommentDao {

    /**
     * 插入数据库回复内容
     * @param replycomment
     * @return
     */
    public boolean insertReplyComment(Replycomment replycomment);

    /**
     * 查询某条评论下的所有回复
     * @param comment_id
     * @return
     */
    public List<Replycomment> selectReplyComment(Integer comment_id);

    /**
     * 删除某条评论下的回复
     * @param id
     * @return
     */
    public boolean deleteReplyComment(Integer id);
}
