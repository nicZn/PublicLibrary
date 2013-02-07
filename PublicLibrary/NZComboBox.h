//
//  NZComboBox.h
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/07.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark -
#pragma mark NZComboBoxSelection
@interface NZComboBoxSelection: NSObject

@property (nonatomic,strong)NSString *title;
@property (nonatomic, strong)NSMutableDictionary *userInfo;

@end

@class NZComboBox;
@protocol NZComboBoxDelegate <NSObject>

-(void)selectionListWillAppear:(NZComboBox *)combox;

@end

#pragma mark -
#pragma mark NZComboBox
@interface NZComboBox : UITextField

-(void)addSelections:(NSArray *)selections;
-(void)insertSelection:(NZComboBoxSelection*)selection atIndex:(NSUInteger)index;

-(void)addSelection:(NZComboBoxSelection *)selection;

@end
