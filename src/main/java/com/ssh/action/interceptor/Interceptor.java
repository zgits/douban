package com.ssh.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

/**
 * Created by 幻夜~星辰 on 2018/12/17.
 */
public class Interceptor extends MethodFilterInterceptor{


    /**
     * 登录拦截器，后台登录
     * @param actionInvocation
     * @return
     * @throws Exception
     */
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {

        //获取在session中的管理员名字，登录之后就有，没有登录就没有
        String admin= (String) ServletActionContext.getRequest().getSession().getAttribute("adminname");
        System.out.println(admin);

        if(admin!=null){
            return actionInvocation.invoke();
        }else{
            ActionSupport actionSupport= (ActionSupport) actionInvocation.getAction();
            actionSupport.addActionError("请先登录");
            System.out.println("后台执行了登录拦截");
            return ActionSupport.LOGIN;
        }
    }
}
