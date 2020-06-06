package com.oppo.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Demo11 {

    public static void main(String[] args) {
        try {
            List<Integer> list=null;
            String dateRange="2018-06~2019-09";
            String start = dateRange.split("~")[0];
            String end=dateRange.split("~")[1];
            Date d1 = new SimpleDateFormat("yyyy-MM").parse(start);//定义起始日期

            Date d2 = new SimpleDateFormat("yyyyMM").parse(end);//定义结束日期  可以去当前月也可以手动

            Calendar calendar = Calendar.getInstance();//定义日期实例
            calendar.setTime(d1);
            while (calendar.getTime().before(d2)){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
                String str = sdf.format(calendar.getTime());
                System.out.println("=========str"+str);
                if (str != null){
                    Integer integer = Integer.valueOf(str);
                    list.add(integer);
                }
                calendar.add(Calendar.MONTH, 1);//进行当前日期月份加1
            }
            System.out.println(list);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }
//        dd.setTime(d1);//设置日期起始时间
//
//        while (dd.getTime().before(d2)) {//判断是否到结束日期
//
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
//
//            String str = sdf.format(dd.getTime());
//
//            System.out.println(str);//输出日期结果
//
//            dd.add(Calendar.MONTH, 1);//进行当前日期月份加1

        }
    }

