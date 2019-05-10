//
//  HeapSort.c
//  Algorithm
//
//  Created by 赖永鹏 on 2018/11/16.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#include "HeapSort.h"
#include <math.h>

#define parent(i) ((i)/2)
#define left(i) ((i)*2)
#define right(i) ((i)*2 + 1)

void swap(int A[], int a,int b){
    int temp = A[a];
    A[a] = A[b];
    A[b] = temp;
}

void max_heapify(int A[],int i,int heap_size){
    int left = left(i);
    int right = right(i);
    int largest = i;
    if (left < heap_size && A[left]>A[largest]){
        largest = left;
    }
    
    if (right < heap_size && A[right]>A[largest]){
        largest = right;
    }
    
    if (largest!=i){
        swap(A,i,largest);
        max_heapify(A,largest,heap_size);
    }
}

void build_max_heap(int A[],int heap_size){
    
    for (int i = heap_size/2-1; i >=0 ; i--){
        max_heapify(A,i,heap_size);
    }

}


void shiftUp(int max,int arr[]){
    
    int i,tmp;
    //进行堆排序
    build_max_heap(arr, max);

    for(i=max-1;i>0;i--)
    {
        tmp = arr[i];
        arr[i] = arr[0];
        arr[0] = tmp;
        max_heapify(arr,0,i);
    }
}
