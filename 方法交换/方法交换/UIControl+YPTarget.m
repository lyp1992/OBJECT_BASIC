//
//  UIControl+YPTarget.m
//  方法交换
//
//  Created by 赖永鹏 on 2019/4/23.
//  Copyright © 2019年 LYP. All rights reserved.
//

//拦截所有的点击事件
#import "UIControl+YPTarget.h"
#import <objc/runtime.h>
@implementation UIControl (YPTarget)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //    方法交换
        
        Method selfMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
        Method customMethod = class_getInstanceMethod(self, @selector(yp_sendAction:to:forEvent:));
        method_exchangeImplementations(selfMethod, customMethod);
    });
}

-(void)yp_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
    NSLog(@"%s",__func__);
    [self yp_sendAction:action to:target forEvent:event];
}

@end
