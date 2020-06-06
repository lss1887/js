package com.oppo.domain;

import java.util.*;

public class Demo18 {
    public static void main(String[] args) {
        Map<String,Integer> map = new HashMap<>();
        map.put("A",1);
        map.put("B",2);
        map.put("C",3);

//        Set<String> strings = map.keySet();
//        map.get(strings)
//        List< Map<String,Integer>> list=new ArrayList<>();
//
//        list.add(map);
//        for (Map<String, Integer> integerMap : list) {
//            integerMap
//        }
        Set<Map.Entry<String, Integer>> entries = map.entrySet();
        System.out.println(entries);
        for (Map.Entry<String, Integer> entry : entries) {
            System.out.println(entry.getKey()+"--"+entry.getValue());
        }
    }
}
