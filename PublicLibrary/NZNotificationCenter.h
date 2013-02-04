//
//  NZNotificationCenter.h
//  PublicLibrary
//
//  Created by 张 宁 on 2/4/13.
//  Copyright (c) 2013 張 寧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NZNotificationCenter : NSObject

+(NZNotificationCenter *)shareInstance;


#pragma mark -
#pragma mark add and remove observer
-(void)addObserver:(id)target forNotification:(NSString *)notificationName withSelector:(SEL)selector;

-(void) removeObserver:(id)targer forNotification:(NSString *)notificationName;

#pragma mark -
#pragma mark send notification

-(void)postNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)userInfo waitUtilDone:(BOOL)bWaitUtilDone;



@end
