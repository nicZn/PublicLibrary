//
//  NZViewElement.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, UIViewRoundCornerType){
    UIViewRoundCornerTopLeft = 0x1,
    UIViewRoundCornerTopRight = 0x2,
    UIViewRoundCornerBottomLeft = 0x4,
    UIViewRoundCornerBottomRight = 0x8,
    UIViewRoundCornerReverse = 0x10,
};

@interface NZViewElementDrawing : NSObject

+ (void)drawRoundCornerViewRect:(CGRect)rect forUIViewRoundCornerType:(UIViewRoundCornerType)type withCornerRadius:(CGFloat)radius andCornerColor:(UIColor *)color;

@end
