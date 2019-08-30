//
//  Person.m
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/26.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "Person.h"
#import "SwiftToOC-Swift.h"

@implementation Person

-(instancetype)initWithAge:(int)age withName:(NSString *)name{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

-(void)eat:(NSString *)eatName howMuchToEat:(CGFloat)eatNumbers{
    NSLog(@"%s",__func__);
}
-(void)run{
    NSLog(@"name=%@ age=%d",self.name,self.age);
}

int sum(int a,int b){
    YPCar *car = [[YPCar alloc]initWithPrice:100 master:@"lyx"];
    car.price = 120;
    car.name = @"lyxx";
    [car drive];
    [YPCar run];
    [car test];
    

    
    return a+b;
}

@end


