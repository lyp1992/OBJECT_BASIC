//
//  UIButton+YPBlock.h
//  扩大点击范围
//
//  Created by laiyp on 2018/7/31.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YPBlock)

-(void)yp_addEventHandler:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents;

@end
