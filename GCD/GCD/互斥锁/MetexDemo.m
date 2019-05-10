//
//  MetexDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

//互斥锁会出于休眠状态
#import "MetexDemo.h"
#import <pthread.h>
@interface MetexDemo ()

@property (nonatomic, assign) pthread_mutex_t moneyMutex;

@end

@implementation MetexDemo

-(void)initMutex:(pthread_mutex_t *)mutex{
    
//    静态初始化
//    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
//    初始化带属性
    pthread_mutexattr_t attr_t;
    pthread_mutexattr_init(&attr_t);
    pthread_mutexattr_settype(&attr_t, PTHREAD_MUTEX_DEFAULT);
    pthread_mutex_init(mutex, &attr_t);
    pthread_mutexattr_destroy(&attr_t);
    
//    初始化锁
//    pthread_mutex_init(mutex, NULL);
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        [self initMutex:&_moneyMutex];
    }
    return self;
}

-(void)saveMoney{
    pthread_mutex_lock(&_moneyMutex);
    [super saveMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

-(void)drawMoney{
    pthread_mutex_lock(&_moneyMutex);
    [super drawMoney];
    pthread_mutex_unlock(&_moneyMutex);
}

-(void)dealloc{
    pthread_mutex_destroy(&_moneyMutex);
}

@end
