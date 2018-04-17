//
//  FMDisplayAd.h
//  FMAdZone
//
//  Created by Nicholas Jones on 1/10/18.
//  Copyright © 2018 Fractional Media. All rights reserved.
//

#ifndef FMDisplayAd_h
#define FMDisplayAd_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMAdTypeDelegate.h"

@class FMAd;

@interface FMDisplayAd : NSObject<FMAdTypeDelegate>
- (void)configureWebViewLayoutForAdContainer:(FMAd *)ad;
- (UIViewController *)adContainer:(FMAd *)ad viewControllerForOpenURL:(NSDictionary *)params;
- (void)adContainer:(FMAd *)ad closeButtonActivated:(NSDictionary *)params;
- (BOOL)shouldInterceptWebViewLoadRequest:(FMAd *)ad;
- (void)deviceOrientationDidChange:(FMAd *)ad;
@end

#endif /* FMDisplayAd_h */
