//
//  MD5Encryption.h
//  EFB
//
//  Created by mac on 13-12-20.
//  Copyright (c) 2013年 zhx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Encryption : NSObject

+ (NSString *)md5HexDigest:(NSString*)password;

+(NSString*)getFileMD5WithPath:(NSString*)path;
@end
