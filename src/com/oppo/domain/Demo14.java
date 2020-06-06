package com.oppo.domain;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Demo14 {
    public static void main(String[] args) throws ParseException {
       Long a = Long.valueOf(1576743052)*1000;
        System.out.println(a);
        String c = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(a));
      System.out.println(c);
//        转换成时间戳
        //获取指定时间的时间戳，除以1000说明得到的是秒级别的时间戳（10位）
//        Date date1 = new Date();
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String res = simpleDateFormat.format(date1);
//        System.out.println(res);
//        Date date = simpleDateFormat.parse(res);
//        long ts = date.getTime();
//        System.out.println("获取指定时间的时间戳:" + ts);
//        String c = new SimpleDateFormat("yyyy-MM-dd").format(new Date(1576742582*1000));
////        //获取时间戳
////        long now1 = System.currentTimeMillis();
//        long now2 =System.currentTimeMillis();
//
////
//
//        System.out.println("格式"+c);
//        System.out.println("当前时间戳:" +now1);
//        System.out.println("当前时间戳:" +now2);

    }
}
