//
//  LinkList.c
//  线性存储
//
//  Created by 赖永鹏 on 2019/2/15.
//  Copyright © 2019年 LYP. All rights reserved.
//

const int LinkListNotFound = -1; // 数据找不到的返回值
typedef void * LinkListNodeValue; // 节点里面的数据

typedef struct _linkListNode linkListNode;
struct _linkListNode{
    LinkListNodeValue value; //节点数据
    linkListNode *next; //下一个节点
};

typedef struct {
    int length;// 长度(当前节点的数量)
    linkListNode *header; //头结点(header->next用来指向首元素)
} LinkList;//线性表

#define typedef_LinkList

#include "LinkList.h"
#include <stdlib.h>

void LinkList_Print(LinkList *list,LinkListPrintFunc func){
    if (list == NULL)
        return;
    printf("length = %d\n",list->length);
    printf("value = [");
    linkListNode *currendNode = list->header;
    for (int i = 0; i<list->length;i++) {
        currendNode = currendNode->next;
        if (func) {
            func(currendNode->value);
        }else{
            printf("%p",currendNode->value);
        }
        if (i != list->length-1) {
            printf(",");
        }
    }
    printf("]\n\n");
}

// 创建
LinkList *LinkList_Create(){
//    分配线性空间
    LinkList *list = malloc(sizeof(LinkList) + sizeof(linkListNode));
    if(list){
        list->length = 0;
        list->header = (linkListNode *)(list + 1);
    }
    return list;
}

// 清空
void LinkList_Clear(LinkList *list){
    if(list == NULL) return;
//    删除所有的节点
    linkListNode *currendNode = list->header;
    while (currendNode) {
        linkListNode *nextNode = currendNode->next;
        if (nextNode == NULL) break;
        currendNode->next = nextNode->next;
        free(nextNode);
        nextNode = NULL;
    }
    list->header->next = NULL;
    list->length = 0;
}

// 销毁
void LinkList_Destroy(LinkList *list){
    if (list == NULL)return;
//    删除所有的节点
    LinkList_Clear(list);
//    删除线性表和header节点
    free(list);
    list = NULL;
}

// 获取长度
int LinkList_Length(LinkList *list){
    if (list == NULL) return 0;
    return list->length;
}
// 获取index位置 对应的数据
LinkListNodeValue LinkList_get(LinkList *list, int index){
    if (list == NULL || index<0 || index >= list->length) {
        return NULL;
    }
    linkListNode *currendNode = list->header;
    for (int i = 0; i <= index; i++) { // i最大值是index
        currendNode = currendNode->next;// currendNode正好是i的最大值
    }
    return currendNode->value;
    
}
// 获取某个数据对应的位置
int LinkList_index(LinkList *list, LinkListNodeValue value){
    if (list == NULL) return LinkListNotFound;
//    遍历所有的元素
    linkListNode *currendNode = list->header;
    for (int i = 0; i < list->length; i++) {
        currendNode = currendNode->next;
        if (currendNode->value == value) {
            return i;
        }
    }
    return LinkListNotFound;
}
// 往index位置中插入数据
void LinkList_insert(LinkList *list,int index, LinkListNodeValue value){
    if (list == NULL || index < 0 || index > list->length) return;
//    创建新节点
    linkListNode *newNode = malloc(sizeof(linkListNode));
    newNode->value = value;
    if (newNode == NULL) return;
    
//    找到index-1 位置的节点
    linkListNode *currendNode = list->header;
    for (int i = 0; i<index; i++) {
        currendNode = currendNode->next;
    }
//    插入节点之前，交互下一个节点的地址
    newNode->next = currendNode->next;
    currendNode->next = newNode;
    
//    数量增加
    list->length++;
}
// 往最后位置添加数据
void LinkList_add(LinkList *list,LinkListNodeValue value){
    if (list == NULL)return;
    LinkList_insert(list, list->length, value);
}
// 设置index位置的数据
void LinkList_set(LinkList *list,int index,LinkListNodeValue value){
    if (list == NULL || index < 0 || index >= list->length)
        return;
//    找到index位置
    linkListNode *currendNode = list->header;
    for (int i = 0; i <= index; i++) {
        currendNode = currendNode->next;
    }
    currendNode->value = value;
    
}
// 删除index位置的数据
LinkListNodeValue LinkList_remove(LinkList *list,int index){
    if (list == NULL || index < 0 || index >= list->length)
        return NULL;
    
//    找到index-1 位置上的数据
    linkListNode *currendNode = list->header;
    for (int i = 0; i < index; i++) {
        currendNode = currendNode->next;
    }
//    需要被删除的节点
    linkListNode *removeNode = currendNode->next;
//    将要删除的下一个节点付给当前节点
    currendNode->next = removeNode->next;
    
//   保留被删除节点的数据
    LinkListNodeValue value = removeNode->value;
    free(removeNode);
    removeNode = NULL;
    
//    数量减少
    list->length--;
    return value;
}
// 删除某种数据
void LinkList_remove_value(LinkList *list,LinkListNodeValue value){
    if (list == NULL) return;
    linkListNode *currendNode = list->header;
    while (currendNode) {
//        找到下一个节点
        linkListNode *nextNode = currendNode->next;
        if (nextNode == NULL)
            return;
        if (nextNode->value == value) {
//            删除当前节点，将当前节点next指针指向下一个节点
            currendNode->next = nextNode->next;
            free(nextNode);
            nextNode = NULL;
//            长度减少
            list->length--;
        }else{
//            不需要删除
            currendNode = nextNode;
        }
        
    }
}
