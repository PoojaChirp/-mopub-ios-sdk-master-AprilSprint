//
//  FMInterstitialCustomEvent.h
//  AdZone-iOS-SDK
//
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMInterstitialCustomEvent_h
#define FMInterstitialCustomEvent_h

#if __has_include(<MoPub/MoPub.h>)
    #import <MoPub/MoPub.h>
#else
    #import "MPInterstitialCustomEvent.h"
#endif


#import "FMAdZone.h"
#import "MPLogging.h"

@interface FMInterstitialCustomEvent  : MPInterstitialCustomEvent <FMAdZoneDelegate, FMAdDelegate>
@property (strong, nonatomic) FMAdRequest *adRequest;
@end

#endif /* FMInterstitialCustomEvent_h */
