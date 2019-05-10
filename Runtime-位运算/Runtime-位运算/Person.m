//
//  Person.m
//  Runtime-位运算
//
//  Created by 赖永鹏 on 2019/3/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "Person.h"

#define isTallMask (1<<0)
#define isHightMask (1<<1)
#define isWeightMask (1<<2)

//#define isTallMask 1
//#define isHightMask 2
//#define isWeightMask 4

@interface Person ()
{
    char _tallHightWeight;
}
@end

@implementation Person


- (instancetype)init
{
    self = [super init];
    if (self) {
        _tallHightWeight = 0b00000100;
    }
    return self;
}
/*
    0100        0100
 |  0001       &0000
 =  0101       =0000
 &  0001      & 0001
 =  0001       =0000

 */
-(void)setTall:(BOOL)tall{
    if (tall) {
        _tallHightWeight |= isTallMask;
    }else{
        _tallHightWeight &= ~isTallMask;
    }
}

-(BOOL)isTall{
    return !!(_tallHightWeight & isTallMask);
}
/*
 set
    0100        0100
 |  0010       &0000
 =  0110       =0000
 get
 &  0010      & 0010
 =  0010       =0000
 */
-(void)setHigh:(BOOL)high{
    if (high) {
        _tallHightWeight |= isHightMask;
    }else{
        _tallHightWeight &= ~isHightMask;
    }
}

-(BOOL)isHigh{// !! & 取特定位的值
    return !!(_tallHightWeight & isHightMask);
}

-(void)setWeight:(BOOL)weight{
    if (weight) {
        _tallHightWeight |= isWeightMask;
    }else{
        _tallHightWeight &= ~isWeightMask;
    }
}

-(BOOL)isWeight{
    return !!(_tallHightWeight & isWeightMask);
}

@end
