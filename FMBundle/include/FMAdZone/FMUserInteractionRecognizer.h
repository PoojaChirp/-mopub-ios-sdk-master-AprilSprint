//
//  FMUserInteractionRecognizer.h
//  FMAdZone
//
//  Created by Nicholas Jones on 1/11/18.
//  Copyright © 2018 Fractional Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMUserInteractionRecognizer : UIGestureRecognizer
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
@end
