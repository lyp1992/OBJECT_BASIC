//
//  Person.h
//  线性存储
//
//  Created by 赖永鹏 on 2019/1/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)run;

+ (instancetype)personWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
