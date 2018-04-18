//
// Created by Pooja Shashidhar on 4/16/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//

#import "MoPubMediationLogger.h"
#import "MoPubMediationLoggerConstants.h"


@interface MoPubMediationLogger ()
@property(nonatomic) Network *NETWORK_TYPE;
@property(nonatomic) AdFormat *ADFORMAT_TYPE;
@end

@implementation MoPubMediationLogger





id objects[] = { @"Requested.",@"Not loaded/cached. Try again.",@"Cached/Loaded.",@"Logged an impression.",@"Clicked.",@"Dismissed.", @"Completed playing. Rewarded the user.",@"Destroyed.",@"Error. Check logs for the error's details.",@"Expired",@"Cleaned up.",@"Now playing/showing." };
    id keys[] = { @"AD_REQUESTED", @"AD_UNAVAILABLE", @"AD_LOADED", @"AD_IMPRESSED", @"AD_CLICKED",@"AD_DISMISSED",@"AD_COMPLETED",@"AD_DESTROYED",@"AD_ERROR",@"AD_EXPIRED",@" AD_INVALIDATED",@"  AD_SHOWN" };
    const NSUInteger count = sizeof(objects) / sizeof(id);
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects
                                                           forKeys:keys
                                                             count:count];


-(instancetype)initWithNetworkType: (Network *)networkType  AndAdFormat:(AdFormat *)adFormat  {

    self = [super init];
    if(self)
    {
        self.NETWORK_TYPE=networkType;
        self.ADFORMAT_TYPE=adFormat;
    }
    return self;
}



- (void)log: (NSString *) event {

    NSLog(@"%@-%@-%@", self.NETWORK_TYPE, self.ADFORMAT_TYPE, [dictionary objectForKey:event]);

}



@end

