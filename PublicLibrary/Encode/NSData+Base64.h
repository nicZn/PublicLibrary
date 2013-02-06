//
//  NSData+Base64.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/06.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+(NSData *)dataFromBase64String:(NSString *)encodedString;

-(NSString *)base64EncodedString:(NSInteger)separateLines;

@end
