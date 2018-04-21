//
// Created by Pooja Shashidhar on 4/16/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MoPubMediationLogger.h"


@interface MoPubMediationLogger ()
@property(nonatomic) Network NETWORK_TYPE;
@property(nonatomic) AdFormat ADFORMAT_TYPE;
@property (nonatomic)Event EVENT_TYPE;

@end

@implementation MoPubMediationLogger


NSDictionary *eventDictionary = nil;

-(instancetype)initWithNetworkType: (Network)networkType  AndAdFormat:(AdFormat)adFormat
{

    self = [super init];
    if(self)
    {
        self.NETWORK_TYPE=networkType;
        self.ADFORMAT_TYPE=adFormat;
        
    }
    return self;
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
}

@end

