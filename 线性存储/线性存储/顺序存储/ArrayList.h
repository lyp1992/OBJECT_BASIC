//
//  ArrayList.h
//  线性存储
//
//  Created by 赖永鹏 on 2019/1/28.
//  Copyright © 2019年 LYP. All rights reserved.
//
//顺序存储
#ifndef ArrayList_h
#define ArrayList_h

#include <stdio.h>

#ifndef typedef_ArrayList
typedef void * ArrayListNodeValue; // 节点里面的数据
typedef void ArrayList; // 线性表
#endif
extern const int ArrayListNotFound; // 数据找不到的返回值

//打印函数
typedef void(*ArrayListPrintFunc)(ArrayListNodeValue value);
void List_print(ArrayList *list,ArrayListPrintFunc func);

ArrayList *List_Create(int capacity);// 创建
// 清空
void List_Clear(ArrayList *list);
// 销毁
void List_Destroy(ArrayList *list);

// 获取长度
int List_length(ArrayList *list);
// 获得index位置对应的数据
ArrayListNodeValue List_Get(ArrayList *list,int index);
// 获得某个数据对应的index位置
int List_Index(ArrayList *list,ArrayListNodeValue value);

// 往index位置插入数据
void List_Insert(ArrayList *list,int index,ArrayListNodeValue value);
// 往最后面位置添加数据
void List_Add(ArrayList *list,ArrayListNodeValue value);
 // 设置index位置的数据
void List_Set(ArrayList *list,int index,ArrayListNodeValue value);

// 删除index位置的数据
ArrayListNodeValue List_Remove(ArrayList *list,int index);
// 删除某种数据
void List_RemoveValue(ArrayList *list,ArrayListNodeValue value);
#endif /* ArrayList_h */
