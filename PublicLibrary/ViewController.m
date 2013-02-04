//
//  ViewController.m
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize navigationBar = _navigationBar;


-(void)viewWillAppear:(BOOL)animated{
    self.navigationBar.roundedCornerRadius = 8;
    self.navigationBar.roundCornerType = UIViewRoundCornerTopLeft | UIViewRoundCornerTopRight;
}

- (void)viewDidLoad
{
//    NSLog(@"%s, %d, %s, %s",__FILE__ , __LINE__, __PRETTY_FUNCTION__, __FUNCTION__);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
