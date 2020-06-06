package com.oppo.domain;

import java.util.ArrayList;
import java.util.List;

public class Demo02 {
    public static void main(String[] args) {
        List<Address> list0=new ArrayList<>();
        List<String> list1=new ArrayList<>();
        List<String> list2=new ArrayList<>();
        list1.add(null);
        list1.add("2");
        list2.add("3");
        list2.add("4");

        for (int i = 0; i < list1.size(); i++) {
            Address address = new Address();
            if (list1.get(i)!=null){
                address.setProvince(list1.get(i));
            }else{
                address.setProvince("0");
            }
           address.setCity(list2.get(i));
            list0.add(address);
        }
        System.out.println(list0);
    }
}
