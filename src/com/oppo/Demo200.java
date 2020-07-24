package com.oppo;

import java.util.LinkedList;
import java.util.List;

public class Demo200 {
    public static void main(String[] args) {
        List<Integer> listA = new LinkedList<>();
        listA.add(1);
        listA.add(3);
        listA.add(9);
        List<Integer> listB = new LinkedList<>();
        listA.add(5);
        listA.add(7);
        listA.add(9);

//        List<int> Result = listA.Union(listB).ToList<int>(); //剔除重复项
      listA.addAll(listB);
        System.out.println(listA);

    }
}
