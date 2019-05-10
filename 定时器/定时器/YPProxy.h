//
//  YPProxy.h
//  定时器
//
//  Created by 赖永鹏 on 2019/4/11.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPProxy : NSProxy

+(instancetype)proxyWithTarget:(id)target;

@property (nonatomic, weak)id target;

@end

NS_ASSUME_NONNULL_END
