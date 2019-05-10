//
//  YPPerson.h
//  Runtime-位运算
//
//  Created by 赖永鹏 on 2019/3/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPPerson : NSObject

-(void)setTall:(BOOL)tall;
-(void)setHigh:(BOOL)high;
-(void)setWeight:(BOOL)weight;

-(BOOL)isHigh;
-(BOOL)isWeight;
-(BOOL)isTall;

@end

NS_ASSUME_NONNULL_END
