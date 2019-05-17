//
//  IndexTableView.m
//  cell的重用机制
//
//  Created by 赖永鹏 on 2019/5/14.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import "IndexTableView.h"
#import "ViewReusePool.h"
@implementation IndexTableView
{
    ViewReusePool *viewReusePool;
    UIView *containView;
}

-(void)reloadData{
    [super reloadData];
    
    if (containView == nil) {
        containView = [[UIView alloc]initWithFrame:CGRectZero];
        containView.backgroundColor =[UIColor whiteColor];
        
//        避免索引跟着tableView移动
        [self.superview insertSubview:containView aboveSubview:self];
    }
    
    if (viewReusePool == nil) {
        viewReusePool = [[ViewReusePool alloc]init];
    }
    [viewReusePool reset];
    [self realoadTitles];
    
}

//刷新indexTitles
-(void)realoadTitles{
    NSArray *titles = [NSArray array];
    if ([self.titleDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        titles = [self.titleDataSource indexTitlesForIndexTableView:self];
    }
    
//    判断索引是否为空
    if (titles.count <= 0) {
        [containView setHidden:YES];
        return ;
    }
    NSInteger count = titles.count;
    CGFloat buttonWeight = 60;
    CGFloat buttonHeight = self.frame.size.width / count;
    for (int i = 0; i < count; i++) {
        NSString *title = [titles objectAtIndex:i];
        
//        从重用z池中取
        UIButton *button = (UIButton *)[viewReusePool dequeueResueableView];
        if (button == nil) {
            button = [[UIButton alloc]initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
//            往重用池中添加
            [viewReusePool addResumView:button];
            NSLog(@"新创建");
        }else{
            NSLog(@"重用了");
        }
        
        [containView addSubview:button];
//        设置基本属性
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        设置坐标
        button.frame = CGRectMake(0, i*buttonHeight, buttonWeight, buttonHeight);
    }
    
//    设置containView的属性
    [containView setHidden:NO];
    containView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWeight, self.frame.origin.y, buttonWeight, self.frame.size.height);
    
}

@end
