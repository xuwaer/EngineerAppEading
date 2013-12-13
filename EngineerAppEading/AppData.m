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

/**
 *	@brief	载入默认配置
 */
- (void)loadDefault
{
    NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"UserData" ofType:@"plist"];
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
    [self userDefaultWillLoad];
    self.userDefault = [NSUserDefaults standardUserDefaults];
    [self userDefaultDidLoad];
}

/**
 *	@brief	保存配置
 */
- (BOOL)saveSetting
{
    [self userDefaultWillSave];
    BOOL result = [self.userDefault synchronize];
    [self userDefaultDidSave];
    
    return result;
}

- (void)userDefaultWillSave
{
    if (self.users) {
        
        NSMutableArray *userArray = [[NSMutableArray alloc] init];
        for (User *user in self.users) {
            
            NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:user];
            [userArray addObject:userData];
        }
        
        [self.userDefault setObject:userArray forKey:kUserData_Users];
    }
}

- (void)userDefaultDidSave
{
    //TODO
}

- (void)userDefaultWillLoad
{
    //TODO
}

- (void)userDefaultDidLoad
{
    NSArray *userArray = [self.userDefault objectForKey:kUserData_Users];
    self.users = [[NSMutableArray alloc] init];
    for (NSData *userData in userArray) {
        
        User *user = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
        [self.users addObject:user];
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - 用户信息操作

////////////////////////////////////////////////////////////////////////////////

-(BOOL)addUser:(User *)user
{
    if (self.userDefault == nil)
        return NO;
    
    NSMutableArray *userArray = nil;
    if ([self.userDefault objectForKey:kUserData_Users] == nil)
        userArray = [[NSMutableArray alloc] init];
    
    userArray = [NSMutableArray arrayWithArray:[self.userDefault objectForKey:kUserData_Users]];
    [userArray addObject:user];
    
    return [self saveSetting];
}

-(BOOL)addUsers:(NSArray *)users
{
    if (self.userDefault == nil || [self.userDefault objectForKey:kUserData_Users] == nil)
        return NO;
    
    NSMutableArray *userArray = nil;
    if ([self.userDefault objectForKey:kUserData_Users] == nil)
        userArray = [[NSMutableArray alloc] init];
    
    userArray = [NSMutableArray arrayWithArray:[self.userDefault objectForKey:kUserData_Users]];
    [userArray addObjectsFromArray:users];
    
    return [self saveSetting];
}

-(BOOL)removeUser:(User *)user
{
    if (self.userDefault == nil)
        return NO;
    
    NSMutableArray *userArray = nil;
    if ([self.userDefault objectForKey:kUserData_Users] == nil)
        userArray = [[NSMutableArray alloc] init];
    
    for (User *inUser in userArray) {
        
        if ([inUser.userid isEqualToString:user.userid]) {
            [userArray removeObject:inUser];
            break;
        }
    }
    
    return [self saveSetting];
}

-(BOOL)removeUsers:(NSArray *)users
{
    if (self.userDefault == nil)
        return NO;
    
    NSMutableArray *userArray = nil;
    if ([self.userDefault objectForKey:kUserData_Users] == nil)
        userArray = [[NSMutableArray alloc] init];
    
    for (User *removeUser in users) {
        
        for (User *inUser in userArray) {
            
            if ([inUser.userid isEqualToString:removeUser.userid]) {
                [userArray removeObject:inUser];
                break;
            }
        }
    }
    
    return [self saveSetting];
}

@end
