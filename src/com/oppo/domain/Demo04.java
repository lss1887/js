package com.oppo.domain;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

public class Demo04 {

    public static void main(String[] args) {
        String a = "ddd, ";
        String[] split = a.split(",");
        System.out.println(split.length);
        for (String s : split) {
            System.out.println(s);
        }
        System.out.println(split);
    }
}
