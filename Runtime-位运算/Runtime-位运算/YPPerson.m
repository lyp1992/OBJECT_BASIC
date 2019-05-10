//
//  YPPerson.m
//  Runtime-位运算
//
//  Created by 赖永鹏 on 2019/3/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPPerson.h"

#define isTallMask (1<<0)
#define isHightMask (1<<1)
#define isWeightMask (1<<2)


@interface YPPerson ()
{
    union {
        char bits;
        struct{
            char tall:1;
            char high:1;
            char weight:1;
        };
    }_tallHightWeight;
}
@end

@implementation YPPerson

-(void)setTall:(BOOL)tall{
    if (tall) {
        _tallHightWeight.bits |= isTallMask;
    }else{
        _tallHightWeight.bits &= ~isTallMask;
    }
}

-(BOOL)isTall{
    return !!(_tallHightWeight.bits & isTallMask);
}

-(void)setHigh:(BOOL)high{
    if (high) {
        _tallHightWeight.bits |= isHightMask;
    }else{
        _tallHightWeight.bits &= ~isHightMask;
    }
}

-(BOOL)isHigh{// !! & 取特定位的值
    return !!(_tallHightWeight.bits & isHightMask);
}

-(void)setWeight:(BOOL)weight{
    if (weight) {
        _tallHightWeight.bits |= isWeightMask;
    }else{
        _tallHightWeight.bits &= ~isWeightMask;
    }
}

-(BOOL)isWeight{
    return !!(_tallHightWeight.bits & isWeightMask);
}


@end
