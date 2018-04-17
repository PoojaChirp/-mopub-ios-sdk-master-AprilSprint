//
//  FMDelegateMessenger.h
//  FMAdZone
//
//  Created by Mike Brich on 8/17/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMDelegateHandler_h
#define FMDelegateHandler_h

#import "FMError.h"
#import "FMAdDelegate.h"
#import "FMVASTAdDelegate.h"
#import "FMRewardedVideoAdDelegate.h"
#import "FMAdZoneView.h"
#import "FMAdEventType.h"

@interface FMDelegateMessenger : NSObject

//FMAdDelegate + FMAdZoneViewDelegate
- (void)collapsedWithDelegate: (id)delegate adZoneView:(FMAdZoneView *)adZoneView;
- (void)expandedWithDelegate: (id)delegate adZoneView:(FMAdZoneView *)adZoneView;

- (void)loadedWithDelegate: (id)delegate adRequest:(FMAdRequest *)adRequest adZoneView:(FMAdZoneView *)adZoneView;
- (void)clickedWithDelegate: (id)delegate adRequest:(FMAdRequest *)adRequest adZoneView:(FMAdZoneView *)adZoneView;
- (void)shownWithDelegate: (id)delegate adRequest:(FMAdRequest *)adRequest adZoneView:(FMAdZoneView *)adZoneView;
- (void)closedWithDelegate: (id)delegate adRequest:(FMAdRequest *)adRequest adZoneView:(FMAdZoneView *)adZoneView;
- (void)failedWithDelegate: (id)delegate adRequest:(FMAdRequest *)adRequest adZoneView:(FMAdZoneView *)adZoneView;

//FMRewardedVideoAdDelegate
- (void)shouldRewardUserWithDelegate: (id)delegate adRequest:(FMAdRequest *)adRequest;

- (void)performSelectorWithName: (NSString const *)selectorName delegate:(id)delegate object:(id)object;
- (NSDictionary *)messageParametersForEvent:(FMAdEventType)event request:(FMAdRequest *)request adZoneView:(FMAdZoneView *)adZoneView;

@end

#endif /* FMDelegateHandler_h */
