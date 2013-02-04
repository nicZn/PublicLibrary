//
//  NZStack.m
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/04.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "NZStack.h"

@interface NZStack()

@property (nonatomic, strong)NSMutableArray *objectArray;

@end


@implementation NZStack

@synthesize objectArray = _objectArray;

-(id)init{
    self = [super init];
    if (self) {
        self.objectArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

-(id)pop{
    if ([self.objectArray count] > 0) {
        id obj = [self.objectArray lastObject];
        [self.objectArray removeLastObject];
        return obj;
    }
    return nil;
}

-(void)push:(id)obj{
    if (self.objectArray == nil) {
        self.objectArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [self.objectArray insertObject:obj atIndex:[self.objectArray count]];
}

-(NSArray *)popAll{
    if ([self.objectArray count] > 0) {
        return [NSArray arrayWithArray:self.objectArray];
    }
    return nil;
}

-(void)clear{
    if ([self.objectArray count] > 0) {
        [self.objectArray removeAllObjects];
        self.objectArray = nil;
        self.objectArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
}

@end
