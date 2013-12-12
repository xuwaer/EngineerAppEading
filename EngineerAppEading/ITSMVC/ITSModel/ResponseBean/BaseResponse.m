//
//  BaseResponse.m
//  MVCStruct
//
//  Created by Xukj on 3/26/13.
//  Copyright (c) 2013 tosc-its. All rights reserved.
//

#import "BaseResponse.h"

@implementation BaseResponse

@synthesize jSONData = _jSONData;

-(id)initWithJSONData:(NSData *)data
{
    self = [super init];
    
    if (self) {
        _jSONData = data;
    }
    
    return self;
}

/**
 *	@brief	需要子类实现
 */
-(BOOL)decode
{
    return NO;
}

/**
 *	@brief	需要子类实现
 *
 *	@return
 */
-(NSUInteger)tag
{
    return -1;
}

@end

@implementation SubResponse

@synthesize subDic = _subDic;

-(id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        _subDic = dic;
    }
    
    return self;
}


/**
 *	@brief	需要子类实现
 */
-(BOOL)decode
{
    return NO;
}

/**
 *	@brief	需要子类实现
 *
 *	@return
 */
-(NSUInteger)tag
{
    return -1;
}

@end