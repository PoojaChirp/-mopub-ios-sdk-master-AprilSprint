//
//  FMAdZoneView.h
//  FMAdZone
//
//  Created by Nicholas Jones on 8/22/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdZoneView_h
#define FMAdZoneView_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMAdZoneViewDelegate.h"
#import "FMAdType.h"


@interface FMAdZoneView : UIView


@property (copy, nonatomic) IBInspectable NSString * adTypeIBAdapter;
@property (nonatomic) FMAdType adType;


- (instancetype)initWithFrame:(CGRect)frame adType:(FMAdType)adType;
- (void)load:(NSString *)adUnit delegate:(id<FMAdZoneViewDelegate>)delegate;
- (void)show:(UIViewController *)viewController;
- (void)clear;

@end


#endif /* FMAdZoneView_h */
