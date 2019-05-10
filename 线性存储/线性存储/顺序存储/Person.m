//
//  Person.m
//  线性存储
//
//  Created by 赖永鹏 on 2019/1/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)run{
    
    NSLog(@"%@起飞了....", self.name);
}

+ (instancetype)personWithName:(NSString *)name{
    Person *person = [[self alloc] init];
    person.name = name;
    return person;
    
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@", self.name];
}

@end
