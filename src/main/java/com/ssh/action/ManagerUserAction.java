package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ssh.model.PageBean;
import com.ssh.model.User;
import com.ssh.service.ManagerUserService;
import com.ssh.service.loginService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 * <p>
 * 后台对用户的管理的action
 */
@Controller("ManagerUser")
public class ManagerUserAction extends ActionSupport {


    @Autowired
    private ManagerUserService managerUserService;


    @Autowired
    private loginService loginService;

    //当前页数
    private Integer currPage = 1;

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    /**
     * 分页查询用户
     *
     * @return
     */
    public String findAll() {

        System.out.println("已经进来了...");

        List<User> users = new ArrayList<>();
        try {
            PageBean<User> pageBean = managerUserService.getUsers(currPage);
            users = pageBean.getLists();
        } catch (Exception e) {

        }
        if (users != null) {
            System.out.println("成功取得" + users.size() + "条数据...");
        } else {
            System.out.println("查询失败...");
        }
        JSONArray arr = new JSONArray();

        //读取数据
        for (User user : users) {
            JSONObject ob = new JSONObject();
            //将单独的数据装进json数据
            ob.put("id", user.getId());
            ob.put("username", user.getUsername());
            ob.put("phone", user.getPhone());
            ob.put("password", user.getPassword());
            ob.put("endtime", user.getEndTime());
            ob.put("last_login", user.getLast_login());
            //装进数组
            arr.add(ob);
        }
        JSONObject ob = new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", users.size());
        String returndata = ob.toString();
        System.out.println("成功转换" + returndata.length() + "大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out = ServletActionContext.getResponse().getWriter();
            out.println(returndata);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

    /*********禁言用户start***********/
    private Integer id;

    private Integer days;

    private String reason;

    public Integer getId() {
        return id;
    }

    public Integer getDays() {
        return days;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public void insertForbidden() throws IOException {
        String flag = "";
        try {
            managerUserService.insertForbiddenWords(id, days, reason);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式

        } catch (Exception e) {

            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }
        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();


    }

    /**********禁言用户end************/

    /*******解禁用户start*********/
    public void deleteForbidden() throws IOException {
        String flag = "";
        try {

            managerUserService.deleteForbidden(id);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }


        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    /*******解禁用户end*********/

    /*********删除用户start***********/
    public void deleteUser() throws IOException {
        String flag = "";
        try {
            managerUserService.deleteUser(id);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();

    }
    /*********删除用户end*************/

    /*******通过用户名查找用户start*********/
    private String username;

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void getUsers() {
        managerUserService.selectUserByName(username, currPage);
    }
    /*******通过用户名查找用户end*********/


    /**
     * 批量删除用户
     */
    private Integer[] ids;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public void deleteUsers() throws IOException {
        String flag = "";
        try {
            if (managerUserService.deleteUsers(ids)) {
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            } else {
                flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }

        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    public void getUserByIdTopersonInfo() throws IOException {
        String user = "";

        try {

            user = JSON.toJSONString(managerUserService.getUserByIdToPersonInfo(id));//使用fastjson将数据转换成json格式


        } catch (Exception e) {

        }

        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(user);

        System.out.println("成功");

        writer.flush();

        writer.close();

    }

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void updateUser() throws IOException {
        String flag = "";//1，代表用户名存在，2代表手机号存在，3代表修改成功，4代表修改失败
        System.out.println(user);
        try {
            String oldusername = managerUserService.getUsername(user.getId());
            String oldphone = managerUserService.getPhoneById(user.getId());

            System.out.println(oldphone+oldusername);

            if (oldusername.equals(user.getUsername()) && oldphone.equals(user.getPhone())) {
                //代表修改个人简介,不用验证用户名和手机号
                if (managerUserService.updateUser(user)) {
                    flag = JSON.toJSONString(3);
                } else {
                    flag = JSON.toJSONString(4);
                }
            } else if (!oldusername.equals(user.getUsername()) && oldphone.equals(user.getPhone())) {
                //代表修改用户名，需要验证用户名是否存在
                if (loginService.checkUsername(user.getUsername())) {
                    flag = JSON.toJSONString(1);
                } else if (managerUserService.updateUser(user)) {
                    flag = JSON.toJSONString(3);
                } else {
                    flag = JSON.toJSONString(4);
                }
            } else if (oldusername.equals(user.getUsername()) && !oldphone.equals(user.getPhone())) {
                //代表修改手机号，需要验证手机号是否存在
                System.out.println("修改手机号");
                if (loginService.checkPhone(user.getPhone())) {
                    flag = JSON.toJSONString(2);
                } else if (managerUserService.updateUser(user)) {
                    flag = JSON.toJSONString(3);
                } else {
                    flag = JSON.toJSONString(4);
                }
            } else if (!oldusername.equals(user.getUsername()) && !oldphone.equals(user.getPhone())) {
                //代表修改用户名和手机号，都需要验证
                if (loginService.checkUsername(user.getUsername())) {
                    flag = JSON.toJSONString(1);
                } else if (loginService.checkPhone(user.getPhone())) {
                    flag = JSON.toJSONString(2);
                } else if (managerUserService.updateUser(user)) {
                    flag = JSON.toJSONString(3);
                } else {
                    flag = JSON.toJSONString(4);
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
            flag = JSON.toJSONString(4);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);


        writer.flush();

        writer.close();
    }

    String oldpassword;

    String password;

    public String getOldpassword() {
        return oldpassword;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void upwd() throws IOException {

        String flag = "";
        try {
            User user = managerUserService.getUserByIdToPersonInfo(id);
            if (!user.getPassword().equals(oldpassword)) {
                flag = JSON.toJSONString(1);
            } else if (managerUserService.updatePassword(id, password)) {
                flag = JSON.toJSONString(2);
            } else {
                flag = JSON.toJSONString(4);
            }

        } catch (Exception e) {
            flag = JSON.toJSONString(4);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);


        writer.flush();

        writer.close();
    }
}
