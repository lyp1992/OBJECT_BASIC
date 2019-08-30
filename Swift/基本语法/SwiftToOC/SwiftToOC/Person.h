//
//  Person.h
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/26.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

-(void)eat:(NSString *)eatName howMuchToEat:(CGFloat)eatNumbers;
-(instancetype)initWithAge:(int)age withName:(NSString *)name;
-(void)run;

int sum(int a,int b);

@end

NS_ASSUME_NONNULL_END
