//
//  FMBannerCustomEvent.h
//  FMAdZoneMoPubAdapter
//
//  Copyright © 2018 Fractional Media. All rights reserved.
//

#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#else
#import "MPBannerCustomEvent.h"
#endif

#import "FMAdZone.h"
#import "FMUtilities.h"
#import "MPInstanceProvider.h"
#import "MPLogging.h"

@interface FMBannerCustomEvent : MPBannerCustomEvent <FMAdZoneDelegate, FMAdZoneViewDelegate>

@property (strong, nonatomic) FMAdZoneView *adZoneView;

@end
