package com.oppo.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Demo05 {
    public static void main(String[] args) {
        Date dt =new Date();
        String formatDate = null;

        DateFormat dFormat3 = new SimpleDateFormat("yyyyMMdd");
        formatDate = dFormat3.format(dt);
        System.out.println(formatDate);

    }
}
