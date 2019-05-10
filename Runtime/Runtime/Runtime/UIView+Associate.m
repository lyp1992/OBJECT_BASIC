//
//  UIView+Associate.m
//  Runtime
//
//  Created by laiyp on 2018/7/5.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "UIView+Associate.h"

@implementation UIView (Associate)

static char KAssociateObjectKey;

-(void)setAssociatedObject:(id)associatedObject{
//    id _Nonnull object, 指定的对象
//    const void * _Nonnull key,全局的key
//    id _Nullable value,值
//    objc_AssociationPolicy policy 存储策略
    objc_setAssociatedObject(self, &KAssociateObjectKey, associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)associatedObject{
    return objc_getAssociatedObject(self, &KAssociateObjectKey);
}

@end
