//
// Created by Pooja Shashidhar on 4/16/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MoPubMediationLogger.h"


@interface MoPubMediationLogger ()
@property(nonatomic) NSString *NETWORK_TYPE;
@property(nonatomic) NSString *ADFORMAT_TYPE;
@property (nonatomic)Event EVENT_TYPE;

@end

@implementation MoPubMediationLogger


NSDictionary *eventDictionary = nil;
NSDictionary *networkDictionary = nil;
NSDictionary *adFormatDictionary = nil;

NSArray *adFormatArray = nil;

-(instancetype)initWithNetworkType: (Network)networkType  AndAdFormat:(AdFormat)adFormat
{

    self = [super init];
    if(self)
    {
        self.NETWORK_TYPE=networkDictionary[@(networkType)];
        self.ADFORMAT_TYPE=adFormatDictionary[@(adFormat)];
        
    }
    return self;
}

-(instancetype)initWithClassName:(NSString *)className
{
    
    self = [super init];
    if(self)
    {
        [self parseSdkAndAdFormat:className];
    }
    return self;
}

-(void)parseSdkAndAdFormat:(NSString *)className
{
    NSString *networkName = nil;
    NSString *adFormat = nil;
    for(NSString * item in adFormatArray){
        NSRange range = [className rangeOfString:item];
        if (range.location != NSNotFound) {
            adFormat = item;
            NSScanner *scan = [NSScanner scannerWithString:className];
            [scan scanUpToString:item intoString:&networkName];
        }
    }
    if(networkName){
        self.NETWORK_TYPE = networkName;
    }
    else{
        self.NETWORK_TYPE = @"UNKOWN NETWORK";
    }
    
    if(adFormat){
        self.ADFORMAT_TYPE = networkName;
    }
    else{
        self.ADFORMAT_TYPE = @"UNKOWN AD Format";
    }
}

- (void)log :(Event) eventKey
{
    NSLog(@"%@-%@-%@", self.NETWORK_TYPE,self.ADFORMAT_TYPE,eventDictionary[@(eventKey)]);
    
}

+ (void) load
{
    eventDictionary = @{
                        @(AD_REQUESTED) : @"Requested.",
                        @(AD_ERROR) : @"Error. Check logs for the error's details.",
                        @(AD_UNAVAILABLE) : @"Not loaded/cached. Try again.",
                        @(AD_WILLSHOW) : @" Will show the ad.",
                        @(AD_SHOWN) : @"Now playing/showing.",
                        @(AD_LOADED) : @"Cached/Loaded.",
                        @(AD_IMPRESSED) : @"Logged an impression.",
                        @(AD_CLICKED) : @"Clicked.",
                        @(AD_DISMISSED) : @"Dismissed.",
                        @(AD_WILLDISMISS) : @"Will dissis the ad.",
                        @(AD_EXPIRED) : @"Expired",
                        @(AD_COMPLETED) : @"Completed playing."
                        };
    
    networkDictionary = @{
                          @(AdColony) : @"AdColony",
                          @(AppLovin): @"AppLovin",
                          @(AdMob) : @"AdMob",
                          @(Chartboost) : @"Chartboost",
                          @(Facebook) : @"Facebook",
                          @(Flurry) : @"Flurry",
                          @(IronSource) : @"IronSource",
                          @(OneByAOL) : @"OneByAOL",
                          @(Tapjoy) : @"Tapjoy",
                          @(UnityAds) : @"UnityAds",
                          @(Vungle) : @"Vungle"
                          };
    
    adFormatDictionary =@{
                          @(Banner) :@"Banner",
                          @(Interstitial):@"Interstitial",
                          @(RewardedVideo):@"RewardedVideo",
                          @(Native):@"Native"
                          };
    
    adFormatArray = @[@"Banner",  @"Interstitial",  @"RewardedVideo",  @"Native",  @"Base",  @"CustomEvent", @"AdRenderer",  @"Utils",  @"Router", @"Listener",  @"AgentWrapper",  @"Shared"];
}

@end

