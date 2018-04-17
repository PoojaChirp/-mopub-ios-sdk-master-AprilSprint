//
//  FMLogMessageHandler.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/4/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMLogMessageHandler_h
#define FMLogMessageHandler_h

#import <Foundation/Foundation.h>
#import "FMLogger.h"

@interface FMLogMessageHandler : NSObject

- (void)log: (NSMutableDictionary*)params;
- (void)info: (NSMutableDictionary*)params;
- (void)debug: (NSMutableDictionary*)params;
- (void)error: (NSMutableDictionary*)params;
- (void)warn: (NSMutableDictionary*)params;

- (NSString *)extractRawMessage:(NSDictionary *)params;
@end

#endif /* FMLogMessageHandler_h */
