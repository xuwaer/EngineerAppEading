//
//  RegisterViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController

@property (nonatomic, assign) IBOutlet UITextField *emailTextField;
@property (nonatomic, assign) IBOutlet UITextField *nameTextField;
@property (nonatomic, assign) IBOutlet UITextField *phoneTextField;

-(IBAction)nextButtonClicked:(id)sender;

@end
