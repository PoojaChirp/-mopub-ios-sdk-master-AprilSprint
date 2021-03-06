//
// Created by Pooja Shashidhar on 4/16/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MoPubMediationLogger.h"
#import "MPLogging.h"


@interface MoPubMediationLogger ()
@property(nonatomic) NSString *NETWORK_TYPE;
@property(nonatomic) NSString *ADFORMAT_TYPE;
@property(nonatomic) Event EVENT_TYPE;

@end

@implementation MoPubMediationLogger


NSDictionary *eventDictionary = nil;
NSDictionary *networkDictionary = nil;
NSDictionary *adFormatDictionary = nil;

NSArray *adFormatArray = nil;

// Type A implementation: Fetch network name and ad format directly from network adapter
// Simple and elegant solution as the details are fetched during network intialization. Adaption of the code is also made easy
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

//Type B implementation: Fetch network name and ad format from parsing the class names from the adapter
// This process of fetching data is cumbersome and requires to build parsing logic
-(instancetype)initWithClassName:(NSString *)className
{
    
    self = [super init];

    if(self)
    {
        [MoPubMediationLogger load];
        [self parseSdkAndAdFormat:className];
    }
    return self;
}

-(void)parseSdkAndAdFormat:(NSString *)className
{
    for(NSString * item in adFormatArray){
        NSArray *substrings = [className componentsSeparatedByString:item];
        if(substrings.count==2){
            self.NETWORK_TYPE= [substrings objectAtIndex:0];
            self.ADFORMAT_TYPE=item;
            break;
        }
    }
    if(!self.NETWORK_TYPE){
          self.NETWORK_TYPE = @"Unknown Network";
    }
    if(!self.ADFORMAT_TYPE){
        self.ADFORMAT_TYPE = @"Unknown Adformat ";
    }
}

//Logger method to log the details such as network name, ad format and callback information
- (void)log :(Event) eventKey
{
    MPLogInfo(@"%@-%@-%@", self.NETWORK_TYPE,self.ADFORMAT_TYPE,eventDictionary[@(eventKey)]);
    
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
                        @(AD_WILLDISMISS) : @"Will dismiss the ad.",
                        @(AD_EXPIRED) : @"Expired",
                        @(AD_COMPLETED) : @"Completed playing."
                        };
    
    networkDictionary = @{
                          @(AdColony) : @"AdColony",
                          @(AppLovin): @"AppLovin",
                          @(AdMob) : @"AdMob",
                          @(Chartboost) : @"Chartboost",
                          @(Facebook) : @"FacebookAudienceNetwork",
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
    
    adFormatArray = @[@"Banner",  @"Interstitial",  @"RewardedVideo",  @"Native"];
}

@end

