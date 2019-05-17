//
//  IndexTableView.h
//  cell的重用机制
//
//  Created by 赖永鹏 on 2019/5/14.
//  Copyright © 2019年 LYP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexTableViewDataSource<NSObject>

-(NSArray<NSString *> *)indexTitlesForIndexTableView:(UITableView *)indexTableView;

@end

@interface IndexTableView : UITableView

@property (nonatomic, weak) id<IndexTableViewDataSource>titleDataSource;

@end

NS_ASSUME_NONNULL_END
