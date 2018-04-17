//
//  FMLogLevel.h
//  FMAdZone
//
//  Created by Nicholas Jones on 8/30/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMLogLevel_h
#define FMLogLevel_h

typedef NS_ENUM(NSInteger, FMLogLevel) {
    FMLogLevelDebug = 5,
    FMLogLevelLog = 4,
    FMLogLevelInfo  = 3,
    FMLogLevelWarning  = 2,
    FMLogLevelError = 1,
    FMLogLevelOff = 0
};

#endif /* FMLogLevel_h */
