//
//  main.c
//  Algorithm
//
//  Created by laiyp on 2018/10/29.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#include "QuickSort.h"
#include "HeapSort.h"

#define max_ 100

//冒泡排序
void bubblesort(int arr[],int n){
    
    if (n<=1) {
        return;
    }
    int temp;
    int jishu = 0;
    for (int i = 0; i< n; i++) {
        for (int j = 0; j< n; j++) {
            if (arr[i] < arr[j]) {
                temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
                 jishu ++;
            }
        }
    }
    for (int i = 0; i<n; i++) {
        printf("%d",arr[i]);
    }
    printf("\n%d\n",jishu);
//    时间复杂度：O(n^2)
}
// 最优解
void bubblesort2(int arr[],int n){
    if (n <= 1) {
        return;
    }
     int jishu = 0;
    for (int i = 0; i<n; ++i) {
        _Bool flag = 0;
        for (int j = 0; j<n - i -1; ++j) {
            if (arr[j] < arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                jishu ++;
                flag = 1;
            }
        }
        if (flag == 0) {
            break;
        }
    }
    
    for (int i = 0; i<n; i++) {
        printf("%d",arr[i]);
    }
    printf("\n%d\n",jishu);
}
//插入排序
void insertsort(int arr[],int n){
    if (n <= 1) {
        return;
    }
    for (int i = 1; i < n; ++i) {
        int j = i - 1;
        int value = arr[i];
        for (; j >= 0; --j) {
            if (arr[j] > value) {
                arr[j+1] = arr[j];//挪动数据
            }else{
                break;
            }
        }
        printf("j == %d",j);
        arr[j+1] = value;//插入数据
    }
    for (int i = 0; i<n; i++) {
        printf("%d",arr[i]);
    }
}

//选择排序
void selectsort(int arr[],int n){
    if (n <= 1) {
        return;
    }
    for (int i = 0; i<n; i++) {
        int min_index = i;//记录最小位置
        for (int j = i+1; j< n; j++) {
            if (arr[min_index] > arr[j]) {
                min_index = j;
            }
        }
        
//       替换z最小的数据
        if (i == min_index) {
            continue;
        }
        int temp = arr[i];
        arr[i] = arr[min_index];
        arr[min_index] = temp;
    }
    for (int i = 0; i<n; i++) {
        printf("%d",arr[i]);
    }
}

//归并排序
void merge(int arr[],int left,int m,int right){
    
    int tempArr[max_]={0};
    int i;//左s边索引
    int j;//s右边索引
    int k;//s临时数组索引
    
    for (i = left,j = m + 1,k=0 ; k<=right-left; k++) {
        
        if (i == m+1) {//左边挪到了最后
            tempArr[k] = arr[j++];
            continue;
        }
        if (j == right + 1) {//右边挪到了最后
            tempArr[k] = arr[i++];
            continue;
        }
        if (arr[i]<arr[j]) {//如果左边小于右边
            tempArr[k] = arr[i++];//将最小的放到临时数组中
        }else{
            tempArr[k] = arr[j++];
        }
    }
    
//    将有序的数组放回到原来的数组中
    for (int i = left ,j=0; i <= right; i++,j++) {
        arr[i] = tempArr[j];
    }
    
}

void _mergesort(int arr[],int start,int end){
    if (start < end) {
        int i = (start + end)/2;
        _mergesort(arr, start, i);
        _mergesort(arr, i+1, end);
        merge(arr, start, i, end);
    }
}

//计算排序
void countingSort(int arr[],int n){
    if (n <= 1) {
        return;
    }
//    查找数组中数据的范围
    int max = arr[0];
    for (int i = 1; i<n; i++) {
        if (max<arr[i]) {
            max = arr[i];
        }
    }
    printf("\n");
    printf("max=%d",max);
    printf("\n");
//    申请一个新数组，大小为【0 max】
    int arrC[max+1];
    for (int i = 0; i<= max; i++) {
        arrC[i] = 0;
    }
//    计算每个元素的个数，放入arrc中,把元素当成arrC 数组的下标
    for (int i = 0; i<n; i++) {
//        {4,3,2,0,2,1,5,6,7,2}
        arrC[arr[i]] = arrC[arr[i]] + 1;
//        arrC[arr[i]]++;
//        arrc[4] =1,
//        arrc[3] = 1,
//        arrc[2] = 2,
//        arrc[0] = 1,
//        arrc[1] = 1,...
    }
    
//   依次累加,这样得到的arrC[k]中存储的就是小于k的个数
    for (int i = 1; i <= max; i++) {
        arrC[i] = arrC[i-1] + arrC[i];
    }
//    临时数组r，存储排序之后的结果
    int arrR[n];
    for (int i = n-1; i>=0; i--) {
        int index = arrC[arr[i]]-1;//arrC[k]对应在arr中的下标是arrC[k]的值-1 eg:arrC[2] = 3,也就是说arr中小于2的值有3个，那么2在arr中对应的下标就是3-1=2
        arrR[index] = arr[i];//k对应的就是下标就是index
        arrC[arr[i]]--;// 取出来一个值之后，对应的arrC[k]也应该减一
    }
//    将结果拷贝给a数组
    for (int i = 0; i < n; ++i) {
        arr[i] = arrR[i];
    }
    
}

//桶排序，妙在用数组的下标是从小到大的原理，母无序数组中元素的出现的次数作为新数组每个下标对应的值。如此，比如newArr[0]=2,newArr[1]=2,对应母有序数组为 0011
void bucketSort (int arr[],int n){
//    找到最大值
    int max = arr[0];
    for (int i= 1; i < n; i++) {
        if (max<arr[i]) {
            max = arr[i];
        }
    }
    
//    创建【0，max】的数组,给每个元素计数
    int arrC[max+1];
    for (int i = 0; i < n; i++) {
        arrC[arr[i]]++;
    }
    
//    for (int i = 0; i <= max; i++) {
//        for (int j = 0; j< arrC[i]; j++) {
//            printf("%d",i);
//        }
//    }
////    方法一
//    for (int i = 0,j=0; i <= max; i++) {
//        while (arrC[i] != 0) {//对每个不是空桶子进行排序
//            arr[j] = i;
//            j++;
//            arrC[i]--;//每取出一个数，计数数组的下标对应的值都应该减一
//        }
//    }
//
////    方法二
//    for (int i = 0,j=0; i <= max; i++) {
//        for (int m = 0; m < arrC[i]; m++) {
//            arr[j] = i;
//            j++;
//            arrC[i]--;
//        }
//    }
    
//    上面两种方法的时间复杂度都是O(n^2) 我们需要把桶排序的时间复杂度压缩到O(n)
    for (int i = 1; i<=max; i++) {
        arrC[i] = arrC[i]+arrC[i-1];//计算小于i的数有多少个，然后存储在计数数组中
    }
    int tmpArr[n];
    for (int i = n-1; i>=0; i--) {//从0开始取也行，但是就不是稳定排序了
        int index = arrC[arr[i]]-1;//找arrC[K]对应arr的小标idnex
        tmpArr[index] = arr[i];// 将K赋值给新数组的index
        arrC[arr[i]]--;//取出值之后，arrC[k]对应的小于K的值也要减一
    }
    for (int i = 0; i<n; i++) {
        arr[i] = tmpArr[i];
    }
    
}

//二分查找
int binarySearch(int arr[],int n, int value){
    
    int low = 0;
    int high = n-1;
    while (low <= high) {
//        int mid = (low + high)/2;//这种容易栈溢出
//        int mid = low/2 + (high - low)/2;
//        或者使用位运算
        int mid = low + ((high-low)>>1);
        if (arr[mid] == value) {
            return mid;
        }
        if (arr[mid] < value) {
            low = mid + 1;
        }
        if (arr[mid] > value) {
            high = mid - 1;
        }
    }
    return -1;
}

//二分查找，递归
int binarySInternally(int arr[],int low,int high,int value){
    if (low <= high) {
        
    int mid = low + ((high -low)>>1);
    if (arr[mid] == value) {
        return mid;
    }
    if (arr[mid] < value) {
        return binarySInternally(arr, mid+1, high, value);
    }
    if (arr[mid] > value) {
        return binarySInternally(arr, low, mid-1, value);
    }
  }
    return -1;
}

// 查找重复元素中的第一个
int binarySInternally2(int arr[],int low,int high, int value){
    if (low <= high) {
        
        int mid = low + ((high - low)>>1);
        if (arr[mid] < value) {
            return binarySInternally2(arr, mid+1, high,value);
        }
        if (arr[mid]>value) {
            return binarySInternally2(arr, low, mid-1, value);
        }
        if (arr[mid] == value && mid != 0) {
            if (arr[mid - 1] != value) {
                return mid;
            }
            return binarySInternally2(arr, low, mid-1, value);
        }
    }
    return -1;
}

//查找第一个大于给定值的书
int binarySInternally3(int arr[],int low,int high,int value){
    if (low <= high) {
        int mid = low + ((high-low)>>1);
        if (arr[mid] <= value) {
            return binarySInternally3(arr, mid+1, high, value);
        }
        if (arr[mid] > value) {
//            if (arr[mid-1] > value && mid != high) {                return binarySInternally3(arr, low, mid-1, value);
//            }//第一个大于给定值
            
            if (mid != high && arr[mid+1]>value) {
                return binarySInternally3(arr, mid+1, high, value);
            }
            return mid;
            
        }
    }
    return -1;
}

int binarySearch2(int arr[],int n,int value){
//    return binarySInternally(arr, 0, n-1, value);
//     return binarySInternally2(arr, 0, n-1, value);
    return binarySInternally3(arr, 0, n-1, value);
}

#pragma private
int main(int argc, const char * argv[]) {

    int bubbleArr[] = {4,6,5,2,1,3,7,9,8};
//    int bubbleArr[] = {4,3,2,0,2,1,5,6,7,2};
//    int bubbleArr[] = {4,5,6,3,2,1};
//    int min = 0;
    int max = sizeof(bubbleArr)/sizeof(bubbleArr[0]) - 1;
    
//    insertsort(bubbleArr, max);
//    bubblesort2(bubbleArr, 6);
//    (bubbleArr, 6);
//    selectsort(bubbleArr, 6);
    _mergesort(bubbleArr, 0, max);
//    quicksort(bubbleArr, min, max);
//    countingSort(bubbleArr, max+1);
//    bucketSort(bubbleArr, max+1);
//    for (int i = 0; i<50; i++) {
//        bubbleArr[i + 1] = rand()%100;
//        int max = sizeof(bubbleArr)/sizeof(bubbleArr[0]) - 1;
    
//        shiftUp(max+1, bubbleArr);
//
////    }
    for (int i = 0; i<max+1; i++) {
        printf("%d ",bubbleArr[i]);
    }
//  int num = binarySearch2(bubbleArr, max+1, 2);
//        printf("\n");
//    printf("==%d",bubbleArr[num]);
//    int arr[10];
//    for (int i = 0,j = 0; i<6; i++) {
//        arr[i] = bubbleArr[j++];
//    }

    return 0;
}
