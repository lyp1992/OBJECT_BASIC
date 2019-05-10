//
//  OCViewController.m
//  KVO
//
//  Created by 赖永鹏 on 2019/3/18.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "OCViewController.h"
#import <objc/runtime.h>


@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSObject *object = [[NSObject alloc]init];
    
    NSLog(@"%zu",class_getInstanceSize([object class]));
    
}


@end
