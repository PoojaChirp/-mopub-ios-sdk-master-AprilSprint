//
//  FMLogger.h
//  FMAdZone
//
//  Created by Mike Brich on 8/4/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMLogger_h
#define FMLogger_h


#import <Foundation/Foundation.h>
#import "FMLogLevel.h"
#import "FMConfiguration.h"

@interface FMLogger : NSObject

+ (id)sharedLogger;
- (void)debugWithGroup:(NSString *)groupName message: (NSString *)format, ...;
- (void)infoWithGroup:(NSString *)groupName message: (NSString *)format, ...;
- (void)warningWithGroup:(NSString *)groupName message: (NSString *)format, ...;
- (void)errorWithGroup:(NSString *)groupName message: (NSString *)format, ...;
- (void)logWithGroup:(NSString *)groupName message: (NSString *)format, ...;

- (NSString *)logWithLevel:(FMLogLevel)logLevel group:(NSString *)groupName format:(NSString *)format, ...;
- (NSString *)logNameForLevel:(FMLogLevel)level;

- (void)invokeConsoleLogCallbackWithMessage:(NSString *)message forLevel:(NSString *)level;
@end

#endif /* FMLogger_h */
