//
//  YPTimer.m
//  定时器
//
//  Created by 赖永鹏 on 2019/4/23.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "YPTimer.h"

@implementation YPTimer

static NSMutableDictionary *timers_;
static dispatch_semaphore_t semaphore;
+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [[NSMutableDictionary alloc]init];
        semaphore = dispatch_semaphore_create(1);
    });
}

+(NSString *)execTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeat async:(BOOL)async{
    if (!task || start == 0 || (interval <= 0 && repeat)) {
        return nil;
    }
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
//    创建时间
    dispatch_source_t source =  dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    设置时间
    dispatch_source_set_timer(source, dispatch_time(DISPATCH_TIME_NOW, start *NSEC_PER_SEC), interval *NSEC_PER_SEC, 0);
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//    定义唯一标识
    NSString *name = [NSString stringWithFormat:@"%zd",timers_.count];
    timers_[name] = source;
    dispatch_semaphore_signal(semaphore);
    
//    设置事件
    dispatch_source_set_event_handler(source, ^{
        task();
        if (!repeat) {
            [self cancelTimer:name];
        }
    });
    
//    启动时间
    dispatch_resume(source);
    
    return name;
}

+(NSString *)execTask:(id)target selector:(SEL)selector start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeat async:(BOOL)async{
    if (!target || start == 0 || (interval <= 0 && repeat) || !selector) {
        return nil;
    }
    return [self execTask:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if ([target respondsToSelector:selector]) {
            [target performSelector:selector];
        }
#pragma clang diagnostic pop
        
    } start:start interval:interval repeats:repeat async:async];
}

+(void)cancelTimer:(NSString *)timer{
    if (timer.length == 0) {
        return;
    }
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//    取出字典中的source
    dispatch_source_t source = timers_[timer];
    if (source) {
        dispatch_source_cancel(source);
        [timers_ removeObjectForKey:timer];
    }
    dispatch_semaphore_signal(semaphore);
    
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}

@end
