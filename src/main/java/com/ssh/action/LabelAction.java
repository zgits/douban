package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Label;
import com.ssh.model.Trailer;
import com.ssh.model.Label;
import com.ssh.service.LabelService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

    public Label getLabel() {
        return label;
    }

    public void setLabel(Label label) {
        this.label = label;
    }

    private Label label;
    private  int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
            for (Label label : lists) {
                JSONObject ob = new JSONObject();
                //将单独的数据装进json数据
                ob.put("id", label.getId());
                ob.put("name", label.getName());
                ob.put("parentId", label.getParentId());
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


    public String getAllLabels() throws IOException {

            List<Label> labels = labelService.getAllLabels();

            if (labels != null) {
                System.out.println("成功取得" + labels.size() + "条数据...");
            } else {
                System.out.println("查询失败...");
            }
            JSONArray arr = new JSONArray();
            //判定最大的读取个数
            //读取数据
            for (Label label : labels) {
                JSONObject ob = new JSONObject();
                //将单独的数据装进json数据
                ob.put("id", label.getId());
                ob.put("name", label.getName());
                ob.put("parent", labelService.getLabelNameById(label.getParentId()));


                //装进数组
                arr.add(ob);
            }
            JSONObject ob = new JSONObject();
            //放置数据
            ob.put("rows", arr);
            //放置所有的数据个数
            ob.put("total", labels.size());
            String returndata = ob.toString();
            System.out.println("成功转换" + returndata.length() + "大小的标签数据...");
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

        public String getLabelName(){
            Map<Integer,String> id_name=new HashMap<>();
            try{
                id_name=labelService.getLableName();
            }catch (Exception e){

            }
//      session.setAttribute("allsoft", allsoft);
            if(id_name!=null){
                System.out.println("成功取得"+id_name.size()+"条标签名字数据...");
            }else{
                System.out.println("查询失败...");
            }
//      System.out.println("softInfo"+allsoft);
            JSONArray arr=new JSONArray();
            //判定最大的读取个数
            //读取数据
            for(Map.Entry<Integer,String> entry:id_name.entrySet()){
                JSONObject ob=new JSONObject();
                //将单独的数据装进json数据
                System.out.println("key值："+entry.getKey()+" value值："+entry.getValue());
                ob.put("id", entry.getKey());
                ob.put("name", entry.getValue());
                //装进数组
                arr.add(ob);
            }
            JSONObject ob=new JSONObject();
            //放置数据
            ob.put("data", arr);
            //放置所有的数据个数
            String returndata=ob.toString();
            System.out.println("成功转换"+returndata.length()+"大小的数据...");
            System.out.println(arr);
            System.out.println(returndata);
            //转换编码
            ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            PrintWriter out;
            try {
                out=ServletActionContext.getResponse().getWriter();
                out.write(returndata);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "success";
        }

        public String addLable() throws IOException{
            String flag ="";

            try{
              labelService.addLabel(label);
              System.out.println(label);
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            }catch (Exception e){
                flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }

            PrintWriter writer = ServletActionContext.getResponse().getWriter();

            writer.write(flag);

            System.out.println("成功");

            writer.flush();

            writer.close();
         return "success";
        }
    /**
     * 获取要修改的标签信息
     */
    public String  ToUpdateLableById() throws IOException{
        String lable ="";
        try{
            lable = JSON.toJSONString(labelService.getLabelById(id));//使用fastjson将数据转换成json格式

        }catch (Exception e){
            e.printStackTrace();
            lable =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        System.out.println(lable);

        writer.write(lable);

        System.out.println("获取要编辑的标签成功");

        writer.flush();

        writer.close();
        return "success";
    }
/**
 * 修改标签
 */

    public String UpdateLabel() throws IOException{
        String flag ="";
        if(label==null){
            System.out.println("返回修改信息错误");
        }else {
            System.out.println("修改的信息" + label);
        }
        try{
            if(labelService.updateLabel(label)){
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            }else{
                flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }



        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
        return "success";
    }

    /**
     * 删除标签
     */
    public String deleteLabel() throws IOException{
        String flag ="";
        try{
            if(labelService.deleteLabels(id)){
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            }else{
                flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }



        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
        return "success";
    }
}
