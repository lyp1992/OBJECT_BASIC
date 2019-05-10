//
//  NSConditionLockDemo.m
//  GCD
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()

@property (nonatomic, strong) NSConditionLock *conditionLock;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation NSConditionLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.conditionLock = [[NSConditionLock alloc]initWithCondition:1];
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
    
    [self.conditionLock lockWhenCondition:2];
    [self.data removeAllObjects];
    NSLog(@"删除原色");
    [self.conditionLock unlockWithCondition:2];

}

-(void)add{
    
    [self.conditionLock lockWhenCondition:1];
    [self.data addObject:@"Test"];
    NSLog(@"添加元素");
    [self.conditionLock unlockWithCondition:2];
}

@end
