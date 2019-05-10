//
//  Person.m
//  KVO
//
//  Created by 赖永鹏 on 2019/3/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "Person.h"

@implementation Person

//- (void)setAge:(int)age{
//    _age = age;
//}
//- (int)age{
//    return _age;
//}

+(void)load{
    NSLog(@"person--load");
    
}
+(void)initialize{
    NSLog(@"person--initialize");
    
}

@end
