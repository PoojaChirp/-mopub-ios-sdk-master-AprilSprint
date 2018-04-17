//
//  FMAd.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 6/27/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAd_h
#define FMAd_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMAdController.h"
#import "FMMessageDispatcher.h"
#import "FMMRAIDMessageHandler.h"
#import "FMMessageHandler.h"
#import "FMLogMessageHandler.h"
#import "FMAdResponseProcessor.h"
#import "FMUtilities.h"
#import "FMDelegateMessenger.h"
#import "FMAdType.h"
#import "FMAdRequestState.h"
#import "FMLogger.h"
#import "FMFullScreenAd.h"
#import "FMDisplayAd.h"
#import "FMUserInteractionRecognizer.h"


@class FMAdRequest;

@interface FMAd : NSObject<UIWebViewDelegate>

#pragma mark Variables
// WebView used by the ad request.
// Owned by ad.
@property (strong, nonatomic) UIWebView *webView;

@property (assign, nonatomic) BOOL rewardFired;
// Delay (in seconds) before shouldRewardUser is fired.
// Starts counting after show is called.
@property (assign, nonatomic) NSInteger rewardDelay;

// Holds the current MRAID state.
@property (strong, nonatomic) FMMRAIDState *mraidState;

// 
@property (strong, nonatomic) FMLogMessageHandler *logMessageHandler;

@property (strong, nonatomic) FMDelegateMessenger *delegateMessenger;

//
@property (strong, nonatomic) FMMRAIDMessageHandler *mraidMessageHandler;

@property (assign, nonatomic) FMAdType adType;
// Handles event execution + callbacks for all
// events during the ad.
// Owned by ad.
@property (strong, nonatomic) FMMessageDispatcher *dispatcher;

// Flag indicating whether ad succesfully loaded.
// Owned by ad.
@property (assign, nonatomic) BOOL adLoaded;

// Flag indicating whether ad was a failLoad.
@property (assign, nonatomic) BOOL adLoadFailed;

// Flag indicating whether user has closed ad.
@property (assign, nonatomic) BOOL adClosed;

// Flag indicating whether user has shown ad.
@property (assign, nonatomic) BOOL adShown;

// Intended width of the ad.
@property (assign, nonatomic) CGFloat adWidth;

@property (assign, nonatomic) CGFloat adHeight;

// Flag indicating whether ad needs full screen mode.
@property (assign, nonatomic) BOOL isFullScreen;

// View Controller used to display full screen ads.
// Not used by banners and other partial screen ads.
@property (strong, nonatomic) FMAdController *adController;

@property (assign, nonatomic) FMAdRequestState requestState;

@property (weak , nonatomic) FMAdRequest *adRequest;

@property (weak , nonatomic) id delegate;

// Reference  to an internal implementation of
// FMAdTypeDelegate protocol to hold specific logic relating to
// ad type. The protocol methods are invoke during times when the
// FMAd instance needs to resolve logic specific to an ad type.
@property (strong, nonatomic) id<FMAdTypeDelegate> adTypeDelegate;

// The parent view of a display type ad not in the expanded state.
// We need to keep a reference to the parent view of the webview (FMAdZoneView)
// so that when we come back from the expanded state we can remove the webview from the ad controller view heirarchy
// that was displaying the add full screen back into the non expanded state to show in the correct size per ad type
@property (weak, nonatomic) FMAdZoneView *webViewParent;

// The view controller that the pub passed into the show method
@property (weak, nonatomic) UIViewController *presenterVC;

// Flag indicating that we are currently presenting a FMDestinationViewController
@property (assign, nonatomic) BOOL linkOpen;

#pragma mark Methods



// Default constructor (disabled, throws when called).
- (id)init;

// Custom Constructor
- (id)initWithWebView: (id)webView adRequest:(FMAdRequest*)adRequest adType: (FMAdType)adType delegate: (id)delegate;

- (void)load;

- (BOOL)canShowAd;

// Shows an already loaded ad which may not
// be visible.
- (void)show: (UIViewController*)viewController;

// Hide an already loaded ad.
- (void)hide;

// Request the ad unit abort all network requests and fire a
// failLoad event. May have no effect depending on ad state.
- (void)requestStopLoad;

// Start the countdown until a shouldRewardUser event is fired,
// if the ad type is rewarded.
- (void)startRewardTimer;

- (void)openURL:(NSDictionary *)params;

- (BOOL)openDestinationWithViewController:(UIViewController *)viewController parameters:(NSDictionary *)params;

#pragma mark - Configuration

// Configure the provided webView.
- (void)configureWebView;

// Create command groups and listeners used internally for log:// events.
- (void)configureLogMessageHandling;

// Create command groups and listeners used internally for mopub:// events.
- (void)configureMopubMessageHandler;

//
- (void)onUseCustomClose: (NSMutableDictionary*)params;

// Called when load call completes succesfully.
// Will not be called on unsuccesful ad loads.
- (void)onAdLoadComplete;

// Called when ad fails to load (error, etc).
- (void)onAdLoadFailed;

// Called when the user clicks through to the app store. NOT called
// on any other click (such as creative interaction, touch, etc).
- (void)onAdClicked:(NSDictionary *)params;

// Called when ad ads from its default state
// (such as a banner expanding into interstitial.
- (void)onAdExpand: (__unused NSDictionary *)params;

// Called on mopub://failLoad event.
- (void)onMoPubFailLoad: (__unused NSDictionary *)params;

// Called when http(s) ad request finishes loading URL.
- (void)onAdRequestComplete: (NSDictionary *)params;

// Called when http(s) ad request aborted or failed to finish loading URL.
- (void)onAdRequestFailed: (__unused NSDictionary *)params;

// Called when the
- (void)onAdCloseButtonActivated: (__unused NSDictionary *)params;

// Called when the preseneted FMDestinationController dismisses itself
- (void)onLinkClosed:(__unused NSDictionary *)params;

// Handles device rotation.
- (void)deviceOrientationDidChange:(__unused NSNotification *) notification;

- (void)fireRewardNotice;

- (void)clearWebview;
// 
- (void)startFullScreenAdWithViewController:(UIViewController *)viewController;

#pragma mark - Callbacks

@end

#endif /* FMAd_h */
