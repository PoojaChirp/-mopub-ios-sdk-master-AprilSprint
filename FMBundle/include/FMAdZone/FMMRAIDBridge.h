//
//  FMMRAIDBridge.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/16/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMMRAIDBridge_h
#define FMMRAIDBridge_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMMRAIDState.h"

@interface FMMRAIDBridge : NSObject

+ (BOOL)isMRAIDCommand:(NSString *)scheme;
+ (BOOL)commandRequiresUserInteraction:(NSString *)command;
+ (void)stateChange: (UIWebView *)webView withStateName:(NSString *)state;
+ (void)stateChange: (UIWebView *)webView withState: (MRAID_STATE)state;
+ (void)propertyChange: (UIWebView *)webView properties:(NSArray *)properties;
+ (void)nativeCallComplete: (UIWebView *)webView withCommand:(NSString*)command;
+ (void)ready: (UIWebView *)webView;
+ (void)setScreenSize: (UIWebView *)webView withScreenSize: (CGSize)size;
+ (void)notifySizeChange: (UIWebView *)webView withWidth:(CGFloat)width withHeight: (CGFloat)height;
+ (void)bridgeFunction: (UIWebView *)webView withFormat:(NSString *)format, ...;
+ (void)setViewable: (UIWebView *)webView withIsViewable:(BOOL)isViewable;
+ (NSString*)getStateName: (MRAID_STATE)state;
@end

#endif /* FMMRAIDBridge_h */
