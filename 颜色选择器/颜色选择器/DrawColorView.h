//
//  DrawColorView.h
//  颜色选择器
//
//  Created by laiyp on 2018/8/13.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawColorView : UIView

@property (nonatomic, assign) CGFloat slideValue;
@property (nonatomic, strong) UIColor *currentColor;

@end
