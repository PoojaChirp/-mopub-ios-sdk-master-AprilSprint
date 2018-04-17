//
//  FMAdController.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/14/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdController_h
#define FMAdController_h

#import <UIKit/UIKit.h>
#import "FMResources.h"
#import "FMAdDestinationURLController.h"

@class FMAd;

@interface FMAdController : UIViewController

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIButton *closeButton;
@property (weak, nonatomic) FMAd *parentAd;
@property (assign, nonatomic) BOOL allowRotation;

- (id)initWithWebView:(UIWebView*)webView forAd:(FMAd *)parentAd;
- (void)showCloseButton;
- (void)hideCloseButton;
- (void)setCloseButtonLocation: (UIButton *)closeButton withLocation:(NSString *)location;
- (void)onCloseButtonTouch:(id)sender;
- (void)onForceRotation:(NSDictionary *)params;
- (void)onConfigureAutoRotation: (NSDictionary *)params;
- (void)configureContentAnchors: (UIWebView *)webView;
@end

#endif /* FMAdController_h */
