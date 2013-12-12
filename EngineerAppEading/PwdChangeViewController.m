//
//  PwdChangeViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "PwdChangeViewController.h"
#import "PwdChangeControl.h"

@interface PwdChangeViewController ()

@property (nonatomic, strong) PwdChangeControl *changeControl;

@end

@implementation PwdChangeViewController

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
    self.changeControl = [[PwdChangeControl alloc] init];
    [[ITSTransManager defaultManager] add:self.changeControl];
}

- (void)destoryHttpQueue
{
    if (self.changeControl)
        [[ITSTransManager defaultManager] remove:self.changeControl];
    self.changeControl = nil;
}

@end
