//
//  ViewController.m
//  UIKitDynamic
//
//  Created by laiyp on 2018/9/25.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong)  UICollisionBehavior *colBeh;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.squareView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.squareView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.squareView];
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"squareView";
    label.textColor = [UIColor whiteColor];
    [self.squareView addSubview:label];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.squareView]];
//    [self.animator addBehavior:gravity];

    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.squareView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionDelegate = self;
    [self.animator addBehavior:collision];
    
//    附着行为
//    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.squareView attachedToAnchor:self.squareView.center];
//    attachment.length = 50;
//    attachment.damping = 0.5;
//    attachment.frequency =1;
//    [self.animator addBehavior:attachment];
    
// 物体属性
    UIDynamicItemBehavior *dynamicBeh = [[UIDynamicItemBehavior alloc]initWithItems:@[self.squareView]];
    dynamicBeh.elasticity = 0.5;
    dynamicBeh.resistance = 0.5;
    dynamicBeh.allowsRotation = YES;
    [dynamicBeh addAngularVelocity:0.5 forItem:self.squareView];
    [self.animator addBehavior:dynamicBeh];
//
    UITapGestureRecognizer *viewTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewHandler:)];
    [self.view addGestureRecognizer:viewTapGesture];
    
}

-(void)tapViewHandler:(UIGestureRecognizer*)ges{
    UIPushBehavior *pushBeh = [[UIPushBehavior alloc]initWithItems:@[self.squareView] mode:UIPushBehaviorModeContinuous];
    CGPoint location = [ges locationInView:self.view];
    CGPoint itemCenter = self.squareView.center;
    
    pushBeh.pushDirection = CGVectorMake((location.x - itemCenter.x)/100, (location.y - itemCenter.y)/100);
    [self.animator addBehavior:pushBeh];
}

#pragma mark - UICollisionBehaviorDelegate

- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier atPoint:(CGPoint)p
{
    // 结束碰撞为 squareView 设置一个随机背景
    self.squareView.backgroundColor = [UIColor colorWithRed:(float)rand() / RAND_MAX
                                                      green:(float)rand() / RAND_MAX
                                                       blue:(float)rand() / RAND_MAX
                                                      alpha:1];
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(id <NSCopying>)identifier
{
    // 结束碰撞为 squareView 设置一个随机背景
    self.squareView.backgroundColor = [UIColor colorWithRed:(float)rand() / RAND_MAX
                                                      green:(float)rand() / RAND_MAX
                                                       blue:(float)rand() / RAND_MAX
                                                      alpha:1];
}

@end
