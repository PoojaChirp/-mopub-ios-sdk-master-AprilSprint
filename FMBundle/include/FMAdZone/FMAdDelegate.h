//
//  FMAdDelegate.h
//  FMAdZone
//
//  Created by Mike Brich on 8/16/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdDelegate_h
#define FMAdDelegate_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMError.h"

@class FMAdRequest;

@protocol FMAdDelegate <NSObject>

@optional
- (void)adZoneAdDidLoad:(FMAdRequest *)adRequest;
- (void)adZoneAdDidFail:(FMAdRequest *)adRequest withError:(FMError *)error;
- (void)adZoneAdDidShow:(FMAdRequest *)adRequest;
- (void)adZoneAdDidClose:(FMAdRequest *)adRequest;
- (void)adZoneAdDidReceiveClick:(FMAdRequest *)adRequest;

@end

#endif /* FMAdDelegate_h */
