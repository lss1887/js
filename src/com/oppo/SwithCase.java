package com.oppo;

public class SwithCase {

    public static void main(String[] args) {
        for (int i = 0; i < 3; i++) {
            int a = 1;
            switch (i){
                case 0:
                    Integer b = a +1;
                    System.out.println(b);
                    break;
                case 1:
                    Integer c = a +3;
                    System.out.println(c);
                    break;
            }
        }
    }
}
