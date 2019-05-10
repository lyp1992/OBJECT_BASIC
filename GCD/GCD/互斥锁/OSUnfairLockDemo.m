//
//  OSUnfairLockDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()

@end

//只有在oiOS10 以上才有
static os_unfair_lock _moneyLock;

@implementation OSUnfairLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _moneyLock = OS_UNFAIR_LOCK_INIT;
       
    }
    return self;
}

-(void)saveMoney{
    os_unfair_lock_lock(&_moneyLock);
    [super saveMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

-(void)drawMoney{
    os_unfair_lock_lock(&_moneyLock);
    [super drawMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

@end
