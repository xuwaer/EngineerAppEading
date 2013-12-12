//
//  ForgetPwdRequestViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ForgetPwdRequestViewController : BaseViewController

@property (nonatomic, assign) IBOutlet UITextField *emailTextField;

-(IBAction)sendButtonClicked:(id)sender;

@end
