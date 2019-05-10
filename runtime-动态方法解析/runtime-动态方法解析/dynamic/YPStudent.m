//
//  YPStudent.m
//  runtime-动态方法解析
//
//  Created by 赖永鹏 on 2019/3/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPStudent.h"
#import <objc/runtime.h>
@implementation YPStudent

/*
告诉编译器不用自动生成set和get方法
 */
@dynamic age;

void setAge (id self,SEL _cmd,int age){
    NSLog(@"%@ %@,%d",self,NSStringFromSelector(_cmd),age);
}

-(int)age{
    return 120;
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(setAge:)) {
        class_addMethod(self, sel, (IMP)setAge, "v@:i");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}


@end
