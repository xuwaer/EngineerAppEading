//
//  Constant.m
//  EarthquakeInfo
//
//  Created by xukj on 13-10-21.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "Constant.h"

@implementation Constant

+(NSDictionary *)defaultSetting
{
    return nil;
}

@end

@implementation User

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        self.userid = [aDecoder decodeObjectForKey:kUserData_User_userid];
        self.username = [aDecoder decodeObjectForKey:kUserData_User_username];
        self.password = [aDecoder decodeObjectForKey:kUserData_User_password];
        self.name = [aDecoder decodeObjectForKey:kUserData_User_name];
        self.email = [aDecoder decodeObjectForKey:kUserData_User_email];
        self.phone = [aDecoder decodeObjectForKey:kUserData_User_phone];
        self.isAutoLogin = [aDecoder decodeBoolForKey:kUserData_User_autologin];
    }
    
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userid forKey:kUserData_User_userid];
    [aCoder encodeObject:self.username forKey:kUserData_User_username];
    [aCoder encodeObject:self.password forKey:kUserData_User_password];
    [aCoder encodeObject:self.name forKey:kUserData_User_name];
    [aCoder encodeObject:self.email forKey:kUserData_User_email];
    [aCoder encodeObject:self.phone forKey:kUserData_User_phone];
    [aCoder encodeBool:self.isAutoLogin forKey:kUserData_User_autologin];
}

@end