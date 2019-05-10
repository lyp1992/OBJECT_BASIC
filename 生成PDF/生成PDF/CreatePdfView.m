//
//  CreatePdfView.m
//  生成PDF
//
//  Created by laiyp on 2018/8/2.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "CreatePdfView.h"
#import <CoreText/CoreText.h>
@implementation CreatePdfView
-(void)drawRect:(CGRect)rect{
    
    NSString* fileName = @"Invoice.PDF";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
//    NSString* textToDraw = @"Hello World";
//    CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
//
//    // 使用 Core Text Framesetter.
//    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
//
//    CGRect frameRect = CGRectMake(0, 0, 300, 50);
//    CGMutablePathRef framePath = CGPathCreateMutable();
//    CGPathAddRect(framePath, NULL, frameRect);
//
//    // 获取将要被渲染的帧
//    CFRange currentRange = CFRangeMake(0, 0);
//    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
//    CGPathRelease(framePath);
    
    // 创建一个PDF的上下文，页面大小默认为 612 x 792
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
    // 标记新页面的开头
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    // 获取上下文.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // 把文字变成矩阵已知状态。这将确保没有旧缩放因子被留在原处。
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    //文本坐标翻转
    CGContextTranslateCTM(currentContext, 0, 100);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    // 绘制帧
//    CTFrameDraw(frameRef, currentContext);
//
//    CFRelease(frameRef);
//    CFRelease(stringRef);
//    CFRelease(framesetter);
//
    //关闭PDF上下文
    UIGraphicsEndPDFContext();
}

@end
