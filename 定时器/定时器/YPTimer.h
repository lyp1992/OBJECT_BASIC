//
//  YPTimer.h
//  定时器
//
//  Created by 赖永鹏 on 2019/4/23.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPTimer : NSObject

+(NSString *)execTask:(void(^)(void))task
                start:(NSTimeInterval)start
             interval:(NSTimeInterval)interval
              repeats:(BOOL)repeat
                async:(BOOL)async;
+(NSString *)execTask:(id)target
             selector:(SEL)selector
                start:(NSTimeInterval)start
             interval:(NSTimeInterval)interval
              repeats:(BOOL)repeat
                async:(BOOL)async;

+(void)cancelTimer:(NSString *)timer;

@end

NS_ASSUME_NONNULL_END
