//
//  NSData+Encode.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/06.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (Encode)

//decode by base64
+(NSData *)dataFromBase64String:(NSString *)encodedString;
//encode by base64
-(NSString *)base64EncodedString:(NSInteger)separateLines;


//encrypt by AES256
-(NSData *)AES256EncryptWithKey:(NSString *)key;
//decrypt by AES256
-(NSData *)AES256DecryptWithKey:(NSString *)key;
@end
