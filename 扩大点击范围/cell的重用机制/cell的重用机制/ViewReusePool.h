//
//  ViewReusePool.h
//  cell的重用机制
//
//  Created by 赖永鹏 on 2019/5/14.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ViewReusePool : NSObject

//从重用池中取出一个复用
-(UIView *)dequeueResueableView;

//往重用池中添加一个VIew
-(void)addResumView:(UIView*)view;

//重置
-(void)reset;

@end

NS_ASSUME_NONNULL_END
