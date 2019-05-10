//
//  ViewController.m
//  颜色选择器
//
//  Created by laiyp on 2018/8/13.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "MSColorSelectionView.h"
#import "MSColorPicker.h"
#import "WSColorImageView.h"
#import "DrawColorView.h"
#import "SliderView.h"
#import "SliderColorPanel.h"
#import "BarColorPanel.h"

@interface ViewController ()<MSColorViewDelegate>
@property (nonatomic, strong)MSColorSelectionView *colorSelectionView;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) DrawColorView *colorView;
@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, strong) CAShapeLayer *pathLayer;
@property (nonatomic, strong) UIView *colorGradientView;
@property (nonatomic, strong) SliderView *sliderView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MSColorSelectionView *colorSelectionView = [[MSColorSelectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.colorSelectionView = colorSelectionView;
    [self.colorSelectionView setSelectedIndex:1 animated:NO];
    self.colorSelectionView.delegate = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    [self.view addSubview:self.colorSelectionView];
    
//    设置画笔粗细
//    设置画笔的颜色
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, self.view.frame.size.width-40, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"当前文字的颜色";
    [self.view addSubview:label];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-75, 100, 150, 150)];
    [self.view addSubview:view];
    
    //    设置颜色渐变
    self.sliderView = [[SliderView alloc]init];
    self.sliderView.frame = CGRectMake(10, 550, 300, 40);
    [self.view addSubview:self.sliderView];
    __weak typeof(self) weakSelf = self;
    [self.sliderView setProportionColor:^(UIColor *color) {
        weakSelf.currentColor = color;
        [weakSelf drawColorLine];
    }];
    
    WSColorImageView *ws = [[WSColorImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-100, 300, 200, 200)];
    [self.view addSubview:ws];
    ws.currentColorBlock = ^(UIColor *color){
        weakSelf.currentColor = color;
        [weakSelf drawColorLine];
        weakSelf.sliderView.currentColor = color;
    };
    
//    [self drawDottedLine];
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 520, 320, 10)];
    
    slider.minimumValue = 1;//设置可变最小值
    slider.maximumValue = 20;//设置可变最大值
    slider.value = 1;
    self.slider = slider;
    [self.slider addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    

    
    DrawColorView *colorView = [[DrawColorView alloc]init];
    colorView.frame = CGRectMake(45, 400, 200, 44);
    [self.view addSubview:colorView];
    self.colorView = colorView;
    self.colorView.backgroundColor = [UIColor whiteColor];
}

-(void)setColorViewWithProportion:(CGFloat)value{
    const CGFloat *components = CGColorGetComponents(self.currentColor.CGColor);
    
    CGFloat R = components[0] * 255;
    CGFloat G = components[1] * 255;
    CGFloat B = components[2] * 255;
    NSLog(@"%f == %f = %f == %f",R,G,B,value);
    CGFloat RValue = value * 255;

    NSLog(@"R%f",RValue);
    self.currentColor = [UIColor colorWithRed:(R+RValue)/255.0 green:(G+RValue)/255.0 blue:(B+RValue)/255.0 alpha:1];
     [self drawColorLine];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.colorSelectionView setNeedsUpdateConstraints];
    [self.colorSelectionView updateConstraintsIfNeeded];
}

-(void)changeValue{
//    self.colorView.slideValue = self.slider.value;
//    [self.colorView setNeedsDisplay];
    [self drawColorLine];
}

#pragma mark - MSColorViewDelegate

- (void)colorView:(id<MSColorView>)colorView didChangeColor:(UIColor *)color
{
    self.view.backgroundColor = color;
}
//虚线
-(void)drawDottedLine{
    CAShapeLayer *dotteShapeLayer = [CAShapeLayer layer];
    CGMutablePathRef dotteShapePath =  CGPathCreateMutable();
    //设置虚线颜色为blackColor
    [dotteShapeLayer setStrokeColor:[[UIColor orangeColor] CGColor]];
    //设置虚线宽度
    dotteShapeLayer.lineWidth = 2.0f ;
    //10=线的宽度 5=每条线的间距
    NSArray *dotteShapeArr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5], nil];
    [dotteShapeLayer setLineDashPattern:dotteShapeArr];
    CGPathMoveToPoint(dotteShapePath, NULL, 0 ,50);
    CGPathAddLineToPoint(dotteShapePath, NULL, 100, 200);
    [dotteShapeLayer setPath:dotteShapePath];
    CGPathRelease(dotteShapePath);
    //把绘制好的虚线添加上来
    [self.view.layer addSublayer:dotteShapeLayer];
}
-(void)drawColorLine{

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0,20.0)];
    [path addLineToPoint:CGPointMake(self.colorView.frame.size.width, 20.0)];
    
    if (self.pathLayer) {
        [self.pathLayer removeFromSuperlayer];
    }
    self.pathLayer = [CAShapeLayer layer];
   self. pathLayer.frame = self.colorView.bounds;
    self.pathLayer.path = path.CGPath;
    self.pathLayer.strokeColor = [self.currentColor CGColor];
   self. pathLayer.fillColor = nil;
    self.pathLayer.lineWidth = self.slider.value;
    self.pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.colorView.layer addSublayer:self.pathLayer];
}

@end
