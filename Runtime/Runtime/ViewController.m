//
//  ViewController.m
//  Runtime
//
//  Created by laiyp on 2018/7/5.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
@interface ViewController ()
@property (nonatomic, strong) Person *person;

@end

@implementation ViewController


/**
 load 是一个类初始化装载的时候调用
 initialize是应用在第一次调用该类的类方法和类的实现的时候调用
 */
+(void)load{
    static dispatch_once_t onceKey;
    dispatch_once(&onceKey, ^{
//       获取类对象
        Class class = [self class];
//        获取原生方法 键SEL
        SEL originSelector= @selector(viewWillAppear:);
//        获取交换方法 键SEL
        SEL swizzedSelector = @selector(LYP_ViewWillAppear:);
        
//        获取原生方法Method 值
        Method originMethod = class_getInstanceMethod(class, originSelector);
//        获取交换方法MEthod 值
        Method swizzedMethod = class_getInstanceMethod(class, swizzedSelector);
        
//        判断交换方法是否存在
        BOOL didAddMethod = class_addMethod(class, originSelector, method_getImplementation(swizzedMethod), method_getTypeEncoding(swizzedMethod));
        if (didAddMethod) {
         //        如果存在，替换
            class_replaceMethod(class, swizzedSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else{
            //        不存在，交换
            method_exchangeImplementations(originMethod, swizzedMethod);
        }
    });
    
}
-(void)LYP_ViewWillAppear:(BOOL)animated{
    [self LYP_ViewWillAppear:animated];
    NSLog(@"LYP_ViewWillAppear:%@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(addMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.person = [[Person alloc]init];
}

-(void)addMethod:(UIButton *)sender{
    [self addMethodForPerson];
    if ([self.person respondsToSelector:@selector(speakName)]) {
        [self.person performSelector:@selector(speakName)];
    }else{
        NSLog(@"没有添加成功");
    }
}

-(void)addMethodForPerson{
    /**
     给类添加方法
     @param cls#> 被添加的类
     @param name#> 添加的方法的名字
     @param imp#> 方法的实现，指针指向方法实现地址的首地址,必须要传两个参数， self _cmd
     @param types#> 类型
     @return value
     */
    class_addMethod([self.person class], @selector(speakName), (IMP)speakName, "v@:*");
}

void speakName(id self,SEL _cmd){
    NSLog(@"添加方法成功");
}

@end
