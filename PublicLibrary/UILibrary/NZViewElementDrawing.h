//
//  NZViewElement.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, UIViewRoundCornerType){
    UIViewRoundCornerTopLeft = 0x0001,
    UIViewRoundCornerTopRight = 0x0010,
    UIViewRoundCornerBottomLeft = 0x0100,
    UIViewRoundCornerBottomRight = 0x1000,
};

@interface NZViewElementDrawing : NSObject

+ (void)drawRoundCornerViewRect:(CGRect)rect forUIViewRoundCornerType:(UIViewRoundCornerType)type withCornerRadius:(CGFloat)radius andCornerColor:(UIColor *)color;



@end
