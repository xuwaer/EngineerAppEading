//
//  EvilTransform.m
//  NaviSDK
//
//  Created by SkyJean on 13-7-31.
//  Copyright (c) 2013年 ______. All rights reserved.
//

#import "EvilTransform.h"

@implementation EvilTransform

+(CLLocationCoordinate2D)transForm:(CLLocationCoordinate2D)coordinate
{
    double a = 6378245.0;
    double ee = 0.00669342162296594323;
    
    double mgLat;
    double mgLon;
    double wgLat = coordinate.latitude;
    double wgLon = coordinate.longitude;
    if ([self outOfChina:wgLat lon:wgLon])
    {
        mgLat = wgLat;
        mgLon = wgLon;
        return CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    }
    double dLat = [self transformLat:(wgLon - 105.0) y:(wgLat - 35.0)];
    double dLon = [self transformLon:(wgLon - 105.0) y:(wgLat - 35.0)];
    double radLat = wgLat / 180.0 * M_PI;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    mgLat = wgLat + dLat;
    mgLon = wgLon + dLon;
    return CLLocationCoordinate2DMake(mgLat, mgLon);
}

+(BOOL)outOfChina:(double)lat  lon:(double)lon
{
    if (lon < 72.004 || lon > 137.8347)
        return true;
    if (lat < 0.8293 || lat > 55.8271)
        return true;
    return false;
}

+(double)transformLat:(double)x y:(double)y
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(abs(x));
    
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

+(double)transformLon:(double)x y:(double)y
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return ret;
}

@end
