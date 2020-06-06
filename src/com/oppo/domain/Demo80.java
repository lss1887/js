package com.oppo.domain;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

public class Demo80 {
    public static void main(String[] args) {
        SimpleDateFormat bjSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");     // 北京
        bjSdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));  // 设置北京时区

        int i = new BigDecimal(System.currentTimeMillis()).divide(new BigDecimal(1000)).intValue();

        System.out.println(i);

        System.out.println( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(Long.valueOf(i)*1000)));
    }

}
