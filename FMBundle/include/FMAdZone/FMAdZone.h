//
//  FMAdZone.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/5/17.
//  Copyright © 2017 Fractional Media. All rights reserved.

#ifndef FMAdZone_h
#define FMAdZone_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMAd.h"
#import "FMAdController.h"
#import "FMAdRequest.h"
#import "FMMessageDispatcher.h"
#import "FMMRAIDMessageHandler.h"
#import "FMLogMessageHandler.h"
#import "FMAdZoneDelegate.h"
#import "FMAdZoneViewDelegate.h"
#import "FMAdDelegate.h"
#import "FMRewardedVideoAdDelegate.h"
#import "FMVASTAdDelegate.h"
#import "FMAdZoneView.h"
#import "FMAdType.h"
#import "FMAdZoneReadyState.h"
#import "FMAdUnitIDValidator.h"
#import "FMSDKVersion.h"

@interface FMAdZone : NSObject

#pragma mark - Public

@property (weak, nonatomic) id<FMAdZoneDelegate> sdkDelegate;

@property (assign, nonatomic) BOOL started;

+ (id)sharedAdZone;

- (id)init;

- (void)startWithOptions: (NSDictionary * )options delegate:(id<FMAdZoneDelegate>)delegate;

- (FMAdType)adTypeWithString: (NSString *)adTypeName;

// Full-screen rewarded playable. WebView owned + managed
// by AdRequest
- (FMAdRequest *)rewardedWithAdUnitID:(NSString *)adUnitID delegate:(id<FMRewardedVideoAdDelegate>)delegate;

// Full-screen interstitial with playable. WebView owned + managed
// by AdRequest.
- (FMAdRequest *)interstitialWithAdUnitID:(NSString *)adUnitID delegate:(id<FMAdDelegate>)delegate;

// Full-screen VAST playable. WebView owned + managed by AdRequest.
- (FMAdRequest *)vastWithAdUnitID:(NSString *)adUnitID delegate:(id<FMVASTAdDelegate>)delegate;

// Banner with specific size.
// AdRequest modifies but does not own specified WebView.
- (FMAdZoneView *)bannerWithAdUnitID:(NSString *)adUnitID delegate:(id<FMAdZoneViewDelegate>)delegate;

// Leaderboard ().
// AdRequest modifies but does not own specified WebView.
- (FMAdZoneView *)leaderboardWithAdUnitID:(NSString *)adUnitID delegate:(id<FMAdZoneViewDelegate>)delegate;

// Medium Rectangle () ad
// AdRequest modifies but does not own specified WebView.
- (FMAdZoneView *)mrectWithAdUnitID:(NSString *)adUnitID delegate:(id<FMAdZoneViewDelegate>)delegate;

// Skyscraper () ad
// AdRequest modifies but does not own specified WebView.
- (FMAdZoneView *)skyscraperWithAdUnitID:(NSString *)adUnitID delegate:(id<FMAdZoneViewDelegate>)delegate;

- (BOOL)requiredResourcesPresent;

- (void)precacheAd: (NSString *)adZoneID;


- (void)loadResources;

// Get the SDK's status.
- (FMAdZoneReadyState)readyState;

+ (NSString *)version;


# pragma mark - Private
- (FMAdRequest *)loadWithAdUnitID:(NSString *)adUnitID webView:(id)webView adType:(FMAdType)adType delegate:(id)delegate;
// Fullscreen

- (FMAdRequest*)fullScreenWithAdUnitID:(NSString *)adUnitID adType:(FMAdType)adType delegate:(id)delegate;
@end


#endif /* FMAdZone_h */
