//
//  MoPub.h
//  MoPub
//
//  Copyright (c) 2014 MoPub. All rights reserved.
//

#import "MPConstants.h"

#import "MOPUBDisplayAgentType.h"
#import "MPAdConversionTracker.h"
#import "MPAdvancedBidder.h"
#import "MPAdView.h"
#import "MPBannerCustomEvent.h"
#import "MPBannerCustomEventDelegate.h"
#import "MPGlobal.h"
#import "MPIdentityProvider.h"
#import "MPInterstitialAdController.h"
#import "MPInterstitialCustomEvent.h"
#import "MPInterstitialCustomEventDelegate.h"
#import "MPLogging.h"
#import "MPLogLevel.h"
#import "MPLogProvider.h"
#import "MPMediationSdkInitializable.h"
#import "MPMediationSettingsProtocol.h"
#import "MPMoPubConfiguration.h"
#import "MPRewardedVideo.h"
#import "MPRewardedVideoReward.h"
#import "MPRewardedVideoCustomEvent.h"
#import "MPRewardedVideoCustomEvent+Caching.h"
#import "MPRewardedVideoError.h"
#import "MPViewabilityAdapter.h"
#import "MPViewabilityOption.h"

#if MP_HAS_NATIVE_PACKAGE
#import "MPNativeAd.h"
#import "MPNativeAdAdapter.h"
#import "MPNativeAdConstants.h"
#import "MPNativeCustomEvent.h"
#import "MPNativeCustomEventDelegate.h"
#import "MPNativeAdError.h"
#import "MPNativeAdRendering.h"
#import "MPNativeAdRequest.h"
#import "MPNativeAdRequestTargeting.h"
#import "MPCollectionViewAdPlacer.h"
#import "MPTableViewAdPlacer.h"
#import "MPClientAdPositioning.h"
#import "MPServerAdPositioning.h"
#import "MPNativeAdDelegate.h"
#import "MPStaticNativeAdRendererSettings.h"
#import "MPNativeAdRendererConfiguration.h"
#import "MPNativeAdRendererSettings.h"
#import "MPNativeAdRenderer.h"
#import "MPStaticNativeAdRenderer.h"
#import "MOPUBNativeVideoAdRendererSettings.h"
#import "MOPUBNativeVideoAdRenderer.h"
#import "MPNativeAdRenderingImageLoader.h"
#import "MPStreamAdPlacer.h"
#endif

// Import these frameworks for module support.
#import <AdSupport/AdSupport.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import <StoreKit/StoreKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <UIKit/UIKit.h>

#define MoPubKit [MoPub sharedInstance]

NS_ASSUME_NONNULL_BEGIN

@interface MoPub : NSObject

/**
 * Returns the MoPub singleton object.
 *
 * @return The MoPub singleton object.
 */
+ (MoPub * _Nonnull)sharedInstance;

/**
 * A Boolean value indicating whether the MoPub SDK should use Core Location APIs to automatically
 * derive targeting information for location-based ads.
 *
 * When set to NO, the SDK will not attempt to determine device location. When set to YES, the
 * SDK will periodically try to listen for location updates in order to request location-based ads.
 * This only occurs if location services are enabled and the user has already authorized the use
 * of location services for the application. The default value is YES.
 *
 * @return A Boolean value indicating whether the SDK should listen for location updates.
 */
@property (nonatomic, assign) BOOL locationUpdatesEnabled;

/**
 * A Boolean value indicating whether the MoPub SDK should create a MoPub ID that can be used
 * for frequency capping when Limit ad tracking is on & the IDFA we get is
 * 00000000-0000-0000-0000-000000000000.
 *
 * When set to NO, the SDK will not create a MoPub ID in the above case. When set to YES, the
 * SDK will generate a MoPub ID. The default value is YES.
 *
 */
@property (nonatomic) BOOL frequencyCappingIdUsageEnabled;

/**
 * Forces the usage of WKWebView (if able).
 */
@property (nonatomic, assign) BOOL forceWKWebView;

/**
 * SDK log level. The default value is `MPLogLevelInfo`.
 */
@property (nonatomic, assign) MPLogLevel logLevel;

/**
 * A boolean value indicating whether advanced bidding is enabled. This boolean defaults to `YES`.
 * To disable advanced bidding, set this value to `NO`.
 */
@property (nonatomic, assign) BOOL enableAdvancedBidding;

/**
 * Initializes the MoPub SDK asynchronously on a background thread.
 * @remark This should be called from the app's `application:didFinishLaunchingWithOptions:` method.
 * @param configuration Required SDK configuration options.
 * @param completionBlock Optional completion block that will be called when initialization has completed.
 */
- (void)initializeSdkWithConfiguration:(MPMoPubConfiguration * _Nonnull)configuration
                            completion:(void(^_Nullable)(void))completionBlock;

/**
 * Retrieves the global mediation settings for a given class type.
 *
 * @param aClass The type of mediation settings object you want to receive from the collection.
 */
- (id<MPMediationSettingsProtocol> _Nullable)globalMediationSettingsForClass:(Class)aClass;

- (NSString * _Nonnull)version;
- (NSString * _Nonnull)bundleIdentifier;

/**
 * Default is MOPUBDisplayAgentTypeInApp = 0.
 *
 * If displayType is set to MOPUBDisplayAgentTypeNativeSafari = 1, http/https clickthrough URLs are opened in native
 * safari browser.
 * If displayType is set to MOPUBDisplayAgentTypeSafariViewController = 2, http/https clickthrough URLs are opened in
 * SafariViewController.
 *
 */
- (void)setClickthroughDisplayAgentType:(MOPUBDisplayAgentType)displayAgentType;

/**
 * Disables viewability measurement via the specified vendor(s) for the rest of the app session. A given vendor cannot
 * be re-enabled after being disabled.
 *
 * @param vendors The viewability vendor(s) to be disabled. This is a bitmask value; ORing vendors together is okay.
 */
- (void)disableViewability:(MPViewabilityOption)vendors;

@end

@interface MoPub (Mediation)
/**
 * Retrieves all currently cached mediated networks.
 * @return A list of all cached networks or @c nil.
 */
- (NSArray<Class<MPMediationSdkInitializable>> * _Nullable)allCachedNetworks;

/**
 * Clears all currently cached mediated networks.
 */
- (void)clearCachedNetworks;

@end

NS_ASSUME_NONNULL_END
