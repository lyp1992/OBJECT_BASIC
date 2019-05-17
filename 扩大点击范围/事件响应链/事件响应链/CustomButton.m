//
//  CustomButton.m
//  事件响应链
//
//  Created by 赖永鹏 on 2019/5/14.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (!self.userInteractionEnabled || [self isHidden] || self.alpha <= 0.0) {
        return  nil;
    }
    if ([self pointInside:point withEvent:event]) {
//        遍历当前对象的子对象
        __block UIView *hitV = nil;
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//           转换坐标
            CGPoint converPoint = [self convertPoint:point toView:obj];
//            获取hitview
            hitV = [self hitTest:converPoint withEvent:event];
            if (hitV) {
                *stop = YES;
            }
        }];
        if (hitV) {
            return hitV;
        }else{
            return self;
        }
        
    }else{
        return nil;
    }
}

// 获取点击方位
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    CGFloat x2 = self.frame.size.width/2;
    CGFloat y2 = self.frame.size.height/2;
    
//    计算是否在self的范围内
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    if (dis <= self.frame.size.width/2) {//这么算其实不准确，他算得是以x2为半斤的圆。
        return YES;
    }
//    这种算法才相对准确
//    BOOL valideX = (fabs(x1 - x2) <= x2);
//    BOOL valideY = (fabs(y1 - y2) <= y2);
//
//    if (valideX && valideY){
//        return YES;
//    }
    return NO;
}

// 相应流程 事件触发 -uiapplication - 
//触摸事件->UIApplication->[UIWindow hitTest]->白色View[whiteView hitTest]
@end
