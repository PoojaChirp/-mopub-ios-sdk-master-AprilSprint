//
//  FMMessageDispatcher.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/4/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMMessageDispatcher_h
#define FMMessageDispatcher_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMUtilities.h"
#import "FMLogger.h"

@class FMAdView;
@interface FMMessageDispatcher : NSObject

//
@property (strong, nonatomic) NSMutableDictionary* callbacks;

// WebView used as the webView parameter for each callback.
@property (strong, nonatomic) UIWebView* webView;

@property (strong, nonatomic) NSMutableDictionary *extraParameters;
//
- (id)init;

//
- (id)initWithWebView: (UIWebView*)webView;

//
- (id)initWithWebView: (UIWebView *)webView extraParameters: (NSMutableDictionary *)extraParameters;

// Register a callback for a specific event.
- (BOOL)registerCallback:(FMCallback *)callback eventName:(NSString*)eventName groupName: (NSString *)groupName;

// Get all registered callbacks for an event, by name.
- (NSMutableArray*)eventWithName:(NSString *)eventName groupName:(NSString *)groupName;

// Get an event group by name. Nil if group does not exist.
- (NSMutableDictionary *)groupWithName:(NSString *)groupName;

// Create an event which events can be registered to.
- (NSMutableArray*)createEventWithName:(NSString *)eventName groupName:(NSString *)groupName;

- (BOOL)createEventWithName:(NSString *)eventName groupName: (NSString *)groupName callback:(FMCallback *)callback;

// Send event data for a specified eventName, with the rawMessage.
- (BOOL)send: (NSString *)eventName groupName: (NSString *)groupName rawMessage:(NSString *)rawMessage;

// Create event group by name.
- (NSMutableDictionary*)createGroupWithName:(NSString *)groupName;

// Fire an event by name, calling all registered callbacks and passing
// provided params to each.
- (void)fireEventWithName:(NSString *)eventName groupName: (NSString *)groupName parameters:(NSMutableDictionary *)params;

// Fire an event by name, calling all registered callbacks. Nil params
// passed to all callbacks.
- (void)fireEventWithName: (NSString *)eventName groupName: (NSString*)groupName;


@end

#endif /* FMMessageDispatcher_h */
