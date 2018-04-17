//
//  FMUtilities.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/4/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMUtilities_h
#define FMUtilities_h

#import <UIKit/UIKit.h>
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>
#import "FMCallback.h"
#import "FMAdType.h"
#import "FMLogger.h"

@interface FMUtilities : NSObject
+ (NSMutableDictionary*)getURIComponents: (NSString*)uri;
+ (NSArray*)uriToComponents: (NSString*)uri;
+ (NSMutableDictionary*)componentsToKeyValuePairs: (NSMutableDictionary*)dictionary withComponents:(NSArray*)components;
+ (NSString*)idfa;
+ (NSString*)language;
+ (NSString*)deviceModel;
+ (NSString*)userAgent;
+ (FMCallback*)callbackWithSelector:(SEL)selector target:(id)target;
+ (FMCallback*)callbackWithSelectorName:(NSString*)selectorName target:(id)target;
+ (NSDictionary*)sizeInfoForAdType:(FMAdType)adType;
+ (FMAdType)displayAdTypeFromSize:(CGSize)size;
+ (BOOL)isMainThread;
+ (void)logNonUIThreadError;

@end

#endif /* FMUtilities_h */
