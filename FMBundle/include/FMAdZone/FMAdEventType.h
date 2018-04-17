//
//  FMAdEventType.h
//  FMAdZone
//
//  Created by Nicholas Jones on 8/30/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdEventType_h
#define FMAdEventType_h

typedef NS_ENUM(NSInteger, FMAdEventType) {
    FMAdEventTypeLoaded,
    FMAdEventTypeFailed,
    FMAdEventTypeClosed,
    FMAdEventTypeShown,
    FMAdEventTypeExpanded,
    FMAdEventTypeCollapsed,
    FMAdEventTypeShouldRewardUser,
    FMAdEventTypeClicked
};

#endif /* FMAdEventType_h */
