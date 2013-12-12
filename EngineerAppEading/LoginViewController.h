//
//  LoginViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (nonatomic, assign) IBOutlet UIButton *loginButton;
@property (nonatomic, assign) IBOutlet UIButton *registerButton;
@property (nonatomic, assign) IBOutlet UITextField *usernameTextField;
@property (nonatomic, assign) IBOutlet UITextField *passwordTextField;

-(IBAction)loginButtonClicked:(id)sender;
-(IBAction)registerButtonClicked:(id)sender;
-(IBAction)forgetButtonClicked:(id)sender;

-(IBAction)testButtonClicked:(id)sender;

@end
