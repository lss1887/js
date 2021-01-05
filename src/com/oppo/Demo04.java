package com.oppo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Demo04 {
    public static void main(String[] args) throws ParseException {
      String a = "file/contract/private";
        String s = a.replaceFirst("file/", "contract/ad/file/detail");
        System.out.println(s);
    }
}
