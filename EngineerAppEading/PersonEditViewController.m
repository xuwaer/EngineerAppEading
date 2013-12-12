//
//  PersonEditViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "PersonEditViewController.h"
#import "PersonEditControl.h"

@interface PersonEditViewController ()

@property (nonatomic, strong) PersonEditControl *editControl;

@end

@implementation PersonEditViewController

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
	// Do any additional setup after loading the view.
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
    self.editControl = [[PersonEditControl alloc] init];
    [[ITSTransManager defaultManager] add:self.editControl];
}

- (void)destoryHttpQueue
{
    if (self.editControl)
        [[ITSTransManager defaultManager] remove:self.editControl];
    self.editControl = nil;
}

@end
