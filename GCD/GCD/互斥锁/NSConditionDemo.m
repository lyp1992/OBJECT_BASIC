//
//  NSConditionDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo ()

@property (nonatomic, strong) NSCondition *conditionLock;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation NSConditionDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.conditionLock = [[NSCondition alloc]init];
        self.data = [NSMutableArray array];
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
    [self.conditionLock lock];
    NSLog(@"__remove - begin");
    if (self.data.count == 0) {
        [self.conditionLock wait];
    }
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    [self.conditionLock unlock];
}

-(void)add{
    [self.conditionLock lock];
    sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    [self.conditionLock signal];
    [self.conditionLock unlock];
}
@end
