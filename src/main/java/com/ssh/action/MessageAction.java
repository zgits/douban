package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.ssh.model.PageBean;
import com.ssh.model.Tips_message;
import com.ssh.service.Message_Service;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller("getMessage")
public class MessageAction {
    @Autowired
    private Message_Service message_service;

    private int id;
    private int currpage=1;
    private Integer[] ids;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public int getCurrpage() {
        return currpage;
    }

    public void setCurrpage(int currpage) {
        this.currpage = currpage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    /**
     * 显示所有未读信息
     * @return
     */
    public String getMessage(){
        List<Tips_message> messages= message_service.getMessage(id);
        ActionContext.getContext().put("messages",messages);
        return "success";
    }
    /**
     * 分页显示未阅读的信息
     */
    public String getMessages(){
        int status=1;
        PageBean pageBean=message_service.findMessage(id,status,currpage);
        if(pageBean!=null){
            System.out.println("成功取得第"+currpage+"页的数据,数据为：\r\n"+pageBean);
        }else{
            System.out.println("查询失败...");
        }
        System.out.println(pageBean);
        ActionContext.getContext().put("pagebeans",pageBean);
        return "success";
    }

    public String getCountMessages() throws IOException{
        String flag="";
        int status=1;
        try {
            PageBean pageBean = message_service.findMessage(id, status, currpage);
            int count = pageBean.getTotalCount();
            System.out.println("count="+count);
            flag = JSON.toJSONString(count);//使用fastjson将数据转换成json格式
        }catch (Exception e){
            System.out.println("获取消息数量失败");
        }
        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();

        return null;

    }


    /**
     * 分页显示已阅读信息
     */
    public String UserMessage(){
        int status=2;
        PageBean pageBean=message_service.findMessage(id,status,currpage);
        if(pageBean!=null){
            System.out.println("成功取得第"+currpage+"页的数据,数据为：\r\n"+pageBean);
        }else{
            System.out.println("查询失败...");
        }
        ActionContext.getContext().put("pagebeans",pageBean);
        return "success";
    }
    /**
     * 将消息标记为已读
     */
    public String updateMessage(){
        int count=message_service.updateMessage(ids);
        System.out.println(count);
        return  "success";
    }

    /**
     * 删除消息
     */
    public String deleteMessage() throws IOException {
        String flag="";
        try {
            int count=message_service.deleteMessage(ids);

            flag = JSON.toJSONString(1);
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();


        return  "success";
    }
}
