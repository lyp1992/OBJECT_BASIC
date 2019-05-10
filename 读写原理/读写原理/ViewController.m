//
//  ViewController.m
//  读写原理
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

/*
 atomic和nonatomic
 atom:原子，不可在分割的单位
 atomic: 原子性操作
 
 给属性加上atomic属性,可以保证属性的setter和getter方法都是原子性操作
 也就是保证了setter和getter内部都是线程同步的
 
 */

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()

@property (nonatomic, assign) pthread_rwlock_t rwlock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    初始化锁
     pthread_rwlock_init(&_rwlock, NULL);
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i<5; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
    }
    for (int i = 0; i<5; i++) {
        dispatch_async(queue, ^{
            [self write];
        });
    }
    
}

-(void)read{
    pthread_rwlock_rdlock(&_rwlock);
    sleep(1);
    NSLog(@"read Data");
    pthread_rwlock_unlock(&_rwlock);
}

-(void)write{
    pthread_rwlock_wrlock(&_rwlock);
    sleep(1);
    NSLog(@"write Data");
    pthread_rwlock_unlock(&_rwlock);
}

@end
