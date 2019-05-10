//
//  ViewController.m
//  KVO
//
//  Created by 赖永鹏 on 2019/3/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    NSLog(@"---");
//    Person *p = [[Person alloc]init];
//    p.age = 19;
//    self.p = p;
//
//    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
////    self.p.age = 10;
//
////    在不触发set方法的情况下手动触发监听属性改变
//    [p willChangeValueForKey:@"age"];
//    [p didChangeValueForKey:@"age"];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"+++");
    Person *p = [[Person alloc]init];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"value is change %@ %@",keyPath,change);
    
}

@end
