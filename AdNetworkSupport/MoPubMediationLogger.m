//
// Created by Pooja Shashidhar on 4/16/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MoPubMediationLoggerConstants.h"
#import "MoPubMediationLogger.h"


//NSInteger const count = 0;
@interface MoPubMediationLogger ()
@property(nonatomic) Network *NETWORK_TYPE;
@property(nonatomic) AdFormat *ADFORMAT_TYPE;
@property (nonatomic)Event *EVENT_TYPE;
@property(nonatomic,strong) MoPubMediationLoggerConstants *logger;
@end

@implementation MoPubMediationLogger


-(instancetype)initWithNetworkType: (Network *)networkType  AndAdFormat:(AdFormat *)adFormat AndEvent: (Event *)event {

    self = [super init];
    if(self)
    {
        self.NETWORK_TYPE=networkType;
        self.ADFORMAT_TYPE=adFormat;
        [self.logger EventTypeEnumToString:*event];
    }
    return self;
}

- (void)log:(NSString *)message
{
    NSLog(@"%@-%@-%@", self.NETWORK_TYPE,self.ADFORMAT_TYPE,self.logger);
    
}






@end

