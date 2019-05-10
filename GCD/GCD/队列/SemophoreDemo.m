//
//  SemophoreDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "SemophoreDemo.h"

@interface SemophoreDemo ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) dispatch_semaphore_t moneySemaphore;

@end

@implementation SemophoreDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
//        创建幸好量，最大并发数
        self.semaphore = dispatch_semaphore_create(5);
        self.moneySemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

-(void)saveMoney{
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    [super saveMoney];
    dispatch_semaphore_signal(self.moneySemaphore);
}
-(void)drawMoney{
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    [super drawMoney];
    dispatch_semaphore_signal(self.moneySemaphore);
}

-(void)othertest{
    for (int i = 0; i<20; i++) {
        [[[NSThread alloc]initWithTarget:self selector:@selector(test) object:nil]start];
    }
}

-(void)test{
//    当信号量的值 > 0 时， 信号量减一然后继续往下执行代码
//    当信号量的值 <= 0 时，就会休眠等待知道信号量的值变成>0, 就让信号量减一，然后i继续执行代码
//    让信号量减一
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    sleep(1);
    NSLog(@"test...%@",[NSThread currentThread]);
    
//    让信号量加一
    dispatch_semaphore_signal(self.semaphore);
}

@end
