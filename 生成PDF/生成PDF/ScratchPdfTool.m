//
//  ScratchPdfTool.m
//  FMEFB
//
//  Created by laiyp on 2018/8/2.
//  Copyright © 2018年 BeiJing Finemap SCI-Tech Co.,ltd. All rights reserved.
//

#import "ScratchPdfTool.h"
#import "MD5Encryption.h"
@interface ScratchPdfTool()

@end

@implementation ScratchPdfTool

+(instancetype)shareInstance{
    static ScratchPdfTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc]init];
    });
    return tool;
}
-(NSDictionary *)pdfDic{
    if (!_pdfDic) {
        _pdfDic = [[NSDictionary alloc]init];
    }
    return _pdfDic;
}

//创建pdf路径
-(NSString *)createPDfPath{
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString *directoryPath = [path stringByAppendingPathComponent:@"/ScratchPath"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:directoryPath]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *pdfName = [self createPdfName];
    NSString *filePath= [directoryPath stringByAppendingPathComponent:pdfName];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:pdfName,@"name",filePath,@"path",nil];
    self.pdfDic = dic;
    self.pdfName = pdfName;
    self.pdfPath = filePath;
    return filePath;
}

//创建pdf名称
-(NSString *)createPdfName{
    
    NSString *nameStr = [NSString stringWithFormat:@"%d%d%d%d",arc4random()%100,100+arc4random()%101,200+arc4random()%101,300+arc4random()%101];
    NSString *md5Name = [MD5Encryption md5HexDigest:nameStr];
    NSString *pdfName = [md5Name stringByAppendingString:@".pdf"];
    return pdfName;
}
-(void)createPDF:(CGSize)size{
    NSString* pdfFileName = [self createPDfPath];
    // 创建一个PDF的上下文，页面大小
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
    // 标记新页面的开头
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, size.width, size.height), nil);
    
    // 获取上下文.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // 把文字变成矩阵已知状态。这将确保没有旧缩放因子被留在原处。
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    //文本坐标翻转
    CGContextTranslateCTM(currentContext, 0, 100);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    
    //关闭PDF上下文
    UIGraphicsEndPDFContext();

}

@end
