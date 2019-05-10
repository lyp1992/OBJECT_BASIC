//
//  FirstVC.m
//  扩大点击范围
//
//  Created by laiyp on 2018/8/3.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addButton = [[UIButton alloc]init];
    self.addButton.frame = CGRectMake(100, 100, 100, 100);
    self.addButton.backgroundColor = [UIColor redColor];
    [self.addButton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)add:(UIButton *)sender{
    [self.addButton setTitle:@"niha0" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
