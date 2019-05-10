//
//  ViewController.m
//  定时器
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "ViewController.h"
#import "YPProxy.h"
#import "YPTimer.h"
@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) dispatch_source_t sourceT;
@property (nonatomic, strong) NSString *ypTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeTest) userInfo:nil repeats:YES];
    
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:[YPProxy proxyWithTarget:self] selector:@selector(timeTest) userInfo:nil repeats:YES];
    
//    [self createGCDTime];
    
//    self.ypTimer = [YPTimer execTask:^{
//        NSLog(@" handle source in here ");
//    } start:2.0 interval:1.0 repeats:YES async:NO];
    self.ypTimer = [YPTimer execTask:[YPProxy proxyWithTarget:self] selector:@selector(timeTest) start:2.0 interval:1.0 repeats:YES async:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.ypTimer) {
        [YPTimer cancelTimer:self.ypTimer];
    }
}

-(void)createGCDTime{
    
    dispatch_queue_t queue = dispatch_queue_create("timer", DISPATCH_QUEUE_SERIAL);
//    创建时间
    dispatch_source_t source =  dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
//    设置时间
    uint64_t start = 2.0; //两秒之后
    uint64_t interval = 1.0; //间隔一秒
    dispatch_source_set_timer(source, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
    
    // 设置回调
//    dispatch_source_set_event_handler(source, ^{
//        NSLog(@"handle source in here");
//    });
    dispatch_source_set_event_handler_f(source, timeFire);
 
//    启动定时器
    dispatch_resume(source);
    self.sourceT = source;
}

-(void)timeTest{
    
    NSLog(@"%s",__func__);
}

-(void)dealloc{
    NSLog(@"%s",__func__);
    [YPTimer cancelTimer:self.ypTimer];
}

void timeFire(void *parame){
    NSLog(@" handle source in here ");
}

@end
