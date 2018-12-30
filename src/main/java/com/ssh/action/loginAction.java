package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ssh.model.User;
import com.ssh.model.UserLogin;
import com.ssh.service.loginService;
import com.ssh.util.JWT;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.net.ssl.SSLEngine;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Controller("login")
public class loginAction extends ActionSupport  {

    @Autowired
    private loginService loginservice;


    String username;

    String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public void login() throws IOException {

        String data="";
        if(username.equals("admin")&&password.equals("admin")){

            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute("adminname","admin");
            session.setMaxInactiveInterval(0);

            data= JSON.toJSONString(0);//设置返回数据为0代表管理员登录

            System.out.println("管理员登录");

        } else if(loginservice.checkUsername(username)){

            Integer id=loginservice.login(username,password);

            if(id>0){
                //用户正确登录的情况下
                //设置24小时过期
                String token=JWT.sign(id,86400);
                System.out.println(token);

                JSONArray arr=new JSONArray();

                JSONObject ob=new JSONObject();

                ob.put("flag",1);
                ob.put("id",id);
                ob.put("token",token);

                arr.add(ob);

                JSONObject object=new JSONObject();

                object.put("data",arr);

                data=object.toString();
                System.out.println("用户登录");

            }else{
                //用户名或密码不正确
                data=JSON.toJSONString(2);//设置返回数据为2代表用户名或密码错误
                System.out.println("用户登录失败");
            }

        }else{
            //用户名不存在的情况
            data=JSON.toJSONString(3);//设置返回数据3代表用户名不存在的情况
            System.out.println("用户不存在");
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(data);

        writer.flush();

        writer.close();


    }

    String phone="";

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void checkUsername() throws IOException {
        boolean data=true;
        //用户名存在，checkUsername为true
        if(loginservice.checkUsername(username)) {
            System.out.println(username);

            data =false;//代表用户名存在
            System.out.println("用户名已存在");
        }
        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(JSON.toJSONString(data));

        writer.flush();

        writer.close();
    }

    public void checkPhone() throws IOException {
        boolean data=true;
        if(loginservice.checkPhone(phone)) {

            data =false;//代表手机号已存在

        }
        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(JSON.toJSONString(data));

        writer.flush();

        writer.close();
    }

    public void register() throws IOException {
        String data="";


        if(!phone.equals("")&&!username.equals("")&&!password.equals("")){
            if (loginservice.register(phone, username, password)) {
                data = JSON.toJSONString(3);//代表注册成功
            } else {
                data = JSON.toJSONString(4);//代表注册失败
            }
        }else{
            data = JSON.toJSONString(4);//代表注册失败
        }


        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(data);

        writer.flush();

        writer.close();
    }

    //implements ModelDriven<UserLogin>

//    public String loginhtml() {
////        loginservice.login(1);
//        return "login";
//    }
//    public String registerhtml() {
////        loginservice.login(1);
//        return "register";
//    }
//    public String bgmainjsp() {
////        loginservice.login(1);
//        return "adminmain";
//    }
//    public String mainjsp() {
////        loginservice.login(1);
//        return "usermain";
//    }
//    public void login() {
//        HttpServletResponse response = ServletActionContext.getResponse();
//        User user2 = loginservice.login(user1.getEmail(), user1.getPassword());
//        String s = JSONObject.toJSONString(user2);
//        //s+= JWT.sign(user2,360000);
////        JSONObject jsonObject = JSONObject.parseObject(user2.toString());
//        try {
////            String s = jsonObject.toJSONString();
//            response.getWriter().write(s);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//    public void register() {
//        HttpServletResponse response = ServletActionContext.getResponse();
//        int flag = loginservice.register(user1.getEmail(), user1.getPassword(),user1.getUsername());
//        String returndata = "{\"flag\":\"" + flag+"\"}";
//        JSONObject jsonObject = JSONObject.parseObject(returndata);
//        try {
//            String s = jsonObject.toJSONString();
//            response.getWriter().write(s);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Override
//    public UserLogin getModel() {
//        return user1;
//    }
}
