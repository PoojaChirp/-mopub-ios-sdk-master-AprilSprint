//
// Created by Pooja Shashidhar on 4/17/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MoPubMediationLoggerConstants : NSObject

static typedef enum {
    AdColony,
    AppLovin,
    AdMob,
    Chartboost,
    Facebook,
    Flurry,
    IronSource,
    OneByAOL,
    Tapjoy,
    UnityAds,
    Vungle
} Network;


static typedef enum {
    Banner,
    Interstitial,
    RewardedVideo,
    Native
}AdFormat;
@end