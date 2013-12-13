//
//  Constant.h
//  EarthquakeInfo
//
//  Created by xukj on 13-10-21.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef SERVER_CONNECTION
#define SERVER_CONNECTION_HOST @"http://comcat.cr.usgs.gov/fdsnws/event/1"
#endif

#ifndef EVENT_TYPE
#define EVENTT_YPE @"earthquake"     //地震
#endif

#ifndef SettingParam
#define kSettingParam           @"kSettingParam"
#define kSettingParamStarttime  @"kSettingParamStarttime"
#define kSettingParamEndtime    @"kSettingParamEndtime"
#define kSettingParamMaxmag     @"kSettingParamMaxmag"
#define kSettingParamMinmag     @"kSettingParamMinmag"
#define kSettingParamAlert      @"kSettingParamAlert"
#endif

#ifndef kUserData
#define kUserData @"kUserData"
#define kUserData_Users @"Users"
#define kUserData_User @"kUser"
#define kUserData_User_userid @"kUser_userid"
#define kUserData_User_username @"kUser_username"
#define kUserData_User_password @"kUser_password"
#define kUserData_User_name @"kUser_name"
#define kUserData_User_email @"kUser_email"
#define kUserData_User_phone @"kUser_phone"
#define kUserData_User_autologin @"kAutologin"

#define kUserData_loginuser @"loginuser"
#endif

@interface Constant : NSObject

+ (NSDictionary *)defaultSetting;

@end

@interface User : NSObject<NSCoding>

@property (nonatomic, strong)NSString *userid;
@property (nonatomic, strong)NSString *username;
@property (nonatomic, strong)NSString *password;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *email;
@property (nonatomic, strong)NSString *phone;
@property (nonatomic, assign)BOOL isAutoLogin;          //是否自动登录

@end
