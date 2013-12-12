//
//  JSONResponseFactory.m
//  tfsp_rc
//
//  Created by Xukj on 3/25/13.
//
//

#import "JSONResponseFactory.h"
#import "ITSConfig.h"

@implementation JSONResponseFactory

-(id<ITSResponseDelegate>)decode:(NSData *)source tag:(id)tag
{
    id<ITSResponseDelegate> response = [self decodeDataToResponse:source tag:tag];
    
    BOOL decodeResult = NO;
    if (response) {
        decodeResult = [response decode];
    }
    
    return decodeResult ? response : nil;
}

-(id<ITSResponseDelegate>)decodeDataToResponse:(NSData *)source tag:(id)tag
{
    id<ITSResponseDelegate> response = nil;
    
    NSUInteger responseTag = [(NSNumber *)tag unsignedIntegerValue];
    switch (responseTag) {

        default:
            break;
    }
    
    return response;
}

@end
