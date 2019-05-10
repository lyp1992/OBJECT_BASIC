//
//  YPPerson.m
//  runtime-动态方法解析
//
//  Created by 赖永鹏 on 2019/3/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPPerson.h"
#import <objc/runtime.h>
#import "YPCat.h"
@implementation YPPerson

/*
 不带返回值
 */
//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    
//    if (aSelector == @selector(test)) {
////       objc_msgSend([[YPCat alloc]init],aSelector)
//        return [[YPCat alloc]init];
//    }
//    
//    return [super forwardingTargetForSelector:aSelector];
//}

////方法签名：返回值类型，参数类型
//-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    if (aSelector == @selector(test)) {
//        return [NSMethodSignature signatureWithObjCTypes:"V16@0:8"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
///*
// Invocation 包含了， 方法调用者，方法名，方法参数
// anInvocation.target 方法调用者
// anInvocation.selector 方法名
//  [anInvocation getArgument:NULL atIndex:0]
// */
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//
//   YPCat *cat = [[YPCat alloc]init];
//    anInvocation.target = cat;
//    [anInvocation invoke];
//
//}

//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(haveAge:)) {
//        return [[YPCat alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

/*
 带返回值
 */

//-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    if (aSelector == @selector(haveAge:)) {
//
////        return [[[YPCat alloc]init] methodSignatureForSelector:aSelector];
////        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
//        return [NSMethodSignature signatureWithObjCTypes:"i20@0:8i16"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//
//    [anInvocation invokeWithTarget:[[YPCat alloc]init]];
//    int ret ;
//    [anInvocation getReturnValue:&ret];
//    NSLog(@"ret ==%d",ret);
//}

//+(id)forwardingTargetForSelector:(SEL)aSelector{
//
//    if(aSelector == @selector(test)){
//        return [[YPCat alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

/*
 消息转发在项目中的应用，可以用来容错
 */
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if([self respondsToSelector:aSelector]){
        return [super methodSignatureForSelector:aSelector];
    }
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{

    NSLog(@"找不到%@方法",NSStringFromSelector(anInvocation.selector));

}

@end
