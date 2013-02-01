//
//  NZNavigationBar.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NZViewElementDrawing.h"


@interface NZNavigationBar : UINavigationBar

@property (nonatomic) CGFloat roundedCornerRadius;

@property (nonatomic) UIViewRoundCornerType roundCornerType;

@property (nonatomic, strong) UIColor *roundCornerColor;

@end
