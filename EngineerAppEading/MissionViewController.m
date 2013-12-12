//
//  MissionViewController.m
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "MissionViewController.h"
#import "ExtendCell.h"

@interface MissionViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation MissionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"missionCell";
    ExtendCell *cell = (ExtendCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *value = [[self.datasource objectAtIndex:indexPath.row] componentsSeparatedByString:@","];
    cell.textLabel.text = value[0];
    cell.action = value[1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExtendCell *cell = (ExtendCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:cell.action sender:[tableView cellForRowAtIndexPath:indexPath]];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

//////////////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 测试数据

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)testData
{
    self.datasource = [[NSMutableArray alloc] init];
    [self.datasource addObject:@"新任务,showNewMission"];
    [self.datasource addObject:@"已接受任务,showMyMission"];
    [self.datasource addObject:@"客户记录,showClientLog"];
    [self.datasource addObject:@"工作记录,showCompleteMission"];
}

@end
