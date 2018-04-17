//
//  FMAdRequestState.h
//  FMAdZone
//
//  Created by Nicholas Jones on 8/30/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdRequestState_h
#define FMAdRequestState_h

// Publicly readable but not writable. Indicates when it's
//safe to show the ad.
typedef NS_ENUM(NSInteger, FMAdRequestState) {
    FMAdRequestStateInitializing,
    FMAdRequestStateLoading,
    FMAdRequestStateReadyToShow,
    FMAdRequestStateShown,
    FMAdRequestStateFailed
};

#endif /* FMAdRequestState_h */
