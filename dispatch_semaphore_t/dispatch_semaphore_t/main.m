//
//  main.m
//  dispatch_semaphore_t
//
//  Created by laiyp on 2018/7/23.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
//        需求，创建三个并发任务，第三个要等前两个执行完成之后才会执行
//        dispatch_group_t group = dispatch_group_create();
//        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"执行A");
//        });
//        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"执行B");
//        });
//    dispatch_notify(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//            NSLog(@"执行D");
//
//        });
        
        
//        创建线程数组
        dispatch_group_t group = dispatch_group_create();
//        创建并发量
        static int number = 5;
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(number);
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        for (int i = 0; i<50; i++) {
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            dispatch_group_async(group, queue, ^{
//                sleep(3);
                dispatch_semaphore_signal(semaphore);
                NSLog(@"并发量减一，通知下一个");
            });
            NSLog(@"并发量%d",number);
            number -- ;
        }
        dispatch_group_wait(group,DISPATCH_TIME_FOREVER);
        dispatch_group_notify(group, queue, ^{
            NSLog(@"执行完成");
        });
        
    }
    return 0;
}
