package com.ssh.service;

import com.ssh.model.Trailer_Replycomment;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public interface Trailer_ReplyCommentService {

    /**
     * 添加评论的或者回复的回复内容
     * @param trailer_replycomment
     * @return
     */
    public boolean insertReplyComment(Trailer_Replycomment trailer_replycomment);

    /**
     * 查询某条评论下的所有回复
     * @param comment_id
     * @return
     */
    public List<Trailer_Replycomment> selectReplyComment(Integer comment_id);

    /**
     * 删除某条评论下的回复
     * @param id
     * @return
     */
    public boolean deleteReplyComment(Integer id);
}
