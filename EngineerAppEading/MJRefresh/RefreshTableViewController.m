//
//  RefreshTableViewController.m
//  EarthquakeInfo
//
//  Created by xukj on 13-10-24.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "RefreshTableViewController.h"
#import "MJRefresh.h"

@interface RefreshTableViewController () <MJRefreshBaseViewDelegate>
{
    MJRefreshHeaderView *_headerView;
    MJRefreshFooterView *_footerView;
}

@end

@implementation RefreshTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
}

-(void)dealloc
{
    [_headerView free];
    [_footerView free];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews
{
    _headerView = [[MJRefreshHeaderView alloc] init];
    _headerView.delegate = self;
    _headerView.scrollView = self.tableView;
    
    _footerView = [[MJRefreshFooterView alloc] init];
    _footerView.delegate = self;
    _footerView.scrollView = self.tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 让刷新控件恢复默认的状态
    [_headerView endRefreshing];
    [_footerView endRefreshing];
    
    return 0;
}

#pragma mark - MJRefreshBaseView delegate

- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == _headerView)
        [self refreshAll];
    else
        [self loadMore];
}

#pragma mark - 需要子类实现的方法

- (void)refreshAll
{

}

- (void)loadMore
{

}

@end
