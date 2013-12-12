//
//  FirstViewController.m
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "FirstViewController.h"
#import "ScanViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    [self showLoginViewController];
//    [self showMainViewController];
    [self showScanViewController];
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


/////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

/////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)showMainViewController
{
    [self performSegueWithIdentifier:@"showMain" sender:nil];
}

-(void)showLoginViewController
{
    [self performSegueWithIdentifier:@"login" sender:nil];
}

-(void)showScanViewController
{
    // 创建重复界面
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ScanViewController *scanController = [storyboard instantiateViewControllerWithIdentifier:@"scanRootController"];
    [self presentViewController:scanController animated:YES completion:^{}];
}

@end
