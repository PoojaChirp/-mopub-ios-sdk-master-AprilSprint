//
//  FMAdZoneDelegate.h
//  FMAdZone
//
//  Created by Nicholas Jones on 8/17/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdZoneDelegate_h
#define FMAdZoneDelegate_h

@class FMAdZone;

@protocol FMAdZoneDelegate <NSObject>

@optional
-(void)adZoneStartSuccess:(FMAdZone *)adZone;
-(void)adZoneStartFailed:(FMAdZone *)adZone;

@end


#endif /* FMAdZoneDelegate_h */
