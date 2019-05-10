//
//  FirstTabbarVC.m
//  一个app嵌套多个tabbar
//
//  Created by laiyp on 2018/8/23.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "FirstTabbarVC.h"
//#import "FiveViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "MainNavigationController.h"

@interface FirstTabbarVC ()

@end

@implementation FirstTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self addChildVC:[[FirstViewController alloc] init] withTitle:@"第一个"];
    
    [self addChildVC:[[SecondViewController alloc] init] withTitle:@"第二个"];
    
    [self addChildVC:[[ThreeViewController alloc] init] withTitle:@"第三个"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:NO];
}

-(void)addChildVC:(UIViewController *)VC withTitle:(NSString *)title{
    
    VC.title = title;
    
    MainNavigationController *mainVC = [[MainNavigationController alloc]initWithRootViewController:VC];
    
    [self addChildViewController:mainVC];
    
}



@end
