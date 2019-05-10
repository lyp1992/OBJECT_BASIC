//
//  main.m
//  线性存储
//
//  Created by 赖永鹏 on 2019/1/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

/*
 
 栈：
    1. 通过声明局部变量来申请内存空间
    2. 栈空间的声明周期由函数把控（函数执行完毕，占空间就会被收回）
 
 堆：
    1. 通过malloc函数申请内存空间
    2. 通过free函数销毁之前申请的内存空间
 
 */

#import <Foundation/Foundation.h>
#import "ArrayList.h"
#import "Person.h"
#import "NSArray+Address.h"
#import "LinkList.h"

void testInt(){
    // 创建
    ArrayList *list = List_Create(10);
    
    // 添加数据
    List_Insert(list, 0, (ArrayListNodeValue)20);
    List_Add(list, (ArrayListNodeValue)30);
    List_Add(list, (ArrayListNodeValue)50);
    List_Add(list, (ArrayListNodeValue)50);
    List_Add(list, (ArrayListNodeValue)40);
    List_Add(list, (ArrayListNodeValue)50);
    List_Add(list, (ArrayListNodeValue)50);
    
    List_print(list, NULL);
    
//    获取某个数据
   ArrayListNodeValue value = List_Get(list, 1);
    printf("%d -- vlaue \n",(int)value);
    List_Set(list, 5,(ArrayListNodeValue)60);
    ArrayListNodeValue value1 = List_Get(list, 5);
    printf("%d -- vlaue \n",(int)value1);
    
    // 删除数据
    List_RemoveValue(list, (ArrayListNodeValue)50);
    List_print(list, NULL);
    // 清空
    List_Clear(list);
    
    List_print(list, NULL);
    
    // 销毁
    List_Destroy(list);
    list = NULL;
}

void printPerson (ArrayListNodeValue value){
    NSLog(@"%@--value\n",(__bridge Person *)value);
}
void testObject() {
    
    Person *p1=  [Person personWithName:@"person1"];
    Person *p2=  [Person personWithName:@"person2"];
    Person *p3=  [Person personWithName:@"person3"];
    
    ArrayList *list = List_Create(10);
    List_Add(list, (__bridge ArrayListNodeValue)(p1));
    List_Add(list, (__bridge ArrayListNodeValue)p2);
    List_Add(list, (__bridge ArrayListNodeValue)p3);
    
    List_print(list, printPerson);
    // 销毁
    List_Destroy(list);
    list = NULL;
}

//扩容
void testExpand(){
    
    ArrayList *list = List_Create(5);
    
    for (int i = 0; i<20; i++) {
        List_Add(list, (ArrayListNodeValue)i);
        NSLog(@"元素：%d-- 元素首地址：%p",List_length(list),*(void **)list + 1);
    }
    List_Destroy(list);
    list = NULL;
}

void printIntFunc(LinkListNodeValue value)
{
    printf("%d", (int)value);
}

//链式存储
void testLinkList(){
 
    LinkList *list = LinkList_Create(10);
//   添加数据
    LinkList_insert(list, 0, (LinkListNodeValue)20);
    LinkList_add(list, (LinkListNodeValue)10);
    LinkList_add(list, (LinkListNodeValue)30);
    LinkList_add(list, (LinkListNodeValue)40);
    LinkList_add(list, (LinkListNodeValue)50);

    LinkList_Print(list, printIntFunc);
    
    // 设置某个位置的数据
    LinkList_set(list, 1, (LinkListNodeValue)25);
    LinkList_insert(list, 0, (LinkListNodeValue)77);
    
    LinkList_Print(list, printIntFunc);
    // 清空
    LinkList_Clear(list);
    
    LinkList_Print(list, printIntFunc);
    LinkList_Destroy(list);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        testInt();
//        testObject();
//        testExpand();
        testLinkList();
    }
    return 0;
}
