//
//  FirstViewController.m
//  一个app嵌套多个tabbar
//
//  Created by laiyp on 2018/8/23.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondTabbarVC.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    
    [but setTitle:@"跳转到另一个tabbar" forState:UIControlStateNormal];
    
    [but addTarget:self action:@selector(senderClick:) forControlEvents:UIControlEventTouchUpInside];
    
    but.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:but];
    

}

-(void)senderClick:(UIButton *)sender{
    
    //隐藏现在的tabbar和navi
    
    [self.navigationController.navigationBar setHidden:YES];
    
    [self.tabBarController.tabBar setHidden:YES];
    
    SecondTabbarVC *secTab = [[SecondTabbarVC alloc]init];
    
    [self.navigationController pushViewController:secTab animated:YES];
    
}
@end
