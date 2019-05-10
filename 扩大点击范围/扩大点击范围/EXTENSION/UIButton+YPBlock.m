//
//  UIButton+YPBlock.m
//  扩大点击范围
//
//  Created by laiyp on 2018/7/31.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "UIButton+YPBlock.h"
#import <objc/runtime.h>

typedef void(^YP_ButtonEventBlock)(void);
@interface UIButton()

//事件回调
@property (nonatomic, copy) YP_ButtonEventBlock yp_buttonEventBlock;

@end

static void *yp_buttonEventKey = &yp_buttonEventKey;

@implementation UIButton (YPBlock)

-(void)setYp_buttonEventBlock:(YP_ButtonEventBlock)yp_buttonEventBlock{
    
    objc_setAssociatedObject(self, &yp_buttonEventKey, yp_buttonEventBlock, OBJC_ASSOCIATION_COPY);
}

-(YP_ButtonEventBlock)yp_buttonEventBlock{
    
    return objc_getAssociatedObject(self, &yp_buttonEventKey);
}

-(void)yp_addEventHandler:(void (^)(void))block forControlEvents:(UIControlEvents)controlEvents{
    self.yp_buttonEventBlock = block;
    [self addTarget:self action:@selector(yp_buttonEventClicked) forControlEvents:controlEvents];
}

-(void)yp_buttonEventClicked{
    
    !self.yp_buttonEventBlock ? : self.yp_buttonEventBlock();
    
}

@end
