//
//  DrawColorView.m
//  颜色选择器
//
//  Created by laiyp on 2018/8/13.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "DrawColorView.h"

@implementation DrawColorView

-(void)setSlideValue:(CGFloat)slideValue{
    _slideValue = slideValue;
}
-(void)setCurrentColor:(UIColor *)currentColor{
    _currentColor = currentColor;
}
-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0,0.0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, 0.0)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [self.currentColor CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = self.slideValue;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.layer addSublayer:pathLayer];
}

@end
