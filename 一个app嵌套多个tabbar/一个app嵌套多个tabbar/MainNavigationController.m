//
//  MainNavigationController.m
//  百思不得姐
//
//  Created by 赖永鹏 on 16/3/19.
//  Copyright © 2016年 赖永鹏. All rights reserved.
//

#import "MainNavigationController.h"
//#import "NSObject+YYThemeExtension.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

+(void)initialize{

//////    所有的都要用到，所以用appearance
//    UINavigationBar *bar = [UINavigationBar appearance];
//    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//
//    //设置主题颜色
////    [bar yy_addToThemeColorPool:@"barTintColor"];
//
//
//
////    设置item
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//
////    uicontrolNomal
//    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
//    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
//    itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
//    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
//
////   uicontrolDisable
//    NSMutableDictionary *itemDisableAttrs = [NSMutableDictionary dictionary];
//    itemDisableAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    [item setTitleTextAttributes:itemDisableAttrs forState:UIControlStateDisabled];
    
}

//只能在这里改变主题颜色
//-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
//
//    if (self = [super initWithRootViewController:rootViewController]) {
//        
//        //    所有的都要用到，所以用appearance
//        UINavigationBar *bar = [[UINavigationBar alloc]init];
////        [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//        
//        //设置主题颜色
//        [bar yy_addToThemeColorPool:@"barTintColor"];
//        
//         [self setValue:bar forKey:@"navigationBar"];
//        
////        //    设置item
//        UIBarButtonItem *item = [UIBarButtonItem appearance];
//        
//        //    uicontrolNomal
//        NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
//        itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
//        itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
//        [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
//        
//        //   uicontrolDisable
//        NSMutableDictionary *itemDisableAttrs = [NSMutableDictionary dictionary];
//        itemDisableAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//        [item setTitleTextAttributes:itemDisableAttrs forState:UIControlStateDisabled];
//    }
//
//    return self;
//}

//这个方法写了的话，里面必须要有代码，如果没有代码的话，初始的界面都没有

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.childViewControllers.count > 0) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        button.size = CGSizeMake(70, 30);
        button.frame = CGRectMake(0, 0, 70, 30);
        
//        让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        让按钮的内容往左边偏移10
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(0, 0, 70, 30);
        [view addSubview:button];
//        修改导航栏的左边item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
      
//        隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    
    [super pushViewController:viewController animated:animated];

}

-(void)back{

    [self popViewControllerAnimated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    如果滑动移除控制器功能失效，清空代理（让导航控制器重新设置这个功能）
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

@end
