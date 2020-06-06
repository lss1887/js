package com.oppo.domain;

import java.text.DecimalFormat;

public class Demo59 {
    public static void main(String[] args) {
        Integer a=133344;

        String format = new DecimalFormat("#.00").format( Double.valueOf(a/100));
        System.out.println(format);
    }
}
