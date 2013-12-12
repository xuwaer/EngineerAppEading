//
//  BaseResponse.h
//  MVCStruct
//
//  Created by Xukj on 3/26/13.
//  Copyright (c) 2013 tosc-its. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"

@interface BaseResponse : NSObject<ITSResponseDelegate>
{
    NSData *_jSONData;
}

@property (nonatomic, strong) NSData *jSONData;

@property (nonatomic, strong) id userinfo;

-(id)initWithJSONData:(NSData *)data;

@end

@interface SubResponse : NSObject<ITSResponseDelegate>
{
    NSDictionary *_subDic;
}

@property (nonatomic, strong) NSDictionary *subDic;

-(id)initWithDictionary:(NSDictionary *)dic;

@end