//
//  UIView+Extension.m
//
//  Created by 赖永鹏 on 15/9/23.
//  Copyright © 2015年 赖永鹏. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(void)setX:(CGFloat)x{

    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;

}
-(CGFloat)x{
    
    return self.frame.origin.x;//返回的是计算完了的值

}
-(void)setY:(CGFloat)y{
    
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
    
}
-(CGFloat)y{
    
    return self.frame.origin.y;//返回的是计算完了的值
    
}
-(void)setWidth:(CGFloat)width{
    
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;
    
}
-(CGFloat)width{
    
    return self.frame.size.width;//返回的是计算完了的值
    
}
-(void)setHeight:(CGFloat)height{
    
    CGRect frame=self.frame;
    frame.size.height=height;
    self.frame=frame;
    
}
-(CGFloat)height{
    
    return self.frame.size.height;//返回的是计算完了的值
    
}
- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
-(void)setCenterX:(CGFloat)centerX{
    
    CGPoint center=self.center;
    center.x=centerX;
    self.center=center;

}
-(CGFloat)centerX{

    return self.center.x;
    
}
-(void)setCenterY:(CGFloat)centerY{

    CGPoint center=self.center;
    center.y=centerY;
    self.center=center;

}
-(CGFloat)centerY{

    return self.center.y;
}

-(UIViewController *)viewController{
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
- (void)lyp_addRounderCornerWithRadius:(CGFloat)radius size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(cxt, [UIColor clearColor].CGColor);
    CGContextSetStrokeColorWithColor(cxt, [UIColor redColor].CGColor);
    
    CGContextMoveToPoint(cxt, size.width, size.height-radius);
    CGContextAddArcToPoint(cxt, size.width, size.height, size.width-radius, size.height, radius);//右下角
    CGContextAddArcToPoint(cxt, 0, size.height, 0, size.height-radius, radius);//左下角
    CGContextAddArcToPoint(cxt, 0, 0, radius, 0, radius);//左上角
    CGContextAddArcToPoint(cxt, size.width, 0, size.width, radius, radius);//右上角
    CGContextClosePath(cxt);
    CGContextDrawPath(cxt, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [imageView setImage:image];
    [self insertSubview:imageView atIndex:0];
}

@end
