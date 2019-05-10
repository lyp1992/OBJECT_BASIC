//
//  UIView+YPBlock.h
//  扩大点击范围
//
//  Created by laiyp on 2018/7/31.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YPBlock)

-(void)yp_AddTapped:(void(^)(void))tappedBlock;

@end
