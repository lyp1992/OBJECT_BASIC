//
//  ViewController.m
//  扩大点击范围
//
//  Created by laiyp on 2018/7/24.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ExpandScope.h"
#import "UIButton+YPBlock.h"
#import "FirstVC.h"
#import "UIView+Extension.h"

@interface ViewController ()
@property (nonatomic, strong) FirstVC *vc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 50, 100, 100)];
    [view lyp_addRounderCornerWithRadius:10.0 size:CGSizeMake(view.width, view.height)];
    view.backgroundColor = [UIColor grayColor];
    view.touchSize = CGSizeMake(200, 200);
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [view addGestureRecognizer:tap];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 350, 200, 100);
    button.backgroundColor = [UIColor greenColor];
    __weak typeof(self) weakself = self;
    __weak __typeof__(button) weakButton = button;
    [button yp_addEventHandler:^{
        weakButton.selected = !weakButton.selected;
        if (weakButton.selected) {
            [weakButton setTitle:@"黄色" forState:UIControlStateNormal];
            weakself.view.backgroundColor = [UIColor yellowColor];
        }else{
            [weakButton setTitle:@"绿色" forState:UIControlStateNormal];
            weakself.view.backgroundColor = [UIColor whiteColor];
        }
    } forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    
    FirstVC *vc = [[FirstVC alloc]init];
    vc.view.frame = CGRectMake(100, 200, 300, 300);
    vc.view.backgroundColor = [UIColor yellowColor];
    self.vc = vc;
    [self.view addSubview:vc.view];
}

-(void)tap{
    
    NSLog(@"%@",self.vc.addButton.allTargets);
    
//   self performSelector: withObject:<#(nullable id)#> afterDelay:<#(NSTimeInterval)#>
    
}

@end
