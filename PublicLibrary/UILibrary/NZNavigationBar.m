//
//  NZNavigationBar.m
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "NZNavigationBar.h"


@implementation NZNavigationBar

@synthesize roundedCornerRadius = _roundedCornerRadius;
@synthesize roundCornerType = _roundCornerType;
@synthesize roundCornerColor = _roundCornerColor;

#define defalutRoundCornerColor [UIColor blackColor]

-(void)initWithDefault{
    self.roundedCornerRadius = 0.0;
    self.roundCornerType = 0;
    self.roundCornerColor = defalutRoundCornerColor;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initWithDefault];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Drawing code
    if (self.roundedCornerRadius > 0 && self.roundCornerType > 0) {
        [NZViewElementDrawing drawRoundCornerViewRect:self.frame forUIViewRoundCornerType:self.roundCornerType withCornerRadius:self.roundedCornerRadius andCornerColor:self.roundCornerColor];
    }
}


@end
