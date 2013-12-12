//
//  MissionViewController.h
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MissionViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) IBOutlet UITableView *tableView;

@end
