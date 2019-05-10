//
//  myClass.m
//  catorgray
//
//  Created by laiyp on 2018/7/6.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "myClass.h"

@implementation myClass

-(void)printName{
    NSLog(@"%@",@"myClass");
}

@end

@implementation myClass(MyAddition)

-(void)printName{
    NSLog(@"%@",@"MyAddition");
}

@end

