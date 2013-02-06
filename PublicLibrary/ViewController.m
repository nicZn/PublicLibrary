//
//  ViewController.m
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *fontFamilyNames;
@property (nonatomic, strong)NSMutableDictionary *fontNamesForFamily;

@end

@implementation ViewController

@synthesize navigationBar = _navigationBar;

@synthesize fontFamilyNames = _fontFamilyNames;
@synthesize fontNamesForFamily = _fontNamesForFamily;


-(void)viewWillAppear:(BOOL)animated{
    self.navigationBar.roundedCornerRadius = 8;
    self.navigationBar.roundCornerType = UIViewRoundCornerTopLeft | UIViewRoundCornerTopRight;
}

- (void)viewDidLoad
{
//    NSLog(@"%s, %d, %s, %s",__FILE__ , __LINE__, __PRETTY_FUNCTION__, __FUNCTION__);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UINavigationItem *item = [self.navigationBar.items lastObject];
    item.title = @"Font List";
    self.fontFamilyNames = [[UIFont familyNames] mutableCopy];
    self.fontNamesForFamily = [NSMutableDictionary dictionary];
    for (NSString *name in self.fontFamilyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:name];
        [self.fontNamesForFamily setObject:fontNames forKey:name];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.fontFamilyNames objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.fontNamesForFamily objectForKey:[self.fontFamilyNames objectAtIndex:section]] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.fontFamilyNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *name = [[self.fontNamesForFamily objectForKey:[self.fontFamilyNames objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = name;
    cell.textLabel.font = [UIFont fontWithName:name size:17.0];
    
    return cell;
}

@end
