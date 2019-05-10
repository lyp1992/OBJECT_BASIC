//
//  Person.h
//  Runtime-位运算
//
//  Created by 赖永鹏 on 2019/3/25.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

//getter:重写她的getter方法
//@property (nonatomic, assign,getter=isTall) BOOL tall;
//
//@property (nonatomic, assign,getter=isHigh) BOOL high;
//
//@property (nonatomic, assign,getter=isWeight) BOOL weight;

-(void)setTall:(BOOL)tall;
-(void)setHigh:(BOOL)high;
-(void)setWeight:(BOOL)weight;

-(BOOL)isHigh;
-(BOOL)isWeight;
-(BOOL)isTall;

@end

NS_ASSUME_NONNULL_END
