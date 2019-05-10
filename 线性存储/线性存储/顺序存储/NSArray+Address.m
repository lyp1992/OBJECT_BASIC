//
//  NSArray+Address.m
//  线性存储
//
//  Created by 赖永鹏 on 2019/2/1.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "NSArray+Address.h"

@implementation NSArray (Address)

-(void *)printAdress{
    
    void *adress = (__bridge void *)self;
    
    return *((void **)adress + 5);
}

@end
