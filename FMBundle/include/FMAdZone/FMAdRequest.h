//
//  FMAdRequest.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/11/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdRequest_h
#define FMAdRequest_h

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import "FMAd.h"
#import "FMAdController.h"
#import "FMURLConnectionDelegate.h"

@interface FMAdRequest : NSObject<UIWebViewDelegate>

@property (strong, nonatomic) NSURLRequest *urlRequest;
@property (strong, nonatomic) FMAdController *adController;

@property (strong, nonatomic, readonly) NSString *adzoneID;

- (id)initWithWebView: (id)webView adType:(FMAdType)adType urlRequest:(NSURLRequest *)urlRequest adzoneId:(NSString *)adzoneId delegate: (id)delegate;

// Ask the ad request to abort any current network or
// ad requests. Causes a failLoad event immediately.
- (void)requestStop;

// Initiate the ad request (network request).
- (void)load;

// Show an already loaded request. Provided current
// view controller should be the topmost controller,
// as it pushes an Ad Controller on top of this.
- (void)show: (UIViewController *)viewController;

// Get the ad's type.
- (FMAdType)getAdType;

// Get whether the ad is full-screen.
- (BOOL)getIsFullScreen;

- (UIWebView *)getWebView;

- (FMAdRequestState)state;
@end

#endif /* FMAdRequest_h */
