//
//  QuickSort.c
//  Algorithm
//
//  Created by 赖永鹏 on 2018/11/16.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#include "QuickSort.h"
//快速排序
void swip(int arr[],int i,int j){
    //    if (i == j) {
    //        return;
    //    }
    int temp;
    temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
    printf("\n");
    printf("%d--%d",i,j);
    printf("\n");
}

void quicksort (int arr[], int min,int max){
    int i;
    int last;//起始单元
    if (min<max) {
        last = min;//保持一个不动
        for ( i = min + 1; i <= max; i++) {
            if (arr[i]<arr[min]) {
                //                交换位置
                swip(arr, ++last, i);
                printf("\n");
                for (int i = 0; i<6; i++) {
                    printf("%d",arr[i]);
                }
                printf("\n");
            }
        }
        swip(arr, last, min);
        printf("\n");
        for (int i = 0; i<6; i++) {
            printf("==%d",arr[i]);
        }
        printf("\n");
        quicksort(arr, min, last - 1);
        quicksort(arr, last+1, max);
    }
    
}
