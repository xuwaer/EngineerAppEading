//
//  PersonEditViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PersonEditViewController : BaseViewController

@property (nonatomic, assign) IBOutlet UITextField *editTextField;

@property (nonatomic, strong) NSString *editString;

@end
