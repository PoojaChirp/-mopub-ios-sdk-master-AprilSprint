//
//  MPMoPubConfiguration.h
//  MoPubSampleApp
//
//  Copyright © 2017 MoPub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPAdvancedBidder.h"
#import "MPMediationSdkInitializable.h"
#import "MPMediationSettingsProtocol.h"
#import "MPRewardedVideo.h"

NS_ASSUME_NONNULL_BEGIN

@interface MPMoPubConfiguration : NSObject
/**
 List of advanced bidders to initialize.
 */
@property (nonatomic, strong, nullable) NSArray<Class<MPAdvancedBidder>> * advancedBidders;

/**
 Global configurations for all ad networks your app supports.
 */
@property (nonatomic, strong, nullable) NSArray<id<MPMediationSettingsProtocol>> * globalMediationSettings;

/**
 List of mediated network SDKs to pre-initialize from the cache. If the mediated network
 SDK has no cache entry, nothing will be done. If set to @c nil or empty array, no network
 SDKs will be preinitialized.
 
 To initialize all existing cached networks use @c MoPub.sharedInstance.allCachedNetworks
 */
@property (nonatomic, strong, nullable) NSArray<Class<MPMediationSdkInitializable>> * mediatedNetworks;

@end

NS_ASSUME_NONNULL_END
