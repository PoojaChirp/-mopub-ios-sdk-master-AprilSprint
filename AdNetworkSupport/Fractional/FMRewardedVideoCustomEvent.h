//
//  FMRewardedVideoCustomEvent.h
//  FMAdZoneMoPubAdapter
//
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMRewardedVideoCustomEvent_h
#define FMRewardedVideoCustomEvent_h

#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#else
#import "MPRewardedVideoCustomEvent.h"
#endif

#import "FMAdZone.h"
#import "MPRewardedVideoReward.h"
#import "MPLogging.h"

@interface FMRewardedVideoCustomEvent : MPRewardedVideoCustomEvent <FMAdZoneDelegate,FMRewardedVideoAdDelegate>

@property (strong, nonatomic) FMAdRequest *adRequest;

@end

#endif /* FMRewardedVideoCustomEvent_h */
