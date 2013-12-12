//
//  RegisterVerifyViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface RegisterVerifyViewController : BaseViewController

@property (nonatomic, assign) IBOutlet UILabel *emailLabel;
@property (nonatomic, assign) IBOutlet UITextField *veriCodeTextField;
@property (nonatomic, assign) IBOutlet UITextField *pwdTextField;
@property (nonatomic, assign) IBOutlet UITextField *rePwdTextField;
@property (nonatomic, assign) IBOutlet UIButton *reSendButton;

-(IBAction)doneButtonClicked:(id)sender;
-(IBAction)reSendButtonClicked:(id)sender;

@end
