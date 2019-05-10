//
//  UIView+YPBlock.m
//  扩大点击范围
//
//  Created by laiyp on 2018/7/31.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "UIView+YPBlock.h"
#import <objc/runtime.h>

typedef void(^YPTappedBlock)(void);
@interface UIView()
@property (nonatomic, copy) YPTappedBlock ypTappedBlock;
@end

static void *ypTappedKey = &ypTappedKey;
@implementation UIView (YPBlock)
-(void)setYpTappedBlock:(YPTappedBlock)ypTappedBlock{
    objc_setAssociatedObject(self, &ypTappedKey, ypTappedBlock, OBJC_ASSOCIATION_COPY);
}
-(YPTappedBlock)ypTappedBlock{
    return objc_getAssociatedObject(self, &ypTappedKey);
}
-(void)yp_AddTapped:(void (^)(void))tappedBlock{
    self.ypTappedBlock = tappedBlock;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked)];
    [self addGestureRecognizer:tapGes];
}
-(void)tapClicked{
    !self.ypTappedBlock ? : self.ypTappedBlock();
}

@end
