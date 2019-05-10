//
//  serialQueueDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "serialQueueDemo.h"

@interface serialQueueDemo ()

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation serialQueueDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
//        穿行队列
        self.queue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void)saveMoney{
    
    dispatch_sync(self.queue, ^{
        [super saveMoney];
    });
}
-(void)drawMoney{
    
    dispatch_sync(self.queue, ^{
        [super drawMoney];
    });
}

@end
