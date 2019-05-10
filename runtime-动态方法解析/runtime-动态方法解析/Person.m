//
//  Person.m
//  runtime-动态方法解析
//
//  Created by 赖永鹏 on 2019/3/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person

void c_object(id self,SEL _cmd ){
    
    NSLog(@"%@--%@",self,NSStringFromSelector(_cmd));
}

-(void)other{
    NSLog(@"%s--",__func__);
}

//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//        class_addMethod(self, sel, (IMP)c_object, "V16@0:8");
//        return YES;
//    }
//
//    return [super resolveInstanceMethod:sel];
//}
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//
////        获取其他方法
//      Method method = class_getInstanceMethod(self, @selector(other));
////        e给test动态添加方法
//        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
//
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}


struct method_t {
    SEL sel;
    char *types;
    IMP imp;
};

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(test)) {
        struct method_t *method = (struct method_t *)class_getInstanceMethod(self, @selector(other));
        
        class_addMethod(self, sel, method->imp, method->types);
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//+(BOOL)resolveClassMethod:(SEL)sel{
//    if (sel == @selector(test)) {
//        class_addMethod(object_getClass(self), sel, (IMP)c_object, "V16@0:8");
//        return YES;
//    }
//    return [super resolveClassMethod:sel];
//}



@end
