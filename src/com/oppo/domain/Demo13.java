package com.oppo.domain;

import java.util.ArrayList;
import java.util.List;

public class Demo13 {
    public static void main(String[] args) {
        List<Integer> list=new ArrayList<>();
        list.add(1);
        list.add(2);
        String a="";
        for (Integer i : list) {
            a +=i+"  ";
        }
        System.out.println(a);
    }
}
