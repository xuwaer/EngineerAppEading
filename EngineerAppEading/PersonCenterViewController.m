//
//  PersonCenterViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "ExtendCell.h"
#import "PersonCenterControl.h"

@interface PersonCenterViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) PersonCenterControl *centerControl;

@end

@implementation PersonCenterViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupHttpQueue];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [self destoryHttpQueue];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"personCenterCell";
    ExtendCell *cell = (ExtendCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *item = [[self.datasource objectAtIndex:indexPath.row] componentsSeparatedByString:@","];
    cell.textLabel.text = item[0];
    cell.action = item[1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExtendCell *cell = (ExtendCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.action isEqualToString:@"default"] || [cell.action isEqualToString:@"logout"]) {
        return;
    }
    
    [self performSegueWithIdentifier:cell.action sender:self];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

//////////////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - data

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)initData
{
    self.datasource = [[NSMutableArray alloc] init];
    [self.datasource addObject:@"个人资料,showPersonInfo"];
    [self.datasource addObject:@"密码修改,changePassword"];
    [self.datasource addObject:@"消息中心,showMessage"];
    [self.datasource addObject:@"设置,showSetting"];
    [self.datasource addObject:@"注销,logout"];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.centerControl = [[PersonCenterControl alloc] init];
    [[ITSTransManager defaultManager] add:self.centerControl];
}

- (void)destoryHttpQueue
{
    if (self.centerControl)
        [[ITSTransManager defaultManager] remove:self.centerControl];
    self.centerControl = nil;
}

@end
