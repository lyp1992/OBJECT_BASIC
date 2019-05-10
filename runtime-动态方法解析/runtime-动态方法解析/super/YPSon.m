//
//  YPSon.m
//  runtime-动态方法解析
//
//  Created by 赖永鹏 on 2019/3/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPSon.h"

@implementation YPSon

/*
 [super message];
 receiver 还是self
 但是方法是从父类开始查找
 */
struct objc_super {
    __unsafe_unretained _Nonnull id receiver; // 消息接收者
    __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
};

-(void)run{
    [super run];
    
//    static void _I_YPSon_run(YPSon * self, SEL _cmd) {
//        ((void (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("YPSon"))}, sel_registerName("run"));
//        NSLog((NSString *)&__NSConstantStringImpl__var_folders_2r__m13fp2x2n9dvlr8d68yry500000gn_T_MJStudent_69ea3c_mi_0);
//    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSLog(@"[self class]== %@",[self class]);//ypson
        NSLog(@"[self superclass] ==%@",[self superclass]);//ypsuper
        NSLog(@"[super class]==%@",[super class]);//ypson
        NSLog(@"[super superclass]==%@",[super superclass]);//ypsuper
        
    }
    return self;
}

@end
