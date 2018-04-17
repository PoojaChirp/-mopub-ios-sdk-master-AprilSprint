//
//  FMAdZoneViewDelegate.h
//  FMAdZone
//
//  Created by Nicholas Jones on 8/22/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdZoneViewDelegate_h
#define FMAdZoneViewDelegate_h

#import <Foundation/Foundation.h>
#import "FMError.h"

@class FMAdZoneView;

@protocol FMAdZoneViewDelegate <NSObject>

@optional
- (void)adZoneAdViewDidLoad:(FMAdZoneView *)adZoneView;
- (void)adZoneAdViewDidFail:(FMAdZoneView *)adZoneView withError:(FMError *)error;
- (void)adZoneAdViewDidShow:(FMAdZoneView *)adZoneView;
- (void)adZoneAdViewDidClose:(FMAdZoneView *)adZoneView;
- (void)adZoneAdViewDidReceiveClick:(FMAdZoneView *)adZoneView;
- (void)adZoneAdViewDidExpand:(FMAdZoneView *)adZoneView;
- (void)adZoneAdViewDidCollapse:(FMAdZoneView *)adZoneView;

@end


#endif /* FMAdZoneViewDelegate_h */
