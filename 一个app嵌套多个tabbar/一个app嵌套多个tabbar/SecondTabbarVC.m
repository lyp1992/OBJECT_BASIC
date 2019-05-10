//
//  SecondTabbarVC.m
//  一个app嵌套多个tabbar
//
//  Created by laiyp on 2018/8/23.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "SecondTabbarVC.h"
#import "FourViewController.h"
#import "MainNavigationController.h"
#import "FiveViewController.h"
@interface SecondTabbarVC ()

@end

@implementation SecondTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self addChildVC:[[FourViewController alloc] init] withTitle:@"第四个"];
    
    [self addChildVC:[[FiveViewController alloc] init] withTitle:@"第五个"];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}
//-(void)back{
//    [self popoverPresentationController];
//}
-(void)addChildVC:(UIViewController *)VC withTitle:(NSString *)title{
    
    VC.title = title;
    
    MainNavigationController *mainVC = [[MainNavigationController alloc]initWithRootViewController:VC];
    
    [self addChildViewController:mainVC];
}



@end
