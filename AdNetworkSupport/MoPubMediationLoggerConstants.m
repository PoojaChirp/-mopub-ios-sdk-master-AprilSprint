//
// Created by Pooja Shashidhar on 4/17/18.
// Copyright (c) 2018 MoPub. All rights reserved.
//

#import "MoPubMediationLoggerConstants.h"


@implementation MoPubMediationLoggerConstants
/*
    -(NSString *) EventTypeEnumToString:(Event)enumVal
    {
        NSArray *EventTypeArray = [[NSArray alloc] initWithObjects:kEventArray];
        return [EventTypeArray objectAtIndex:enumVal];
    }
    
    // A method to retrieve the int value from the NSArray of NSStrings
    -(Event) EventTypeStringToEnum:(NSString*)strVal
    {
        NSArray *EventTypeArray = [[NSArray alloc] initWithObjects:kEventArray];
        NSUInteger n = [EventTypeArray indexOfObject:strVal];
        if(n < 1)
            n = AD_REQUESTED;
        return (Event)n;
    }

*/
/*
 typedef enum {
 AD_REQUESTED,
 AD_ERROR,
 AD_UNAVAILABLE,
 AD_WILLSHOW,
 AD_SHOWN,
 AD_LOADED,
 AD_IMPRESSED,
 AD_CLICKED,
 AD_DISMISSED,
 AD_WILLDISMISS,
 AD_EXPIRED,
 AD_COMPLETED
 } Event;
 
 
 #define kEventArray @"Requested.", @"Error. Check logs for the error's details.", @"Not loaded/cached. Try again.", @" Will show the ad.", @"Now playing/showing.", @"Cached/Loaded.", @"Logged an impression.",@"Clicked.",@"Dismissed.", @"Will dissis the ad.",@"Expired",@"Completed playing.", nil

 */
//NSDictionary *dict = [[NSDictionary alloc] init];


static NSDictionary *eventDictionary = nil;
+(void)initialize{
    if (!eventDictionary)
        
        eventDictionary = @{
                                  @"AD_REQUESTED" : @"Requested.",
                                  @"AD_ERROR" : @"Error. Check logs for the error's details.",
                                  @"AD_UNAVAILABLE" : @"Not loaded/cached. Try again.",
                                  @"AD_WILLSHOW" : @" Will show the ad.",
                                  @"AD_SHOWN": @"Now playing/showing.",
                                  @"AD_LOADED": @"Cached/Loaded.",
                                  @"AD_IMPRESSED":@"Logged an impression.",
                                  @"AD_CLICKED":@"Clicked.",
                                  @"AD_DISMISSED":@"Dismissed.",
                                  @"AD_WILLDISMISS":@"Will dissis the ad.",
                                  @"AAD_EXPIRED":@"Expired",
                                  @"AD_COMPLETED":@"Completed playing."

                                  };
        }

@end
