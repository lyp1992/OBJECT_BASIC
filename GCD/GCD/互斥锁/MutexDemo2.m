//
//  MutexDemo2.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "MutexDemo2.h"
#import <pthread.h>

@interface MutexDemo2 ()

@property (nonatomic, assign) pthread_mutex_t mutex;

@end

@implementation MutexDemo2

-(void)initMutex:(pthread_mutex_t *)mutex{
    
//   递归锁，y允许同一线程对y同一把锁进行重复加锁
    pthread_mutexattr_t attr_t;
    pthread_mutexattr_init(&attr_t);
    pthread_mutexattr_settype(&attr_t, PTHREAD_MUTEX_RECURSIVE);//递归锁
    
    pthread_mutex_init(mutex, &attr_t);
    pthread_mutexattr_destroy(&attr_t);
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initMutex:&_mutex];
    }
    return self;
}
//
-(void)othertest{
    pthread_mutex_lock(&_mutex);
    NSLog(@"%s",__func__);
    static int count = 0;
    if (count < 10) {
        count++;
        [self othertest];
    }
    pthread_mutex_unlock(&_mutex);
}

-(void)dealloc{
    pthread_mutex_destroy(&_mutex);
}

@end
