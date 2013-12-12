//
//  WorkDetailViewController.m
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "WorkDetailViewController.h"
#import "WorkDetailControl.h"

@interface WorkDetailViewController ()

@property (nonatomic, strong) WorkDetailControl *detailControl;

@end

@implementation WorkDetailViewController

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

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.detailControl = [[WorkDetailControl alloc] init];
    [[ITSTransManager defaultManager] add:self.detailControl];
}

- (void)destoryHttpQueue
{
    if (self.detailControl)
        [[ITSTransManager defaultManager] remove:self.detailControl];
    self.detailControl = nil;
}

@end
