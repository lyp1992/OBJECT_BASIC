//
//  SliderView.h
//  颜色选择器
//
//  Created by laiyp on 2018/8/20.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Proportion)(UIColor* color);
@interface SliderView : UIView

@property (nonatomic, copy) Proportion proportionColor;
@property (nonatomic, strong) UIColor *currentColor;
//设置颜色渐变
-(void)setColorGradient;

@end
