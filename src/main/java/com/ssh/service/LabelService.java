package com.ssh.service;

import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
public interface LabelService {


    /**
     * 得到分类为添加电影所用
     * @return
     */
    public Map<Integer,String> getAllLabelsToAddMovie();
}
