//
//  FMMRAIDState.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/8/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMMRAIDState_h
#define FMMRAIDState_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    MRAID_STATE_DEFAULT,
    MRAID_STATE_RESIZED,
    MRAID_STATE_LOADING,
    MRAID_STATE_EXPANDED,
    MRAID_STATE_HIDDEN
    
} MRAID_STATE;


@interface FMMRAIDState : NSObject
@property (assign, nonatomic) MRAID_STATE currentState;
@property (assign, nonatomic) MRAID_STATE lastState;
@property (assign, nonatomic) CGFloat preExpandWidth;
@property (assign, nonatomic) CGFloat preExpandHeight;
@property (assign, nonatomic) CGRect preExpandFrame;
@property (assign, nonatomic) BOOL useCustomClose;
@property (assign, nonatomic) BOOL isExpandable;
@property (assign, nonatomic) BOOL allowOrientationChange;
@property (strong, nonatomic) NSString *forceOrientation;

- (void)transitionState: (MRAID_STATE) newState;
@end

#endif /* FMMRAIDState_h */
