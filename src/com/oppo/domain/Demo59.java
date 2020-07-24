package com.oppo.domain;

import java.text.DecimalFormat;
import java.util.*;

public class Demo59 {
    public static void main(String[] args) {
      String str = "ddd";
      Map<String,Integer> map = new HashMap<>();

      Integer integer = map.computeIfAbsent(str, String::length);
        System.out.println(integer);
    }
}
