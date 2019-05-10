//
//  UIView+ExpandScope.m
//  扩大点击范围
//
//  Created by laiyp on 2018/7/24.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "UIView+ExpandScope.h"
#import <objc/runtime.h>

static char TouchSizeKey;
@implementation UIView (ExpandScope)

-(void)setTouchSize:(CGSize)touchSize{
    objc_setAssociatedObject(self, &TouchSizeKey, [NSValue valueWithCGSize:touchSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(CGSize)touchSize{
    
    NSValue *touchSizeValue = objc_getAssociatedObject(self, &TouchSizeKey);
    CGSize touchsize = touchSizeValue.CGSizeValue;
    if (!touchSizeValue) {
        touchsize = self.bounds.size;
    }
    return touchsize;
}

//方法一
/*
 判断触摸点是否在控件上
 */
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat widthData = self.touchSize.width - CGRectGetWidth(self.bounds);
    CGFloat heightData = self.touchSize.height - CGRectGetHeight(self.bounds);
    CGRect bounds = CGRectInset(self.bounds, -0.5 * widthData, -0.5 *heightData);
    return CGRectContainsPoint(bounds, point);
}

//方法二，这个方法不能用来扩大点击范围
/*
 hitTest是用来寻找最合适的View
 当一个事件传递给一个控件，就会调用这个控件的hitTest方法
 点击了白色的View：触摸事件->UIApplication->[UIWindow hitTest]->白色View[whiteView hitTest]
 在下面点击白色view的时候，默认返回的是ViewController上的view
 */
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"%f",self.touchSize.width);
//    CGFloat widthData = self.touchSize.width - CGRectGetWidth(self.bounds);
//    CGFloat heightData = self.touchSize.height - CGRectGetHeight(self.bounds);
//    CGRect bounds = CGRectInset(self.bounds, -0.5 * widthData, -0.5 *heightData);
//    return CGRectContainsPoint(bounds, point) ? self :nil;
//}

@end
