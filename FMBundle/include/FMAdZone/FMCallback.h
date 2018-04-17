//
//  FMCallback.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 7/7/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMCallback_h
#define FMCallback_h

#import <Foundation/Foundation.h>

@interface FMCallback : NSObject
- (id)initWithSelector: (SEL)selector target:(id)target;
// Convenience function to call invoke with a nil params.
- (void)invoke;
// Invoke the callback, passing in specified params. Always safe
// to call. Will not execute if instance/selector pair is invalid.
- (void)invoke:(NSDictionary *)params;
// Whether the callback can be invoked.
+ (BOOL)callable: (SEL)selector target:(id)target;

@end

#endif /* FMCallback_h */
