//
//  ViewReusePool.m
//  cell的重用机制
//
//  Created by 赖永鹏 on 2019/5/14.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()
//等待使用的队列
@property (nonatomic, strong) NSMutableSet *waitQueue;
//使用中的队列
@property (nonatomic, strong) NSMutableSet *usingQueue;

@end

@implementation ViewReusePool
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.waitQueue = [[NSMutableSet alloc]init];
        self.usingQueue = [[NSMutableSet alloc]init];
    }
    return self;
}

-(UIView *)dequeueResueableView{
    UIView *view = [self.waitQueue anyObject];
    if (view == nil) {
        return nil;
    }else{
//    进行队列移动
        [self.waitQueue removeObject:view];
        [self.usingQueue addObject:view];
        return view;
    }
}

-(void)addResumView:(UIView *)view{
    if (view == nil) {
        return;
    }
    [self.usingQueue addObject:view];
}

-(void)reset{
    UIView *view = nil;
    while ((view = [self.usingQueue anyObject])) {
//        进行队列移动
        [self.usingQueue removeObject:view];
        [self.waitQueue addObject:view];
    }
}

@end
