//
//  UIView+Associate.h
//  Runtime
//
//  Created by laiyp on 2018/7/5.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIView (Associate)
@property (nonatomic, strong) id associatedObject;

@end
