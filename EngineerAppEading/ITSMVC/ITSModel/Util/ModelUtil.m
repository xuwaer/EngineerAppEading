//
//  ModelUtil.m
//  tfsp_rc
//
//  Created by Xukj on 3/25/13.
//
//

#import "ModelUtil.h"
#import <objc/runtime.h>

@implementation ModelUtil

#pragma mark - 解析工具已废弃

+(id)convertObjectToJSON:(id)object
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    NSString *xml=@"{";
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key=[[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id value=[object valueForKey:key];
        
        if (value!=nil) {
            //IF NOT NSSTRING,LOOP!!!!!!
            if (![value isKindOfClass:[NSString class]]) {
                xml=[xml stringByAppendingFormat:@"%@:%@,",key,[ModelUtil convertObjectToJSON:[object valueForKey:key]]];
            }
            else
            {
                xml=[xml stringByAppendingFormat:@"%@:'%@',",key,value];
            }
        }
        else
        {
            xml=[xml stringByAppendingFormat:@"%@:'%@',",key,@""];
        }
    }
    xml=[xml substringToIndex:xml.length-1];
    xml=[xml stringByAppendingString:@"}"];
    
    //NSLog(@"结果：%@",xml);
    
    free(properties);
    
    return xml;
}

+(id)convertObjectToXML:(id)object
{
    return nil;
}

#pragma mark - 时间制式工具

+(NSString *)convertDateToUTCType1:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = timeZone;
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

+(NSString *)convertDateToUTCType2:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = timeZone;
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [[dateFormatter stringFromDate:date] stringByAppendingString:@" UTC"];
}

#pragma mark - 其他工具

+(UIColor *)convertAlertToColor:(NSString *)alert
{
    if (alert == nil || [alert isEqual:[NSNull null]])
        return [UIColor blackColor];
    else if ([alert isEqualToString:@"green"])
        return [UIColor greenColor];
    else if ([alert isEqualToString:@"yellow"])
        return [UIColor yellowColor];
    else if ([alert isEqualToString:@"orange"])
        return [UIColor orangeColor];
    else if ([alert isEqualToString:@"red"])
        return [UIColor redColor];
    else
        return [UIColor blackColor];
}

+(NSString *)formatDepthData:(float)depth
{
    return [NSString stringWithFormat:@"%.1fkm deep", depth];
}

@end
