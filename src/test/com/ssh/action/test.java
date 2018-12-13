package com.ssh.action;



/**
 * Created by 幻夜~星辰 on 2018/12/13.
 */
import java.util.Scanner;
public class test {

    public static int logicExample(int x,int y)
    {
        int sum=0;
        if(x>0&&y>0)
        {
            sum=x+y+10;
        }
        else
        {
            sum=x+y-10;
        }
        if(sum<0)
        {
            sum=0;
        }

        return sum;
    }
    public static void main(String[] args){
        Scanner in =new Scanner(System.in);
        System.out.print("请输入x:");
        int x=in.nextInt();
        System.out.print("请输入y:");
        int y=in.nextInt();
        System.out.println("测试结果:  x:"+x+"  y:"+y+"  sum:"+logicExample(x,y));
    }

}
