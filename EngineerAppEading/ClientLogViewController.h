//
//  ClientLogViewController.h
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ClientLogViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, assign) IBOutlet UISearchBar *searchBar;

@end
