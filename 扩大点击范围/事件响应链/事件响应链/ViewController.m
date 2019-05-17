//
//  ViewController.m
//  事件响应链
//
//  Created by 赖永鹏 on 2019/5/14.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomButton *btn = [[CustomButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    btn.userInteractionEnabled = YES;
    [self.view addSubview:btn];
    
}

-(void)action:(UIButton *)sender{
    NSLog(@"Actiov");
}


@end
