//
//  ArrayList.c
//  线性存储
//
//  Created by 赖永鹏 on 2019/1/28.
//  Copyright © 2019年 LYP. All rights reserved.
//
const static int ExpandCapacity = 10;//每次扩容的数量
const int ArrayListNotFound = -1; // 数据找不到的返回值
typedef void *ArrayListNodeValue;//节点中存储的值
typedef struct {
    int capacity;//容量
    int length; //c长度（当前节点的数量）
    ArrayListNodeValue *values;
} ArrayList;
#define typedef_ArrayList

#include "ArrayList.h"
#include <stdlib.h>
#include <string.h>

void List_print(ArrayList *list,ArrayListPrintFunc func){

    if (list == NULL) return;
    printf("length == %d\n",list->length);
    printf("capacity == %d\n",list->capacity);
    printf("value = [");
    for (int i = 0; i<list->length; i++) {
        if (func) {
            func(list->values[i]);
        }else{
            printf("%p",list->values[i]);
        }
        if (i != list->length-1) {
            printf(",");
        }
    }
     printf("]\n\n");
}

// 创建
ArrayList *List_Create(int capacity){
    if (capacity <= 0) return NULL;
//    分配线性表对象的空间
    ArrayList *list = malloc(sizeof(capacity));
    if (list) {//初始化
        list->length = 0;
        list->capacity = capacity;
        list->values = malloc(capacity * sizeof(ArrayListNodeValue));
//        list->values = list+1;
    }
    return list;
}
// 清空
void List_Clear(ArrayList *list){
    if (list == NULL) return;
    list->length = 0;
}
// 销毁
void List_Destroy(ArrayList *list){
    if (list == NULL) return;
    free(list->values);
    free(list);
}

// 获取长度
int List_length(ArrayList *list){
    if (list == NULL) return 0;
    return list->length;
}
// 获得index位置对应的数据
ArrayListNodeValue List_Get(ArrayList *list,int index){
    if (list == NULL || index < 0 || index >= list->length) {
        return NULL;
    }
    return list->values[index];
}
// 获得某个数据对应的index位置
int List_Index(ArrayList *list,ArrayListNodeValue value){
    if (list == NULL) return ArrayListNotFound;
//    遍历所有的元素
    for (int i = 0; i<list->length; i++) {
        if (list->values[i] == value) {
            return i;
        }
    }
    return ArrayListNotFound;
}

// 往index位置插入数据
void List_Insert(ArrayList *list,int index,ArrayListNodeValue value){
    if (list == NULL || index < 0 || index > list->length) return;
    
//    判断需不要扩容
    if (list->length == list->capacity) {//需要扩容
//        新的容量大小
        int newCapacity = list->capacity + ExpandCapacity;
//        分配新的空间
        ArrayListNodeValue *newValues = malloc(sizeof(ArrayListNodeValue) * newCapacity);
        if (newValues == NULL) {
            return;
        }
        
//        拷贝旧数据到新空间
        memcpy(newValues, list->values, sizeof(ArrayListNodeValue) * list->capacity);
//        释放k旧空间
        free(list->values);
        
//        设置新的capacity
        list->values = newValues;
        list->capacity = newCapacity;
    }
    
    
//    从index位置开始往后挪动数据
    for (int i = list->length-1; i >= index; i--) {
        list->values[i+1] = list->values[i];
    }
//    设置新数据到index位置
    list->values[index] = value;
//    数量增加
    list->length++;
}
// 往最后面位置添加数据
void List_Add(ArrayList *list,ArrayListNodeValue value){
    if (list == NULL ) return;
    List_Insert(list, list->length, value);
}
// 设置index位置的数据
void List_Set(ArrayList *list,int index,ArrayListNodeValue value){
    if (list == NULL || index < 0 || index > list->length) return ;
    list->values[index] = value;
}

// 删除index位置的数据
ArrayListNodeValue List_Remove(ArrayList *list,int index){
    if (list == NULL || index < 0 || index > list->length) return NULL;
//   获取需要删除的数据
    ArrayListNodeValue value = list->values[index];
//    从index + 1 位置开始从后往前挪动数据
    for (int i = index + 1; i >= index; i--) {
        list->values[i-1] = list->values[i];
    }
//    数量减少
    list->length--;
    return value;
}
// 删除某种数据
void List_RemoveValue(ArrayList *list,ArrayListNodeValue value){
    if (list == NULL) return;
//    记录所有要删除的数据
    int removeCount = 0;
//    遍历所有的元素
    for (int i = 0; i < list->length; i++) {
        if (list->values[i] == value) {
// 被删除的数据增加
            removeCount++;
        }else{
            list->values[i-removeCount] = list->values[i];
        }
    }
    
//    数量减少
    list->length -= removeCount;
}
