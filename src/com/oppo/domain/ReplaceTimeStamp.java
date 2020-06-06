package com.oppo.domain;

import java.text.SimpleDateFormat;

public class ReplaceTimeStamp{
    public static void main(String[] args) {
        Long  a=1554083426L;
       String v=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(a*1000);
        System.out.println(v);
    }
}

