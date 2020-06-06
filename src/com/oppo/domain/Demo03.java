package com.oppo.domain;

import java.util.ArrayList;
import java.util.List;

public class Demo03 {
    public static void main(String[] args) {
        List<Integer> list=new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(4);
        for (Integer integer : list) {
            if (integer != 3){
                System.out.println(1);
            }else{
                continue;
            }
        }
    }
}
