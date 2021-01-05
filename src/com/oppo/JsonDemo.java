package com.oppo;

import java.util.ArrayList;
import java.util.List;

public class JsonDemo {
    public static void main(String[] args) {
            List<Integer> list = new ArrayList<>();
            list.add(3);
            Integer a = 3;
            if(a == 3){
                getData(list);
            }
        System.out.println(list);

    }
    private static void getData(List list){
        list.add(4);
    }
}
