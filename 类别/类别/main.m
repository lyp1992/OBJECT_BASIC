//
//  main.m
//  类别
//
//  Created by laiyp on 2018/7/6.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myClass.h"
#import <objc/runtime.h>

/**
//类别的作用
 1.将类的实现分散到不同的文件和框架中
 2.可以创建对私有方法的前向应用
 3.可以给类添加非正式协议
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class currenClass = [myClass class];
        myClass *myc = [[myClass alloc]init];
        [myc printName];
        
//        获取到被覆盖的方法
        if (currenClass) {
            unsigned int MethodCount;
            Method *methodlist = class_copyMethodList(currenClass, &MethodCount);
            IMP lastImp = NULL;
            SEL lastSel = NULL;
            for (NSInteger i = 0; i<MethodCount; i++) {
                Method method =methodlist[i];
                NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method)) encoding:NSUTF8StringEncoding];
                if ([@"printName" isEqualToString:methodName]) {
                    lastImp = method_getImplementation(method);
                    lastSel = method_getName(method);
                }
            }
            typedef void (*fn)(id,SEL);
            if (lastImp != NULL) {
                fn f = (fn)lastImp;
                f(myc,lastSel);
            }
            free(methodlist);
        }
    }
    return 0;
}
