//
//  PwdChangeViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PwdChangeViewController : BaseViewController

@property (nonatomic, assign) IBOutlet UITextField *oldPwdTextField;
@property (nonatomic, assign) IBOutlet UITextField *otherPwdTextField;
@property (nonatomic, assign) IBOutlet UITextField *confirmPwdTextField;

@end
