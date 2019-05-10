//
//  SynchronizedDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "SynchronizedDemo.h"

@interface SynchronizedDemo ()


@end

@implementation SynchronizedDemo

static NSString *token;
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)saveMoney{
    
    @synchronized ([self class]) {
        
        [super saveMoney];
    }
    
}
-(void)drawMoney{
    @synchronized ([self class]) {
        [super drawMoney];
    }
}

@end
