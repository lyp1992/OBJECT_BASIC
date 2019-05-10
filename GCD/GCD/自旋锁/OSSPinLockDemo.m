//
//  OSSPinLockDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//
//自旋锁是一直处于忙等状态，内部类似一个while循环，
#import "OSSPinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSPinLockDemo ()

@end

@implementation OSSPinLockDemo

static OSSpinLock _spinlock;

- (instancetype)init
{
    self = [super init];
    if (self) {
//        创建锁
        _spinlock = OS_SPINLOCK_INIT;
    }
    return self;
}

-(void)saveMoney{
    OSSpinLockLock(&_spinlock);
    [super saveMoney];
    OSSpinLockUnlock(&_spinlock);
}

-(void)drawMoney{
    OSSpinLockLock(&_spinlock);
    [super drawMoney];
    OSSpinLockUnlock(&_spinlock);
}

@end
