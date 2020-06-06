package com.oppo.demo;

import com.sun.deploy.util.ArrayUtil;

import java.util.Arrays;

public class BubbleSortMain {

    public static void main(String[] args) {
        int[] arr = {1,4,2,6,9,3,5,3,4};
        arr = bubbleSort(arr);
        System.out.println(Arrays.toString(arr));
    }

    private  static int[]   bubbleSort(int[] arr){
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length - i - 1; j++) {
                if(arr[j] > arr[j+1]){
                    int temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
            }
        }
        return arr;
    }
}
