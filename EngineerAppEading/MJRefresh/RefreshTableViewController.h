//
//  RefreshTableViewController.h
//  EarthquakeInfo
//
//  Created by xukj on 13-10-24.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshTableViewController : UITableViewController

- (void)refreshAll;
- (void)loadMore;

//- (void)updateHeaderRefreshDate:(NSDate *)date;
//- (void)updateFooterRefreshDate:(NSDate *)date;

@end
