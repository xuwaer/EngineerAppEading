//
//  ForgetPwdVerifyViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ForgetPwdVerifyViewController.h"
#import "ForgetPwdVerifyControl.h"

@interface ForgetPwdVerifyViewController ()

@property (nonatomic, strong) ForgetPwdVerifyControl *verifyControl;

@end

@implementation ForgetPwdVerifyViewController

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

-(void)reSendButtonClicked:(id)sender
{
    
}

-(void)doneButtonClicked:(id)sender
{
    
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.verifyControl = [[ForgetPwdVerifyControl alloc] init];
    [[ITSTransManager defaultManager] add:self.verifyControl];
}

- (void)destoryHttpQueue
{
    if (self.verifyControl)
        [[ITSTransManager defaultManager] remove:self.verifyControl];
    self.verifyControl = nil;
}

@end
