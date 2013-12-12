//
//  RegisterViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterControl.h"

@interface RegisterViewController ()

@property (nonatomic, strong) RegisterControl *registerControl;

@end

@implementation RegisterViewController

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

-(void)nextButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"registerVerify" sender:sender];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.registerControl = [[RegisterControl alloc] init];
    [[ITSTransManager defaultManager] add:self.registerControl];
}

- (void)destoryHttpQueue
{
    if (self.registerControl)
        [[ITSTransManager defaultManager] remove:self.registerControl];
    self.registerControl = nil;
}

@end
