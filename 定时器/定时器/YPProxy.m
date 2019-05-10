//
//  YPProxy.m
//  定时器
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPProxy.h"

@implementation YPProxy

+(instancetype)proxyWithTarget:(id)target{
    YPProxy *proxy = [YPProxy alloc];
    proxy.target = target;
    return proxy;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    
    [invocation invokeWithTarget:self.target];
}

@end
