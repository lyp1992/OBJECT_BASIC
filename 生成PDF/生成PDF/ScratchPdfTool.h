//
//  ScratchPdfTool.h
//  FMEFB
//
//  Created by laiyp on 2018/8/2.
//  Copyright © 2018年 BeiJing Finemap SCI-Tech Co.,ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ScratchPdfTool : NSObject

+(instancetype)shareInstance;

-(void)createPDF:(CGSize)size;
////创建pdf路径
//-(NSString *)createPDfPath;
//
////创建pdf名称
//-(NSString *)createPdfName;

//存储了pdf的路径,pdf的名字
@property(nonatomic, strong) NSDictionary *pdfDic;

@property (nonatomic, copy) NSString *pdfName;
@property (nonatomic, copy) NSString *pdfPath;

@end
