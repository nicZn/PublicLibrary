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
    self.navigationBar.roundedCornerRadius = 5;
    self.navigationBar.roundCornerType = UIViewRoundCornerBottomLeft | UIViewRoundCornerBottomRight | UIViewRoundCornerTopLeft | UIViewRoundCornerTopRight;
//    self.navigationBar.roundCornerColor = [UIColor redColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
