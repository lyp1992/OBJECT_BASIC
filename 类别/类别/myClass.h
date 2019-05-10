//
//  myClass.h
//  catorgray
//
//  Created by laiyp on 2018/7/6.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myClass : NSObject

-(void)printName;

@end

@interface myClass(MyAddition)

@property (nonatomic, copy) NSString *name;

-(void)printName;
@end

