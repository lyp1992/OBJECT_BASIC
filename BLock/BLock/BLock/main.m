//
//  main.m
//  BLock
//
//  Created by laiyp on 2018/7/9.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
int num = 100;
void block1(){
    void (^block)(void) = ^{
        NSLog(@"block1 == %d",num);
    };
    num = 200;
    block();
}
void block2(){
    static int num = 100;
    void (^block)(void)=^{
        NSLog(@"block2==%d",num);
    };
    num = 200;
    block();
}
void block4(){
    __block int num = 100;
    void (^block)(void)=^{
        NSLog(@"block4=%d",num);
    };
    num = 200;
    block();
}

void block3(){
    int num = 100;
    void (^block)(void)=^{
        NSLog(@"block3=%d",num);
        
    };
    num = 200;
    block();
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
//        block1();
//
//        block2();
//        block3();
//        block4();
        
        //block 在内部回作为指向结构体的指针，当调用的时候就是根据block对应的指针找到相应的函数，进而进行调用，病传入自身。
        NSLog(@"1");
        void(^block)(void) = ^{
            NSLog(@"2");
        };
        block();
        NSLog(@"3");
    }

    return 0;
}


