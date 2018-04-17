//
//  FMUI.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 5/15/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMUI_h
#define FMUI_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FMUI : NSObject
+ (void)timedAlert: (UIViewController*)currentController withTitle: (NSString*)title withMessage: (NSString*)message withDelay: (CGFloat)delay;
@end

#endif /* FMUI_h */
