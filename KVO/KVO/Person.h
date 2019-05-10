//
//  Person.h
//  KVO
//
//  Created by 赖永鹏 on 2019/3/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;

@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
