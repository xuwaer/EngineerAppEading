//
//  MKNetworkOperationExt.h
//  MtGoxClient
//
//  Created by xukj on 13-10-11.
//  Copyright (c) 2013年 tosc-its. All rights reserved.
//

#import "MKNetworkOperation.h"

@interface MKNetworkOperationExt : MKNetworkOperation

@property (nonatomic, strong) id userinfo;
@property (nonatomic, strong) NSDictionary *requestinfo;
@property (nonatomic, assign) NSUInteger tag;

@end
