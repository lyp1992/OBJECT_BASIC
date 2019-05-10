//
//  myClass+Catergory2.m
//  类别
//
//  Created by laiyp on 2018/7/6.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "myClass+Catergory2.h"
#import <objc/runtime.h>

@implementation myClass (Catergory2)

+(void)load{
    NSLog(@"%@",@"Catergory2");
}

-(void)printName{
    NSLog(@"%@",@"Catergory2");
}
-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)name{
    return objc_getAssociatedObject(self, "name");
}

@end
