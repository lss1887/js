package com.oppo.domain;

public class Demo10 {
    public static void main(String[] args) {
        String a="dddd.ghfhd";
        String b=a.substring(0,a.indexOf("."));
        System.out.println(b);

        System.out.println("===================================");
        String c="contract/ad/file/detail/contract/private/201910/26/281572081665.jpg";
        if (c.contains("jpg") ){
            System.out.println("1");
        }else {
            System.out.println(2);
        }
    }
}
