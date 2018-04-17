//
//  FMAdResponseProcessor.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 6/16/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMAdResponseProcessor_h
#define FMAdResponseProcessor_h

#import <Foundation/Foundation.h>
#import "FMResources.h"

@interface FMAdResponseProcessor : NSObject
+ (NSString *)process:(NSString *)html;
+ (BOOL)shouldInject:(NSString *)fileName;
+ (NSString *)inject: (NSString *)html withMatch: (NSTextCheckingResult *)match;
+ (NSArray *)getScriptTags: (NSString *)html;
@end


#endif /* FMAdResponseProcessor_h */
