package com.oppo.domain;

import java.util.*;

public class Demo09 {
    public static void main(String[] args) {
        //        Scanner scanner=new Scanner(System.in);//在线笔试
        Map<Integer,Integer> map=new HashMap<Integer, Integer>();
        map.put(4,4);
        map.put(1,2);
        map.put(2,3);
        map.put(3,4);



        //获取所有key
        Set<Integer> keys=map.keySet();
        Iterator<Integer> iterator1=keys.iterator();
        while (iterator1.hasNext()){
            System.out.print(iterator1.next() +", ");
        }
        System.out.println();
        System.out.println("------------------------");

        //获取所有value
        Collection<Integer> values=map.values();
        Iterator<Integer> iterator2=values.iterator();
        while (iterator2.hasNext()){
            System.out.print(iterator2.next()+", ");
        }
        System.out.println();
        System.out.println("------------------------");

        //去除value中重复值,相同值仅仅保留一个
        Set<Integer> valuesSimple=new HashSet<Integer>();
        for(int i:values){
            valuesSimple.add(i);
        }
        Iterator<Integer> iterator3=valuesSimple.iterator();
        while (iterator3.hasNext()){
            System.out.print(iterator3.next()+", ");
        }

    }
}
