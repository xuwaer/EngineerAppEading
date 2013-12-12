//
//  NSNull+Fix.h
//  EarthquakeInfo
//
//  Created by xukj on 13-10-22.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Fix)

-(NSInteger)integerValue;

-(float)floatValue;

-(long long)longLongValue;

-(double)doubleValue;

@end
