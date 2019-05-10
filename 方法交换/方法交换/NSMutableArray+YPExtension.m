//
//  NSMutableArray+YPExtension.m
//  方法交换
//
//  Created by 赖永鹏 on 2019/4/23.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "NSMutableArray+YPExtension.h"
#import <objc/runtime.h>
@implementation NSMutableArray (YPExtension)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
//        类簇
        Class cls = NSClassFromString(@"__NSArrayM");
        Method selfMethod = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method custonMethod = class_getInstanceMethod(cls, @selector(yp_insertObject: atIndex:));

        method_exchangeImplementations(selfMethod, custonMethod);
        
    });
}
- (void)yp_insertObject:(id)object atIndex:(NSUInteger)idx{
    
    if (object == nil) {
        return;
    }
    [self yp_insertObject:object atIndex:idx];
}
@end
