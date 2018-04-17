//
//  FMAdUnitIDValidator.h
//  FMAdZone
//
//  Created by Nicholas Jones on 9/15/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdUnitIDValidator_h
#define FMAdUnitIDValidator_h

@interface FMAdUnitIDValidator : NSObject

+ (NSString*)validAdUnitID:(NSString *)adUnitID;
+ (BOOL)isValidAdUnitID:(NSString *)adUnitID;
+ (NSString*)trimWhitespaceFromEndsOfString:(NSString *)target;

@end

#endif /* FMAdUnitIDValidator_h */
