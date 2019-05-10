//
//  ViewController.m
//  RunLoop
//
//  Created by laiyp on 2018/7/26.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "MYThread.h"

@interface ViewController ()

@property (nonatomic, assign) int number;

@property (nonatomic, strong) MYThread *myThread;
@property (nonatomic, assign) BOOL isStop;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.number = 0;
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(test) userInfo:nil repeats:YES];
//    static int count = 0;
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%d",count++);
//    }];
        // NSDefaultRunLoopMode、UITrackingRunLoopMode才是真正存在的模式
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:UITrackingRunLoopMode];
    
    // NSRunLoopCommonModes并不是一个真的模式，它只是一个标记
    // timer能在_commonModes数组中存放的模式下工作
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    
    
//    线程保活
//    self.myThread = [[MYThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    __weak typeof(self) weakself = self;
    self.isStop = NO;
    self.myThread = [[MYThread alloc]initWithBlock:^{
        NSLog(@"---begin---");
        NSLog(@"--%@",[NSThread currentThread]);
        [[NSRunLoop currentRunLoop]addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
//[[NSRunLoop currentRunLoop]run] 这句话相当于while（1）一直唤醒runloop，
//        [[NSRunLoop currentRunLoop]run];
        while (!weakself.isStop) {
           
            [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
             NSLog(@"--%@",[NSThread currentThread]);
        };
        
        
        NSLog(@"---end---");
    }];
    [self.myThread start];
}

- (IBAction)stop:(UIButton *)sender {
//    停止线程
    if (self.myThread != nil) {
    [self performSelector:@selector(stopThread) onThread:self.myThread withObject:nil waitUntilDone:NO];
    }
    
}
-(void)stopThread{
    self.isStop = YES;
    NSLog(@"--stopThread--");
//    NSLog(@"&& %@ &&",CFRunLoopGetCurrent());
    CFRunLoopStop(CFRunLoopGetCurrent());
//    NSLog(@"** %@ **",CFRunLoopGetCurrent());
//    NSLog(@"%@",[NSThread currentThread]);
//    NSLog(@"****%@",self.myThread);
    self.myThread = nil;
//     NSLog(@"++ %@ ++",CFRunLoopGetCurrent());
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.myThread != nil) {
        [self performSelector:@selector(test) onThread:self.myThread withObject:nil waitUntilDone:NO];
          NSLog(@"+++end+++");
    }

}

-(void)run{
    
    NSLog(@"---begin---");
    
    NSLog(@"--%@",[NSThread currentThread]);
    [[NSRunLoop currentRunLoop]addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]run];
    
    NSLog(@"---end---");
}

-(void)test{

    NSLog(@"-begin-");
    NSLog(@"--%@",[NSThread currentThread]);
    NSLog(@"-end-");
    
}

-(void)dealloc{
    NSLog(@"%s",__func__);
      NSLog(@"--%@",[NSThread currentThread]);
      NSLog(@"** %@ **",CFRunLoopGetCurrent());
//    [self stopThread];
}

@end
