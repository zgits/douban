package com.ssh.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by 幻夜~星辰 on 2018/12/27.
 */
public class UserInterceptor extends MethodFilterInterceptor {


    /**
     * 登录拦截器，后台登录
     * @param actionInvocation
     * @return
     * @throws Exception
     */
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {

        //获取在session中的用户名字，登录之后就有，没有登录就没有
        String username= (String) ServletActionContext.getRequest().getSession().getAttribute("username");

        String admin= (String) ServletActionContext.getRequest().getSession().getAttribute("adminname");

        if(username!=null||admin!=null){
            return actionInvocation.invoke();
        }else{
            ActionSupport actionSupport= (ActionSupport) actionInvocation.getAction();
            actionSupport.addActionError("请先登录");
            System.out.println("前台执行了登录拦截");


//            HttpServletResponse response = ServletActionContext.getResponse();
//            response.setContentType("text/html;charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.println("请先登录");//返回的字符串数据

            return ActionSupport.LOGIN;
            //null;
        }
    }
}

