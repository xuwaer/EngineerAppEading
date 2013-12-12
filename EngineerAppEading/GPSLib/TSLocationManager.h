//
//  TSLocationManager.h
//  MapSDK
//
//  Created by 杨 发兵 on 13-6-18.
//  Copyright (c) 2013年 tosc-its. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "TSLocationManagerDelegate.h"

// 定位Manager
@interface TSLocationManager : NSObject <CLLocationManagerDelegate>

// 需实现此delegate来获得定位位置信息
@property (nonatomic, assign) id <TSLocationManagerDelegate> delegate;

// 判断该设备定位是否可用
+ (BOOL)locationServicesEnabled;

// 开始更新位置
- (void)startUpdatingLocation;

// 停止更新位置,如果是只需获得用户当前的位置而不是一直动态追踪用户位置的话，则在获得用户当前位置后须调用此方法来停止更新位置
- (void)stopUpdatingLocation;

// for test
-(void) startSimulatingLocation;

-(void) stopSimulatingLocation;

- (void)startUpdatingHeading;

- (void)stopUpdatingHeading;

+ (void) tenPoints;
@end
