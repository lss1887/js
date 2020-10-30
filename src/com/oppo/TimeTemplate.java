package com.oppo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeTemplate {
    public static void main(String[] args) {
        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date(1596681361L));
        System.out.println(format);
    }
}
