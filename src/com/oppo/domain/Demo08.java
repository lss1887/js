package com.oppo.domain;

import java.util.*;

public class Demo08 {
    public static void main(String[] args) {


        Map<Integer,String> map = new HashMap<Integer, String>();
        map.put(3,"9xuexi");
        map.put(4,"222");
        map.put(1,"lll");
        map.put(2,"8888");

        Set<Integer> set = map.keySet();
        List list1=new ArrayList<>(set);
        Collection<String> values = map.values();
        List list2=new ArrayList<>(values);
        System.out.println(set);
        System.out.println(values);
        System.out.println("=======================");
        for (int i=0;i<set.size();i++){
            String a=list1.get(i)+"-"+list2.get(i);
            System.out.println(a);
     }
    }
}
