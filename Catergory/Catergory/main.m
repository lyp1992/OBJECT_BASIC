//
//  main.m
//  Catergory
//
//  Created by laiyp on 2018/7/30.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test.h"
#import "Person+Test2.h"
#import <objc/runtime.h>

void getMethodListName(Class cls){
    unsigned int count;
//    获取方法列表
    Method *methodList = class_copyMethodList(cls, &count);
//    储存方法名
    NSMutableString *methodNames = [[NSMutableString alloc]init];
    for (int i = 0; i<count; i++) {
        Method method = methodList[i];
        NSString *nameStr = NSStringFromSelector(method_getName(method));
        [methodNames appendString:nameStr];
        [methodNames appendString:@","];
    }
    //释放
    free(methodList);
    NSLog(@"%@---%@",cls,methodNames);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [Person alloc];
        
//        这个方法说明了分类替换的方法其实还在，只是在方法列表中的位置靠后了。
        getMethodListName(object_getClass([Person class]));
    }
    return 0;
}
