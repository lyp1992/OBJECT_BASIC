//
//  YPCat.m
//  runtime-动态方法解析
//
//  Created by 赖永鹏 on 2019/3/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPCat.h"

@implementation YPCat

-(void)test{
    NSLog(@"YPCat--test");
}

+(void)test{
    NSLog(@"YPCat++test");
}

-(int)haveAge:(int)age{
    
    return age * 2;
}

@end
