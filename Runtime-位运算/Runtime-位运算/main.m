//
//  main.m
//  Runtime-位运算
//
//  Created by 赖永鹏 on 2019/3/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "YPPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        Person *person = [[Person alloc]init];
        
        person.tall = YES;
        person.high = NO;
        person.weight = YES;
        
        NSLog(@"tall:%d high:%d weight:%d",person.isTall,person.isHigh,person.isWeight);
        
        Student *stu = [[Student alloc]init];
        stu.tall = YES;
        stu.high = YES;
        stu.weight = NO;
          NSLog(@"tall:%d high:%d weight:%d",stu.isTall,stu.isHigh,stu.isWeight);
     
        YPPerson *person1 = [[YPPerson alloc]init];
        
        person1.tall = YES;
        person1.high = YES;
        person1.weight = NO;
        
        NSLog(@"tall1:%d high1:%d weight1:%d",person1.isTall,person1.isHigh,person1.isWeight);
    }
    return 0;
}
