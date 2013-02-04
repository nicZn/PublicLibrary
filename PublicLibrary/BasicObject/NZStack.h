//
//  NZStack.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/04.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NZStack : NSObject

-(id)init;

-(void)push:(id)obj;

-(id)pop;

-(void)clear;

-(NSArray *)popAll;

@end
