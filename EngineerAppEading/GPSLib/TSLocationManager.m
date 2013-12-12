//
//  TSLocationManager.m
//  MapSDK
//
//  Created by 杨 发兵 on 13-6-18.
//  Copyright (c) 2013年 tosc-its. All rights reserved.
//

#import "TSLocationManager.h"
#import <MapKit/MapKit.h>
#import "EvilTransform.h"
#include "test.h" 

@interface TSLocationManager () {
    CLLocationManager *locationManager;
    double tmpLat;
    double tmpLon;
    NSTimer *simuTimer;
}

@end

@implementation TSLocationManager

- (id)init
{
    if (self = [super init]) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = 0;
        locationManager.delegate = self;
        
        if ([CLLocationManager headingAvailable]) {
            locationManager.headingFilter = 5;
        }
    }
    return self;
}

+ (BOOL)locationServicesEnabled
{
    return [CLLocationManager locationServicesEnabled];
}

- (void)startUpdatingLocation
{
    [locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
    [locationManager stopUpdatingLocation];
}

- (void)startUpdatingHeading
{
    if ([CLLocationManager headingAvailable]) {
        [locationManager startUpdatingHeading];
    }
}

- (void)stopUpdatingHeading
{
    if ([CLLocationManager headingAvailable]) {
        [locationManager stopUpdatingHeading];
    }
}

#pragma mark - CLLocationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *onelocation = [locations lastObject];
    
    
    
//    NSLog(@"【【【【【GPS】】】】】】:%f - %f", onelocation.coordinate.latitude, onelocation.coordinate.longitude);

    // 正常纠偏 并将原始值转换成毫秒
    CLLocation *reLocation = [[CLLocation alloc] initWithCoordinate:[EvilTransform transForm:onelocation.coordinate] altitude:onelocation.altitude horizontalAccuracy:onelocation.horizontalAccuracy verticalAccuracy:onelocation.verticalAccuracy course:onelocation.course speed:onelocation.speed timestamp:onelocation.timestamp];
    
    // 测绘院纠偏 start
//    CLLocation *reLocation = nil;
//    unsigned int cn_lng = 0;
//    unsigned int cn_lat = 0;
//    unsigned int result = wgtochina_lb(0, onelocation.coordinate.longitude, onelocation.coordinate.latitude, 0, 0, 0, &cn_lng, &cn_lat);
//    if (result == 0) {
//        CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(cn_lat, cn_lng);
//        reLocation  = [[CLLocation alloc] initWithCoordinate:coor altitude:onelocation.altitude horizontalAccuracy:onelocation.horizontalAccuracy verticalAccuracy:onelocation.verticalAccuracy course:onelocation.course speed:onelocation.speed timestamp:onelocation.timestamp];
//    } else {
//        return;
//    }
    // 测绘院纠偏 end
        
    if ([self.delegate respondsToSelector:@selector(locationManager:didUpdateLocation:)]) {

        [self.delegate locationManager:self didUpdateLocation:reLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(locationManager:didFailWithError:)]) {
        [self.delegate locationManager:self didFailWithError:error];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
     CLLocation *tempOldLocation =[[CLLocation alloc] initWithCoordinate:[EvilTransform transForm:oldLocation.coordinate] altitude:oldLocation.altitude horizontalAccuracy:oldLocation.horizontalAccuracy verticalAccuracy:oldLocation.verticalAccuracy timestamp:oldLocation.timestamp];
    
     CLLocation *tempNewLocation =[[CLLocation alloc] initWithCoordinate:[EvilTransform transForm:newLocation.coordinate] altitude:newLocation.altitude horizontalAccuracy:newLocation.horizontalAccuracy verticalAccuracy:newLocation.verticalAccuracy timestamp:newLocation.timestamp];
    
    if ([self.delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
        [self.delegate locationManager:self didUpdateToLocation:tempNewLocation fromLocation:tempOldLocation];
    }
}

-(void) startSimulatingLocation
{
    tmpLat = 30.550945;
    tmpLon = 104.067117;
    simuTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

-(void) stopSimulatingLocation
{
    [simuTimer invalidate];
}

-(void)timerAction
{
    tmpLat += 0.0004;
//    tmpLon -= 0.0002;
    
    CLLocationCoordinate2D cor = CLLocationCoordinate2DMake(tmpLat, tmpLon);
    CLLocation *loc = [[CLLocation alloc] initWithCoordinate:cor altitude:100 horizontalAccuracy:5 verticalAccuracy:5 course:0 speed:((arc4random() % 10) + 1) timestamp:[[NSDate alloc] init]];
    
    [self locationManager:nil didUpdateLocations:[[NSArray alloc] initWithObjects:loc, nil]];
}


#pragma mark - Heading Protocal
-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if (newHeading.headingAccuracy < 0)
    {
        return;
    }
    
    // Use the true heading if it is valid.
    CLLocationDirection  theHeading = ((newHeading.trueHeading > 0) ? newHeading.trueHeading : newHeading.magneticHeading);
    [self.delegate locationManager:manager didUpdateHeading:theHeading];
}

#pragma mark - 
+(void) tenPoints
{
    CLLocationCoordinate2D coor0 = CLLocationCoordinate2DMake(30.55284728, 104.06723237);
    CLLocationCoordinate2D coor1 = CLLocationCoordinate2DMake(30.55155919, 104.06724823);
    CLLocationCoordinate2D coor2 = CLLocationCoordinate2DMake(30.55248185, 104.06719244);
    CLLocationCoordinate2D coor3 = CLLocationCoordinate2DMake(30.55350387, 104.06717498);
    CLLocationCoordinate2D coor4 = CLLocationCoordinate2DMake(30.55352196, 104.06819100);
    CLLocationCoordinate2D coor5 = CLLocationCoordinate2DMake(30.55352066, 104.06904763);
    CLLocationCoordinate2D coor6 = CLLocationCoordinate2DMake(30.55297021, 104.06910752);
    CLLocationCoordinate2D coor7 = CLLocationCoordinate2DMake(30.55249675, 104.06910333);
    CLLocationCoordinate2D coor8 = CLLocationCoordinate2DMake(30.55194901, 104.06908127);
    CLLocationCoordinate2D coor9 = CLLocationCoordinate2DMake(30.55205205, 104.06822998);
    
    CLLocationCoordinate2D _coor0 = [EvilTransform transForm:coor0];
    CLLocationCoordinate2D _coor1 = [EvilTransform transForm:coor1];
    CLLocationCoordinate2D _coor2 = [EvilTransform transForm:coor2];
    CLLocationCoordinate2D _coor3 = [EvilTransform transForm:coor3];
    CLLocationCoordinate2D _coor4 = [EvilTransform transForm:coor4];
    CLLocationCoordinate2D _coor5 = [EvilTransform transForm:coor5];
    CLLocationCoordinate2D _coor6 = [EvilTransform transForm:coor6];
    CLLocationCoordinate2D _coor7 = [EvilTransform transForm:coor7];
    CLLocationCoordinate2D _coor8 = [EvilTransform transForm:coor8];
    CLLocationCoordinate2D _coor9 = [EvilTransform transForm:coor9];
    
    [self persistGPSHistory:_coor0];
    [self persistGPSHistory:_coor1];
    [self persistGPSHistory:_coor2];
    [self persistGPSHistory:_coor3];
    [self persistGPSHistory:_coor4];
    [self persistGPSHistory:_coor5];
    [self persistGPSHistory:_coor6];
    [self persistGPSHistory:_coor7];
    [self persistGPSHistory:_coor8];
    [self persistGPSHistory:_coor9];
}

+ (void)persistGPSHistory:(CLLocationCoordinate2D)coor
{
    // Here you set your appending text.
    NSString *yourAppendingText = [NSString stringWithFormat:@"%f:%f\n", coor.latitude, coor.longitude];
    NSLog(@"Persist Point:%f : %f", coor.latitude, coor.longitude);
    
    // Here you get access to the file in Documents directory of your application bundle.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [paths objectAtIndex:0];
    NSString *documentFile = [documentDir stringByAppendingPathComponent:@"tenPoints.txt"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:documentFile]) {
        
        NSData *contentData=[yourAppendingText dataUsingEncoding:NSUnicodeStringEncoding];
        if ([contentData writeToFile:documentFile atomically:YES]) {
            //            NSLog(@">>write ok.");
        }
    } else {
        // Here you read current existing text from that file
        NSString *textFromFile = [NSString stringWithContentsOfFile:documentFile encoding:NSUnicodeStringEncoding error:nil];
        // Here you append new text to the existing one
        NSString *textToFile = [textFromFile stringByAppendingString:yourAppendingText];
        // Here you save the updated text to that file
        if ([textToFile writeToFile:documentFile atomically:YES encoding:NSUnicodeStringEncoding error:nil]) {
            //            NSLog(@"OKOK!");
        }
    }
}

@end
