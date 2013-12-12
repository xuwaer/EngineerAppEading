//
//  LoginViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginControl.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginControl *loginControl;

@end

@implementation LoginViewController

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

-(void)loginButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(void)registerButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"register" sender:sender];
}

-(void)forgetButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"forget" sender:sender];
}

-(void)testButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.loginControl = [[LoginControl alloc] init];
    [[ITSTransManager defaultManager] add:self.loginControl];
}

- (void)destoryHttpQueue
{
    if (self.loginControl)
        [[ITSTransManager defaultManager] remove:self.loginControl];
    self.loginControl = nil;
}

@end
