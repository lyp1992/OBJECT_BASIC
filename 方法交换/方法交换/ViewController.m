//
//  ViewController.m
//  方法交换
//
//  Created by 赖永鹏 on 2019/4/23.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clickOne:(id)sender {
    NSLog(@"one");
}
- (IBAction)clickTwo:(UIButton *)sender {
    NSLog(@"two");
}
- (IBAction)clickThree:(id)sender {
    NSLog(@"three");
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSMutableArray *muarr = [[NSMutableArray alloc]init];
    [muarr addObject:@"jack"];
    [muarr insertObject:@"devi" atIndex:0];
    NSLog(@"%@",[muarr class]);
    
//    NSMutableDictionary *dictM = [[NSMutableDictionary alloc]init];
//    dictM[nil] = @"jack";
//    [dictM setValue:@"devi" forKey:@"name"];
    
//    NSLog(@"%@",[dictM class]);
    
    NSDictionary *dict = @{@"name":[[NSObject alloc]init],@"age":@"kacj"};
    NSString *value = dict[nil];
    
     NSLog(@"%@",[dict class]);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
