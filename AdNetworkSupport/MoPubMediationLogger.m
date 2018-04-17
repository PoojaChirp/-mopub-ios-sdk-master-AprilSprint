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

@implementation MoPubMediationLogger {


}


-(instancetype)initWithNetworkType: (Network *)networkType  AndAdFormat:(AdFormat *)adFormat  {

    self = [super init];
    if(self)
    {
        self.NETWORK_TYPE=networkType;
        self.ADFORMAT_TYPE=adFormat;
    }
    return self;
}




@end

