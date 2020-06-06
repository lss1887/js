package com.oppo;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Demo31 {
//    public static void main(String[] args) {
//        String value = new DecimalFormat("####0.00").format(Double.valueOf(175631) / 100);
//        System.out.println(new BigDecimal(value));
//
//        String fileName = "6.jpg";
//        System.out.println(fileName.substring(fileName.lastIndexOf(".")));
//    }


    public static void main(String[] args) throws IOException
    {
        File tempFile = File.createTempFile("aws-java-sdk-", ".txt");
        System.out.println(tempFile.getAbsolutePath());
    }

}
