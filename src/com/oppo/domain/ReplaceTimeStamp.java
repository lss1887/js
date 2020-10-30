package com.oppo.domain;

import java.text.SimpleDateFormat;

public class ReplaceTimeStamp{
    public static void main(String[] args) {
        Long  a=1596681361L;
       String v=new SimpleDateFormat("yyyy-MM-dd").format(a*1000);
        System.out.println(v);
    }
}

