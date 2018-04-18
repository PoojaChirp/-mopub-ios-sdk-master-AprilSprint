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
} AdFormat;

static typedef enum {
    AD_REQUESTED,
    AD_UNAVAILABLE,
    AD_LOADED,
    AD_IMPRESSED,
    AD_CLICKED,
    AD_DISMISSED,
    AD_COMPLETED,
    AD_DESTROYED,
    AD_ERROR,
    AD_EXPIRED,
    AD_INVALIDATED,
    AD_SHOWN
} Event;



@end
/*
@"Requested.",@"Not loaded/cached. Try again.",@"Cached/Loaded.",@"Logged an impression.",@"Clicked.",@"Dismissed.",
@"Completed playing. Rewarded the user.",@"Destroyed.",@"Error. Check logs for the error's details.",@"Expired",@"Cleaned up.",@"Now playing/showing." };
