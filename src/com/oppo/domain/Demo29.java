package com.oppo.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Demo29 {
    public static void main(String[] args) throws ParseException {
        String a="2019-07~2019-11";
        String b=a.split("~")[0];
        String g=a.split("~")[1];
        System.out.println(b+"________"+g);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
        Date parse = simpleDateFormat.parse(b);
        System.out.println(parse);
    }
}
