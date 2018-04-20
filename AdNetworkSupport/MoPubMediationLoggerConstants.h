//
// Created by Pooja Shashidhar on 4/17/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MoPubMediationLoggerConstants : NSObject
//@property (nonatomic, strong) NSDictionary *eventDictionary;
 typedef enum {
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


 typedef enum {
    Banner,
    Interstitial,
    RewardedVideo,
    Native
} AdFormat;

 typedef enum {
    AD_REQUESTED,
    AD_ERROR,
    AD_UNAVAILABLE,
    AD_WILLSHOW,
    AD_SHOWN,
    AD_LOADED,
    AD_IMPRESSED,
    AD_CLICKED,
    AD_DISMISSED,
    AD_WILLDISMISS,
    AD_EXPIRED,
    AD_COMPLETED
} Event;


#define kEventArray @"Requested.", @"Error. Check logs for the error's details.", @"Not loaded/cached. Try again.", @" Will show the ad.", @"Now playing/showing.", @"Cached/Loaded.", @"Logged an impression.",@"Clicked.",@"Dismissed.", @"Will dissis the ad.",@"Expired",@"Completed playing.", nil

-(NSString *) EventTypeEnumToString:(Event)enumVal;
-(Event) EventTypeStringToEnum:(NSString*)strVal;
@end
/*
@"Requested.",@"Not loaded/cached. Try again.",@"Cached/Loaded.",@"Logged an impression.",@"Clicked.",@"Dismissed.",
@"Completed playing. Rewarded the user.",@"Destroyed.",@"Error. Check logs for the error's details.",@"Expired",@"Cleaned up.",@"Now playing/showing." };
*/
