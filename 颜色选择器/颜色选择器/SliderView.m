//
//  SliderView.m
//  颜色选择器
//
//  Created by laiyp on 2018/8/20.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "SliderView.h"
#import "UIView+ColorOfPoint.h"
@interface SliderView()
//滑块
@property (nonatomic, strong) UIView *slideV;


@end

@implementation SliderView

-(void)setCurrentColor:(UIColor *)currentColor{
    _currentColor = currentColor;
    [self setColorGradient];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.slideV = [[UIView alloc]init];
        self.slideV.backgroundColor = [UIColor whiteColor];
        self.slideV.layer.masksToBounds = YES;
        self.slideV.layer.cornerRadius = 5;
        self.slideV.layer.borderWidth = 1;
        self.slideV.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self addSubview:self.slideV];
  
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
        [self addGestureRecognizer:panGes];

        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];

    self.slideV.frame = CGRectMake(0, 0, 10, self.frame.size.height);
    [self bringSubviewToFront:self.slideV];
    
}

-(void)panGes:(UIPanGestureRecognizer*)rec{
    
    CGPoint point = [rec translationInView:self];
    //该方法返回在横坐标上、纵坐标上拖动了多少像素
    CGFloat viewX = self.slideV.frame.origin.x + point.x;
    CGFloat viewY = 0;
    CGFloat viewWidth = self.slideV.frame.size.width;
    CGFloat viewHeight = self.slideV.frame.size.height;
    if (viewX-viewWidth/2 < 0) {
        viewX = 0;
    }else if (viewX+viewWidth/2 > self.frame.size.width){
        viewX = self.frame.size.width-viewWidth;
    }
    
    self.slideV.frame = CGRectMake(viewX, viewY, viewWidth, viewHeight);
    //rec.view 指的是把rec添加到那个控件上的
    // 因为拖动起来一直是在递增，所以每次都要用setTranslation:方法制0这样才不至于不受控制般滑动出视图
    [rec setTranslation:CGPointMake(0, 0) inView:self];
//    返回
    CGPoint colorPanelPoint = CGPointMake(self.slideV.center.x, self.slideV.center.y);
    if (colorPanelPoint.x < viewWidth && colorPanelPoint.x == viewWidth/2) {
        colorPanelPoint.x = colorPanelPoint.x + viewWidth/2 + 1;
    }else if (colorPanelPoint.x > self.frame.size.width - viewWidth/2) {
        colorPanelPoint.x = self.frame.size.width - viewWidth -1;
    }else{
        colorPanelPoint.x = colorPanelPoint.x - viewWidth/2 -1;
    }
    
   UIColor *color =  [self colorOfPoint:colorPanelPoint];
//    self.currentColor = color;
    self.proportionColor(color);
 
}

-(void)setColorGradient{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    if (self.currentColor == [UIColor blackColor]) {
         gradientLayer.colors = @[(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[UIColor blackColor].CGColor];//这里颜色渐变
    }else{
        
        gradientLayer.colors = @[(__bridge id)self.currentColor.CGColor,(__bridge id)[UIColor blackColor].CGColor];//这里颜色渐变
    }
    
    gradientLayer.locations = @[@0.35, @1.0];//颜色位置
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;//渐变区域的大小，一般同view
    [self.layer addSublayer:gradientLayer];
}

@end
