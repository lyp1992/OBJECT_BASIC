//
//  main.m
//  Copy
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 拷贝：拷贝的目的s就是复制一份，保持和源对象不一致
 深拷贝：产生一个新对象
 浅拷贝：只拷贝对象的值，指针依然指向源对象的地址
 */

void test(){
    NSMutableString *str = [[NSMutableString alloc]initWithString:@"Test"];
    NSString *str1 = [str copy];//深拷贝
    NSMutableString *str2 = [str mutableCopy];//深拷贝
//    str=0x100600080-str1=0x7473655445-str2=0x100600600
    NSLog(@"str=%p-str1=%p-str2=%p",str,str1,str2);
}

void test1(){
    
    NSString *str = @"Test";
    NSString *str1 = [str copy];//浅拷贝
    NSMutableString *str2 = [str mutableCopy];//深拷贝
    NSString *str3 = [str mutableCopy];//深拷贝
//  str=0x100001040-str1=0x100001040-str2=0x1005771f0
    NSLog(@"str=%p-str1=%p-str2=%p-str3%p",str,str1,str2,str3);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
        test1();
        
    }
    return 0;
}
