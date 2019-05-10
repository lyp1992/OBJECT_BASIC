//
//  Student.m
//  Runtime-位运算
//
//  Created by 赖永鹏 on 2019/3/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "Student.h"

@interface Student ()
{
//    位域
    struct{
        char tall:1;
        char high:1;
        char weight:1;
    }_tallHighWeight;
}

@end

@implementation Student

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
-(void)setTall:(BOOL)tall{
    
    _tallHighWeight.tall = tall;
}

-(void)setHigh:(BOOL)high{
    _tallHighWeight.high = high;
}

-(void)setWeight:(BOOL)weight{
    _tallHighWeight.weight = weight;
}

-(BOOL)isHigh{
    return !!_tallHighWeight.high;
}

-(BOOL)isWeight{
    return !!_tallHighWeight.weight;
}

-(BOOL)isTall{
    return !!_tallHighWeight.tall;
}
@end
