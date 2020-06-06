package com.oppo.domain;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

public class Demo {
    public static void main(String[] args) {
        List list = new ArrayList<>();

        list.add(new User(2,"张三", 19));
        list.add(new User(3,"李四", 13));
        list.add(new User(1,"王五", 15));
        list.add(new User(4,"赵六", 34));
        System.out.println(list);
       Collections.sort(list, new Comparator<User>() {
           @Override
           public int compare(User o1, User o2) {
               if (o1.getAge() > o2.getAge()) {
                   return 1;
               }
               if (o1.getAge() > o2.getAge()) {
                   return 0;
               }
               return -1;
           }

       });
        System.out.println(list);

        System.out.println("===============降序========================");

        Collections.sort(list, new Comparator<User>() {


            @Override
            public int compare(User o1, User o2) {
                if (o1.getAge()>o2.getAge()){
                    return  -1;
                }
                if (o1.getAge() == o2.getAge()){
                    return 0;
                }
                return 1;
            }

        });
        System.out.println(list);


//
////        Date date = new Date();
////        System.out.println(date);
////String[] add={"11","22","33"};
////        for (String s : add) {
////            System.out.println(s);
////        }
////        Integer[] ss=(Integer[]) add;
//        Date dt =new Date();
//        //格式：2016-7-6
//        String formatDate = null;
//
//
//        DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd"); //HH表示24小时制；
//        formatDate = dFormat.format(dt);
//        System.out.println(formatDate);
//        Integer a=1;
//        Integer b=2;
//        Integer c=3;
//
//       List objects = new ArrayList<>();
//        objects.add(a);
//        objects.add(b);
//        objects.add(c);
//        System.out.println(objects);

//        NumberFormat nf=NumberFormat.getPercentInstance();// nf.setMinimumFractionDigits( 2 );        保留到小数点后几位        显示：47.00%
//
//System.out.println(nf.format(0.47));

    }

}
