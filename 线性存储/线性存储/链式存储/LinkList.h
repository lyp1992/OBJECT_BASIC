//
//  LinkList.h
//  线性存储
//
//  Created by 赖永鹏 on 2019/2/15.
//  Copyright © 2019年 LYP. All rights reserved.
//

#ifndef LinkList_h
#define LinkList_h

#include <stdio.h>

#ifndef typedef_LinkList
typedef void * LinkListNodeValue; // 节点里面的数据
typedef void LinkList; // 线性表
#endif

extern const int LinkListNotFound; // 数据找不到的返回值
typedef void (*LinkListPrintFunc) (LinkListNodeValue value);//打印函数
void LinkList_Print(LinkList *list,LinkListPrintFunc func);//打印

// 创建
LinkList *LinkList_Create();

// 清空
void LinkList_Clear(LinkList *list);
// 销毁
void LinkList_Destroy(LinkList *list);

// 获取长度
int LinkList_Length(LinkList *list);
// 获取index位置 对应的数据
LinkListNodeValue LinkList_get(LinkList *list, int index);
// 获取某个数据对应的位置
int LinkList_index(LinkList *list, LinkListNodeValue value);
// 往index位置中插入数据
void LinkList_insert(LinkList *list,int index, LinkListNodeValue value);
// 往最后位置添加数据
void LinkList_add(LinkList *list,LinkListNodeValue value);
// 设置index位置的数据
void LinkList_set(LinkList *list,int index,LinkListNodeValue value);
// 删除index位置的数据
LinkListNodeValue LinkList_remove(LinkList *list,int index);
// 删除某种数据
void LinkList_remove_value(LinkList *list,LinkListNodeValue value);



#endif /* LinkList_h */
