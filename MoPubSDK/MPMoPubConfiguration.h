//
//  MPMoPubConfiguration.h
//  MoPubSampleApp
//
//  Copyright © 2017 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPAdvancedBidder.h"

@interface MPMoPubConfiguration : NSObject
/**
 * List of advanced bidders to initialize.
 */
@property (nonatomic, strong) NSArray<Class<MPAdvancedBidder>> * advancedBidders;

@end
