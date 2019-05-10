//
//  ViewController.m
//  生成PDF
//
//  Created by laiyp on 2018/8/2.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "CreatePdfView.h"
#import <CommonCrypto/CommonCrypto.h>
#import "ScratchPdfTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [[ScratchPdfTool shareInstance]createPDF:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
//    CreatePdfView *pdfView = [[CreatePdfView alloc]init];
//    pdfView.frame = self.view.bounds;
//    [self.view addSubview:pdfView];
    NSLog(@"%@",NSHomeDirectory());

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
