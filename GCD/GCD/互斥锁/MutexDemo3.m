//
//  MutexDemo3.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

//cond 条件锁，生产-消费者模式

#import "MutexDemo3.h"
#import <pthread.h>
@interface MutexDemo3 ()

@property (nonatomic, assign) pthread_mutex_t mutex;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation MutexDemo3

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        pthread_mutexattr_t attr_t;
        pthread_mutexattr_init(&attr_t);
        pthread_mutexattr_settype(&attr_t, PTHREAD_MUTEX_DEFAULT);
//        初始化锁
        pthread_mutex_init(&_mutex, &attr_t);
        pthread_mutexattr_destroy(&attr_t);
        
//        初始化条件
        pthread_cond_init(&_cond, NULL);
        self.data = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)othertest{
    
//    移除
    [[[NSThread alloc]initWithTarget:self selector:@selector(remove) object:nil] start];
//    添加
    [[[NSThread alloc]initWithTarget:self selector:@selector(add) object:nil] start];
}

-(void)remove{
    pthread_mutex_lock(&_mutex);
     NSLog(@"__remove - begin");
    if (self.data.count == 0) {
        pthread_cond_wait(&_cond, &_mutex);
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    pthread_mutex_unlock(&_mutex);
}

-(void)add{
    pthread_mutex_lock(&_mutex);
     sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
//    信号
    pthread_cond_signal(&_cond);
//    广播
//    pthread_cond_broadcast(&_cond);
    
    pthread_mutex_unlock(&_mutex);
}

-(void)dealloc{
    pthread_mutex_destroy(&_mutex);
    pthread_cond_destroy(&_cond);
}

@end
