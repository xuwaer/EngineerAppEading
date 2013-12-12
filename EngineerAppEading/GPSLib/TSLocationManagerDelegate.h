//
//  TSLocationManagerDelegate.h
//  MapSDK
//
//  Created by 杨 发兵 on 13-6-18.
//  Copyright (c) 2013年 tosc-its. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class TSLocationManager;

@protocol TSLocationManagerDelegate <NSObject>

- (void)locationManager:(TSLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(TSLocationManager *)manager didUpdateLocation:(CLLocation *)location;

- (void)locationManager:(TSLocationManager *)manager didFailWithError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLLocationDirection)newHeading;

@end
