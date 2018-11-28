package com.ssh.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 * <p>
 * 分页实体类，可用于其它Javabean的封装
 */
public class PageBean<T> implements Serializable {

    private int currPage;//当前页数

    private int pageSize;//每页显示记录数

    private int totalCount;//总记录数

    private int totalPage;//总页数

    private List<T> lists;

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {

        return totalPage;

    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getLists() {
        return lists;
    }

    public void setLists(List<T> lists) {
        this.lists = lists;
    }
}
