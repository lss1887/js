package com.oppo;

import com.oppo.domain.Address;
import com.oppo.domain.User;
import com.sun.xml.internal.ws.util.StringUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Demo02 {
    public static void main(String[] args) {
        DecimalFormat format = new DecimalFormat("###0.00");

        BigDecimal bigDecimal = new BigDecimal((12580000/100)+"");
        BigDecimal bigDecimal2 = new BigDecimal(2621+"");
        double doubleValue = bigDecimal.divide(bigDecimal2, BigDecimal.ROUND_UP).doubleValue();
        System.out.println(doubleValue);

        System.out.println(format.format(doubleValue));
        System.out.println(format.format(Double.valueOf((12580000 / 100) + "") / Double.valueOf(2621 + "")));

        List<Address> list = new ArrayList<>();
        System.out.println(list);
        System.out.println(list.size());
    }

}
