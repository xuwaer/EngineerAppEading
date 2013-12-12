//
//  NSNull+Fix.m
//  EarthquakeInfo
//
//  Created by xukj on 13-10-22.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "NSNull+Fix.h"

@implementation NSNull (Fix)

-(NSInteger)integerValue
{
    return -1;
}

-(float)floatValue{
    
    return -1.0f;
}

-(long long)longLongValue
{
    
    return -1;
}

-(double)doubleValue
{
    
    return -1.0;
}

@end
