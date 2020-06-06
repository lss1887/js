package com.oppo.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Demo12 {
    public static void main(String[] args) {
        List<Integer> list=new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        try{
            String dateRange="2018-06-01~2019-09-04";
            String start = dateRange.split("~")[0];
            String end=dateRange.split("~")[1];
            Date d1 = new SimpleDateFormat("yyyy-MM").parse(start);//定义起始日期

            Date d2 = new SimpleDateFormat("yyyy-MM").parse(end);//定义结束日期  可以去当前月也可以手动写日期。

            Calendar dd = Calendar.getInstance();//定义日期实例

            dd.setTime(d1);//设置日期起始时间

            while (dd.getTime().before(d2)) {//判断是否到结束日期
                String str = sdf.format(dd.getTime());
                if (str !=null){
                    Integer integer = Integer.valueOf(str);
//                    System.out.println(integer);
                    list.add(integer);
                }
//                System.out.println(str);//输出日期结果

                dd.add(Calendar.MONTH, 1);//进行当前日期月份加1

            }
            String endStr = sdf.format(d2);
            if (endStr != null){
                Integer integer = Integer.valueOf(endStr);
                list.add(integer);
            }
            System.out.println(list);
//            System.out.println(end);//输出日期结果

        }catch (Exception e){
            System.out.println("异常"+e.getMessage());
        }
    }
}
