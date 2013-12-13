//
//  AppData.h
//  EarthquakeInfo
//
//  Created by xukj on 13-10-25.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

@interface AppData : NSObject

@property (nonatomic, strong) NSUserDefaults *userDefault;

+ (AppData *)appData;

/**
 *	@brief	用户组
 */
@property (nonatomic, strong) NSMutableArray *users;

- (BOOL)addUser:(User *)user;
- (BOOL)addUsers:(NSArray *)users;
- (BOOL)removeUser:(User *)user;
- (BOOL)removeUsers:(NSArray *)users;

- (BOOL)saveSetting;

@end
