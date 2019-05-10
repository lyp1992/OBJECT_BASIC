//
//  ViewController.m
//  uibutton
//
//  Created by laiyp on 2018/10/16.
//  Copyright © 2018 laiyongpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"你好，我是x大兴按铃，开门。哦哦hahhahhahahha哦哦哦哦好的。不好解决你";
    CGSize size = CGSizeMake(50, MAXFLOAT);
    CGRect rect = [label.text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} context:nil];
    label.frame = CGRectMake(100, 100, rect.size.width, rect.size.height);
    label.numberOfLines = 0;
    [label sizeToFit];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = label.frame;
    //    button.backgroundColor = [UIColor redColor];
    //    [button setTitle:@"hello, wolrd" forState: UIControlStateNormal];
    //       [button setTitleEdgeInsets:UIEdgeInsetsMake(-5, 0, 0, 0)];
    //    [button sizeToFit];
    
    [self.view addSubview:button];
    

}


@end
