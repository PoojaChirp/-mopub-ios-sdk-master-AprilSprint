//
//  FMRewardedVideoAdDelegate.h
//  FMAdZone
//
//  Created by Mike Brich on 8/9/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMRewardedAdDelegate_h
#define FMRewardedAdDelegate_h

#import <Foundation/Foundation.h>
#import "FMAdDelegate.h"

@protocol FMRewardedVideoAdDelegate <FMAdDelegate>

@required
- (void)adZoneAdShouldRewardUser: (FMAdRequest *)adRequest;

@end

#endif /* FMRewardedVideoAdDelegate_h */
