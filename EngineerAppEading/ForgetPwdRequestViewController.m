//
//  ForgetPwdRequestViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ForgetPwdRequestViewController.h"
#import "ForgetPwdControl.h"

@interface ForgetPwdRequestViewController ()

@property (nonatomic, strong) ForgetPwdControl *forgetControl;

@end

@implementation ForgetPwdRequestViewController

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

/////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

/////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)sendButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"forgetVerify" sender:sender];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.forgetControl = [[ForgetPwdControl alloc] init];
    [[ITSTransManager defaultManager] add:self.forgetControl];
}

- (void)destoryHttpQueue
{
    if (self.forgetControl)
        [[ITSTransManager defaultManager] remove:self.forgetControl];
    self.forgetControl = nil;
}

@end
