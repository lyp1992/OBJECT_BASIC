//
//  main.m
//  runtime-动态方法解析
//
//  Created by 赖永鹏 on 2019/3/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "YPPerson.h"
#import "YPStudent.h"
#import "YPSon.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Person *p = [[Person alloc]init];
////        [Person test];
//        [p test];
        
//        YPPerson *person = [[YPPerson alloc]init];
//        [person test];
        
//        NSLog(@"== %d",[person haveAge:15]);
        
        
//        [YPPerson test];
        
//        YPStudent *student = [[YPStudent alloc]init];
//        student.age = 20;
//        student.weight = 100.00;
//        NSLog(@"%d==%f",student.age,student.weight);
        
        YPSon *son = [[YPSon alloc]init];
        [son run];
        
        
    }
    return 0;
}
