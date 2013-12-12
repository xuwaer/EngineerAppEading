//
//  AppData.m
//  EarthquakeInfo
//
//  Created by xukj on 13-10-25.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "AppData.h"
#import "Constant.h"

static AppData *staticAppData = nil;

@interface AppData ()

@property (nonatomic, strong) NSDictionary *defaultVaule;

@end

@implementation AppData

+(AppData *)appData
{
    if (staticAppData == nil) {
        staticAppData = [[AppData alloc] init];
    }
    
    return staticAppData;
}

#pragma mark AppData使用

- (id)init
{
    self = [super init];
    if (self) {
        // 读取默认
        [self loadDefault];
        // 读取用户设置
        [self loadSetting];
        // 处理用户设置
        [self defaultSetting];
    }
    return self;
}

- (void)loadDefault
{
    NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"ValueSource" ofType:@"plist"];
    self.defaultVaule = [[NSDictionary alloc] initWithContentsOfFile:defaultPath];
}

/**
 *	@brief	初始化状态
 */
- (void)defaultSetting
{
    [self.userDefault registerDefaults:self.defaultVaule];
}

/**
 *	@brief	加载配置
 */
- (void)loadSetting
{
    self.userDefault = [NSUserDefaults standardUserDefaults];
}

/**
 *	@brief	保存配置
 */
- (void)saveSetting
{
    [self.userDefault synchronize];
}

@end
