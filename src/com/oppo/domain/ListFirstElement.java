package com.oppo.domain;

import java.util.ArrayList;
import java.util.List;

public class ListFirstElement {
    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.add(0,17);
        System.out.println(list);

    }
}
