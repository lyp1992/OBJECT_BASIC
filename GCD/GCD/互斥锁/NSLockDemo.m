//
//  NSLockDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()

@property (nonatomic, strong) NSLock *moneyLock;

@end

@implementation NSLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = [[NSLock alloc]init];
    }
    return self;
}

-(void)saveMoney{
    [self.moneyLock lock];
    [super saveMoney];
    [self.moneyLock unlock];
}

-(void)drawMoney{
    [self.moneyLock lock];
    [super drawMoney];
    [self.moneyLock unlock];
}

-(void)dealloc{
  
}

@end
