//
// Created by Pooja Shashidhar on 4/16/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoPubMediationLoggerConstants.h"


@interface MoPubMediationLogger : NSObject

- (instancetype)initWithNetworkType:(Network *)networkType AndAdFormat:(AdFormat *)adFormat;

- (void)log:(NSString *)event;

@end




