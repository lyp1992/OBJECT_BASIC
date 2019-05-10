//
//  ViewController.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "ViewController.h"
#import "OSSPinLockDemo.h"
#import "BaseTool.h"
#import "OSUnfairLockDemo.h"
#import "MetexDemo.h"
#import "MutexDemo2.h"
#import "MutexDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "serialQueueDemo.h"
#import "SemophoreDemo.h"
#import "SynchronizedDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    OSSPinLockDemo *spinlock = [[OSSPinLockDemo alloc]init];
//    [spinlock moneyTest];

//    BaseTool *tool = [[BaseTool alloc]init];
//    [tool moneyTest];
    
//    OSUnfairLockDemo *unfairDemo = [[OSUnfairLockDemo alloc]init];
//    [unfairDemo moneyTest];
    
//    MetexDemo *mutexDemo = [[MetexDemo alloc]init];
//    [mutexDemo moneyTest];
    
//    MutexDemo2 *mutexDemo2 = [[MutexDemo2 alloc]init];
//    [mutexDemo2 othertest];
    
//    MutexDemo3 *mutexDemo3 = [[MutexDemo3 alloc]init];
//    [mutexDemo3 othertest];
    
//    NSLockDemo *lockDemo = [[NSLockDemo alloc]init];
//    [lockDemo moneyTest];
    
    
//    NSConditionDemo *conditionDemo = [[NSConditionDemo alloc]init];
//    [conditionDemo othertest];

//    NSConditionLockDemo *conLockDemo = [[NSConditionLockDemo alloc]init];
//    [conLockDemo othertest];
    
//    serialQueueDemo *seriaQueue = [[serialQueueDemo alloc]init];
//    [seriaQueue moneyTest];
    
//    SemophoreDemo *semaphoreDemo = [[SemophoreDemo alloc]init];
////    [semaphoreDemo othertest];
//    [semaphoreDemo moneyTest];
    
    SynchronizedDemo *sybDemo = [[SynchronizedDemo alloc]init];
    [sybDemo moneyTest];
}

-(void)injected{
    [self viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    创建组
    dispatch_group_t group = dispatch_group_create();
//    创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("GroupQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"1--%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 5; i++) {
            NSLog(@"2--%@",[NSThread currentThread]);
        }
    });
    
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"3--%@",[NSThread currentThread]);
//        }
//    });
    
//    dispatch_group_notify(group, queue, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"3--%@",[NSThread currentThread]);
//        }
//    });
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            for (int i = 0; i < 5; i++) {
                NSLog(@"3--%@",[NSThread currentThread]);
            }
        });
    });
    
}

@end
