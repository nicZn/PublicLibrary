//
//  NZViewElement.m
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "NZViewElementDrawing.h"

@implementation NZViewElementDrawing

+(void) drawLeftRoundedCornerAtPoint:(CGPoint)point withRadius:(CGFloat)radius withTransformation:(CGAffineTransform)transform Color:(UIColor *)color andReverse:(BOOL)reverse {
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    // create the path. has to be done this way to allow use of the transform
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &transform, point.x, point.y);
    CGPathAddLineToPoint(path, &transform, point.x, point.y+ radius);
    if (reverse) {
        CGPathAddArc(path, &transform, point.x, point.y, radius, (-90) * M_PI/180, (0) * M_PI/180, YES);
    }
    else{
        CGPathAddArc(path, &transform, point.x+ radius, point.y+ radius, radius, (180) * M_PI/180, (-90) * M_PI/180, 0);
    }
    
    CGPathAddLineToPoint(path, &transform, point.x, point.y);
    
    // fill the path to create the illusion that the corner is rounded
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillPath(context);
    
    // appropriate memory management
    CGPathRelease(path);
}

+(void)drawRoundCornerViewRect:(CGRect)rect forUIViewRoundCornerType:(UIViewRoundCornerType)type withCornerRadius:(CGFloat)radius andCornerColor:(UIColor *)color{
    if ((type & UIViewRoundCornerTopLeft) != 0) {
        NSLog(@"draw topLeft roundCorner");
        [NZViewElementDrawing drawLeftRoundedCornerAtPoint:CGPointMake(0, 0) withRadius:radius withTransformation:CGAffineTransformMakeRotation(0) Color:color andReverse:(type & UIViewRoundCornerReverse)];
    }
    if ((type & UIViewRoundCornerTopRight) != 0) {
        NSLog(@"draw TopRight roundCorner");
        [NZViewElementDrawing drawLeftRoundedCornerAtPoint:CGPointMake(0, -rect.size.width) withRadius:radius withTransformation:CGAffineTransformMakeRotation(90 *M_PI/180) Color:color andReverse:(type & UIViewRoundCornerReverse)];
    }
    if ((type & UIViewRoundCornerBottomLeft) != 0) {
        NSLog(@"draw BottomLeft roundCorner");
        [NZViewElementDrawing drawLeftRoundedCornerAtPoint:CGPointMake(-rect.size.height,0) withRadius:radius withTransformation:CGAffineTransformMakeRotation(-90*M_PI/180) Color:color andReverse:(type & UIViewRoundCornerReverse)];
    }
    if ((type & UIViewRoundCornerBottomRight) != 0) {
        NSLog(@"draw BottomRight roundCorner");
        [NZViewElementDrawing drawLeftRoundedCornerAtPoint:CGPointMake(-rect.size.width, -rect.size.height) withRadius:radius withTransformation:CGAffineTransformMakeRotation(M_PI) Color:color andReverse:(type & UIViewRoundCornerReverse)];
    }
}

@end
