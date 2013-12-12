//
//  EvilTransform.h
//  NaviSDK
//
//  Created by SkyJean on 13-7-31.
//  Copyright (c) 2013年 ______. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface EvilTransform : NSObject

// World Geodetic System ==> Mars Geodetic System
+(CLLocationCoordinate2D)transForm:(CLLocationCoordinate2D)coordinate;

@end
