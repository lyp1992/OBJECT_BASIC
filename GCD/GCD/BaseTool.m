//
//  BaseTool.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "BaseTool.h"

@interface BaseTool ()

@property (nonatomic, assign) CGFloat money;

@end

@implementation BaseTool

-(void)othertest{
    
}

-(void)moneyTest{
    self.money = 200;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [self drawMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            [self saveMoney];
        }
    });
}

-(void)saveMoney{
    CGFloat oldMoney = self.money;
    sleep(.2);
    oldMoney += 20;
    self.money = oldMoney;
    NSLog(@"存20，还剩%f元 - %@", oldMoney, [NSThread currentThread]);
}
-(void)drawMoney{
    CGFloat oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    NSLog(@"取20，还剩%f元 - %@", oldMoney, [NSThread currentThread]);
}

@end
