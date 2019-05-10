//
//  NSMutableDictionary+YPExtension.m
//  方法交换
//
//  Created by 赖永鹏 on 2019/4/23.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "NSMutableDictionary+YPExtension.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (YPExtension)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class clsM = NSClassFromString(@"__NSDictionaryM");
        Method mMethod = class_getInstanceMethod(clsM, @selector(setObject:forKeyedSubscript:));
        Method mCustomM = class_getInstanceMethod(clsM, @selector(yp_setObject:forKeyedSubscript:));
        method_exchangeImplementations(mMethod, mCustomM);
        
        Class clsI = NSClassFromString(@"__NSDictionaryI");
        Method method3 = class_getInstanceMethod(clsI, @selector(objectForKeyedSubscript:));
        Method method4 = class_getInstanceMethod(clsI, @selector(yp_objectForKeyedSubscript:));
        method_exchangeImplementations(method3, method4);
    });
    
}

-(void)yp_setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key{
    if (!key) {
        return;
    }
    [self yp_setObject:obj forKeyedSubscript:key];
}
- (id)yp_objectForKeyedSubscript:(id)key
{
    if (!key) return nil;
    
    return [self yp_objectForKeyedSubscript:key];
}

@end
