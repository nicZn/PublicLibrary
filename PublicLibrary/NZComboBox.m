//
//  NZComboBox.m
//  PublicLibrary
//
//  Created by 張 寧 on 2013/02/07.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "NZComboBox.h"
#import <QuartzCore/QuartzCore.h>

#define ListViewHeight 176
#define ListViewCellHeight 44

#pragma mark -
#pragma mark -
#pragma mark NZComboBoxSelection
@implementation NZComboBoxSelection

@synthesize title = _title;
@synthesize userInfo = _userInfo;

@end


#pragma mark -
#pragma mark -
#pragma mark NZComboBox
@interface NZComboBox()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong)NSMutableArray *selections;
@property (nonatomic, strong)NSMutableArray *selectionsToShow;
@property (nonatomic)BOOL showList;
@property (nonatomic, strong)UIButton *rightButton;

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation NZComboBox

@synthesize selections = _selections;
@synthesize selectionsToShow = _selectionsToShow;
@synthesize showList = _showList;
@synthesize rightButton = _rightButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [[UIColor redColor] CGColor];
        self.layer.borderWidth = 1.0f;
        self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.height -2, self.bounds.size.height -2)];
        [self.rightButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        
        [self.rightButton addTarget:self action:@selector(listButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.rightView = self.rightButton;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.showList = NO;
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, 0)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editChanged:) name:UITextFieldTextDidChangeNotification object:self];
    }
    return self;
}

-(void)addSelection:(NZComboBoxSelection *)selection{
    if (selection == nil) {
        return;
    }
    if (self.selections == nil) {
        self.selections = [NSMutableArray array];
    }
    [self.selections addObject:selection];
}

-(void)addSelections:(NSArray *)selections{
    if (selections == nil) {
        return;
    }
    if (self.selections == nil) {
        self.selections = [NSMutableArray array];
    }
    [self.selections addObjectsFromArray:selections];
}

-(void)insertSelection:(NZComboBoxSelection*)selection atIndex:(NSUInteger)index{
    if (selection == nil) {
        return;
    }
    if (self.selections == nil) {
        self.selections = [NSMutableArray array];
    }
    if (index >= self.selections.count) {
        [self.selections addObject:selection];
        return;
    }
    [self.selections insertObject:selection atIndex:index];
}


-(void)showListView{
    if (self.showList) {
        return;
    }
    self.selectionsToShow = [NSMutableArray arrayWithArray:self.selections];
    [self.rightButton setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGFloat height = 0.0f;
    if (self.selectionsToShow.count == 0) {
        height = 10.0f;
        self.tableView.layer.masksToBounds = YES;
        self.tableView.layer.borderWidth = 1.0f;
        self.tableView.layer.borderColor = [[UIColor blackColor] CGColor];
    }
    else{
        height = ListViewHeight < (self.selectionsToShow.count * ListViewCellHeight)?ListViewHeight:(self.selectionsToShow.count * ListViewCellHeight);
    }
    self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y,self.tableView.frame.size.width , height);
    [self.tableView reloadData];
    [UIView commitAnimations];
    if (self.tableView.superview == nil) {
        [self.superview addSubview:self.tableView];
    }
    self.showList = YES;
}

-(void)hiddenListView{
    if (!self.showList) {
        return;
    }
    [self.selectionsToShow removeAllObjects];
    [self.rightButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y,self.tableView.frame.size.width , 0);
    [UIView commitAnimations];
    self.showList = NO;
}

#pragma mark -
#pragma mark tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.selectionsToShow.count == 0) {
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self.selectionsToShow.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *name = ((NZComboBoxSelection *)[self.selectionsToShow objectAtIndex:indexPath.row]).title;
    cell.textLabel.text = name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
#warning do something when select such as dismiss keyboard and send delegate
    NZComboBoxSelection *item = [self.selectionsToShow objectAtIndex:indexPath.row];
    self.text = item.title;
    [self resignFirstResponder];
    [self hiddenListView];
    
}

#pragma mark -
#pragma mark buttonAction

-(void)listButtonClicked:(UIButton *)button{
    if (self.showList) {
        [self hiddenListView];
    }
    else{
        [self resignFirstResponder];
        [self showListView];
    }
}

#pragma mark -
#pragma mark - TextFieldDelegate

-(void)editChanged:(NSNotification *)notification{
    NSLog(@"%@",notification);
    if (![notification.object isKindOfClass:[NZComboBox class]]) {
        return ;
    }
    NZComboBox *obj = notification.object;
    if (obj == self) {
        NSMutableArray *copy = [self.selectionsToShow mutableCopy];
        for (NZComboBoxSelection *selection in copy) {
            if (![selection.title hasPrefix:obj.text]) {
                [self.selectionsToShow removeObject:selection];
            }
        }
        copy = nil;
        [self.tableView reloadData];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
