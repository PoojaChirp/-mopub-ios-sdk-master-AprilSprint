//
//  FMAdDestinationURLController.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 7/18/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdDestinationURLController_h
#define FMAdDestinationURLController_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FMMessageDispatcher;



@interface FMAdDestinationURLController : UIViewController<UIWebViewDelegate>
@property (assign, nonatomic) BOOL hasLoadedURL;
@property (assign, nonatomic) double loaderTimeout;
@property (assign, nonatomic) BOOL hasLeftApp;
@property (strong, nonatomic) UIActivityIndicatorView *loader;
// Self owned WebView for displaying Ads. No external parties
// should ever reference this.
@property (strong, nonatomic) UIWebView *webView;
// Flag used to determine when to close the ad. Deep links will
// open the app store, but leave a blank white window. When the
// user returns to this screen, we detect that a deep link was
// already opened (thus the user was in a different app), and
// close the current view. This brings the user immediately back
// to the ad.
@property (assign, nonatomic) BOOL openedDeepLink;
@property (strong, nonatomic) UIToolbar *toolbar;
- (void)resizeViewWithBounds: (CGRect)bounds;
- (void)updateToolbarIcons;
@property (assign, nonatomic) CGFloat toolbarHeight;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)startLoaderTimeout;
- (void)deviceOrientationDidChange:(__unused NSNotification *) notification;
- (void)applicationDidBecomeActive:(__unused NSNotification *) notification;
- (void)configureContentAnchors: (UIWebView *)webView;
// Toolbar Buttons
- (void)onToolbarDoneButtonActivate;
- (void)onToolbarBackButtonActivate;
- (void)onToolbarForwardButtonActivate;

- (id)initWithURL: (NSString *)inputURL dispatcher:(FMMessageDispatcher *)dispatcher;
// Close the opened URL.
- (void)close;
@end

#endif /* FMAdDestinationURLController_h */
