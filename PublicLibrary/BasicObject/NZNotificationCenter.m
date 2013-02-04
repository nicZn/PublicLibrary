//
//  NZNotificationCenter.m
//  PublicLibrary
//
//  Created by 张 宁 on 2/4/13.
//  Copyright (c) 2013 張 寧. All rights reserved.
//

#import "NZNotificationCenter.h"
#define NOTIFICATIONNAME @"NotificationName"
#define NOTIFICATIONINFO @"NotificationUserInfo"

static NZNotificationCenter *singleNotificationCenter = nil;


@interface NZNotificationCenter()

-(void) postAsycNotification:(NSDictionary *)notificationDetails;

@end

@implementation NZNotificationCenter

#pragma mark -
#pragma mark single

+(NZNotificationCenter *)shareInstance{
    @synchronized(self){
        if (singleNotificationCenter == nil) {
            singleNotificationCenter = [[self alloc] init];
        }
    }
    
    return singleNotificationCenter;
}

-(void) postAsycNotification:(NSDictionary *)notificationDetails{
    if (notificationDetails == nil || [notificationDetails objectForKey:NOTIFICATIONNAME] == nil) {
        return ;
    }
    
    if ([NSThread isMainThread]) {
        id userInfo = [notificationDetails objectForKey:NOTIFICATIONINFO];
        if ([userInfo isKindOfClass:[NSNull class]]) {
            // user info is nil
            userInfo = nil;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:[notificationDetails objectForKey:NOTIFICATIONNAME] object:nil userInfo:userInfo];
    }
    else{
#warning post notification not in mainThread
    }
}

#pragma mark -
#pragma mark add and remove observer
-(void)addObserver:(id)target forNotification:(NSString *)notificationName withSelector:(SEL)selector{
    if (notificationName == nil || target == nil || selector == nil) {
        return ;
    }
    [[NSNotificationCenter defaultCenter] addObserver:target forNotification:notificationName withSelector:selector];
}

-(void) removeObserver:(id)target forNotification:(NSString *)notificationName{
    if (target == nil || notificationName == nil) {
        return ;
    }
    [[NSNotificationCenter defaultCenter] removeObserver:target forNotification:notificationName];
}

#pragma mark -
#pragma mark send notification

-(void)postNotification:(NSString *)notificationName withUserInfo:(NSDictionary *)userInfo waitUtilDone:(BOOL)bWaitUtilDone{
    if (notificationName == nil || [notificationName length] < 1) {
        return ;
    }
    
    if ([NSThread isMainThread]) {
        if (bWaitUtilDone) {
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:userInfo];
        }
        else{
            NSDictionary *notificationDetails = [NSDictionary dictionaryWithObjectsAndKeys:notificationName,NOTIFICATIONNAME,userInfo,NOTIFICATIONINFO, nil];
            [self performSelector:@selector(postAsycNotification:) withObject:notificationDetails afterDelay:0];
        }
    }
    else{
        NSDictionary *notificationDetails = [NSDictionary dictionaryWithObjectsAndKeys:notificationName,NOTIFICATIONNAME,userInfo,NOTIFICATIONINFO, nil];
        [self performSelectorOnMainThread:@selector(postAsycNotification:) withObject:notificationDetails waitUntilDone:bWaitUtilDone];
    }
}@end
