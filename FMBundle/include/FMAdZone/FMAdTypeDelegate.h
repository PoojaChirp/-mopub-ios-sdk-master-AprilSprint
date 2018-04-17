//
//  FMAdTypeDelegate.h
//  FMAdZone
//
//  Created by Nicholas Jones on 1/10/18.
//  Copyright © 2018 Fractional Media. All rights reserved.
//

#ifndef FMAdTypeDelegate_h
#define FMAdTypeDelegate_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FMAd;

@protocol FMAdTypeDelegate <NSObject>
- (void)configureWebViewLayoutForAdContainer:(FMAd *)ad;
- (UIViewController *)adContainer:(FMAd *)ad viewControllerForOpenURL:(NSDictionary *)params;
- (void)adContainer:(FMAd *)ad closeButtonActivated:(NSDictionary *)params;
- (BOOL)shouldInterceptWebViewLoadRequest:(FMAd *)ad;
- (void)deviceOrientationDidChange:(FMAd *)ad;
@end

#endif /* FMAdTypeDelegate_h */
