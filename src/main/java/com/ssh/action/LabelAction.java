package com.ssh.action;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Label;
import com.ssh.service.LabelService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
@Controller("Label")
public class LabelAction extends ActionSupport {

    @Autowired
    private LabelService labelService;

    public String getLabelsToUpAddMovie() {
        try {
            List<Label> lists = labelService.getAllLabelsToAddMovie();

            if (lists != null) {
                System.out.println("成功取得" + lists.size() + "条数据...");
            } else {
                System.out.println("查询失败...");
            }
            JSONArray arr = new JSONArray();
            //读取数据
            for (Label label:lists) {
                JSONObject ob = new JSONObject();
                //将单独的数据装进json数据
                ob.put("id", label.getId());
                ob.put("name", label.getName());
                ob.put("parentId",label.getParentId());
                //装进数组
                arr.add(ob);
            }
            JSONObject ob = new JSONObject();
            //放置数据
            ob.put("data", arr);
            //放置所有的数据个数
            String returndata = ob.toString();
            System.out.println("成功转换" + returndata.length() + "大小的数据...");
            System.out.println(arr);
            System.out.println(returndata);
            //转换编码
            ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.write(returndata);
            out.flush();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
}
