//
//  FMMRAIDMessageHandler.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/4/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMMRAIDMessageHandler_h
#define FMMRAIDMessageHandler_h

#import "FMMRAIDState.h"
#import "FMMRAIDBridge.h"
#import "FMLogger.h"
#import "FMMessageDispatcher.h"

@interface FMMRAIDMessageHandler : NSObject
@property (strong, nonatomic) FMMRAIDState *mraidState;
@property (weak, nonatomic) FMMessageDispatcher *dispatcher;

- (id)initWithMraidState: (FMMRAIDState *)mraidState dispatcher:(FMMessageDispatcher *)dispatcher;

// Callback placeholder
- (void)playVideo: (NSDictionary *)params;

// Callback placeholder.
- (void)createCalendarEvent: (NSDictionary *)params;

// Callback for custom close event.
// Parameters: shouldUseCustomClose (bool).
- (void)useCustomClose: (NSDictionary *)params;

- (void)sizeChange: (NSDictionary *)params;

// Callback for MRAID expand call.
// Parameters: none.
- (void)expand: (NSDictionary *)params;

//
- (void)collapse: (UIWebView*) webView;

// Callback for mraid.close
// Parameters: none.
- (void)close: (NSDictionary *)params;

- (void)setOrientationProperties: (NSDictionary *)params;

// Called on completion of each callback. The creative side will not
// process any additional callbacks until this has been called.
// Parameters: none.
- (void)nativeCallComplete:(NSString*)commandName withWebView:(UIWebView*)webView;
- (void)configureScreenRotation:(NSString *)allowOrientation;
- (void)forceOrientation: (NSString *)orientationRaw;

@end

#endif /* FMMRAIDMessageHandler_h */
