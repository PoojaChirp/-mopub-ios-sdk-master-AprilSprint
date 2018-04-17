//
//  FMURLConnectionDelegate.h
//  AdZone-iOS-SDK
//
//  Created by Mike Brich on 6/16/17.
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#ifndef FMURLConnectionDelegate_h
#define FMURLConnectionDelegate_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMCallback.h"
#import "FMLogger.h"

@interface FMURLConnectionDelegate : UIViewController<NSURLConnectionDelegate>
@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) FMCallback *onLoadComplete;
@property (strong, nonatomic) FMCallback *onLoadFailure;

- (id)initWithSuccessCallback:(FMCallback *)requestCompleteCallback onLoadFailure:(FMCallback *)onLoadFailure;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(__unused NSURLConnection *)connection;
- (void)connection:(__unused NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response;
- (void)connection:(__unused NSURLConnection *)connection didReceiveData:(nonnull NSData *)data;
- (void)connection:(__unused NSURLConnection *)connection willCacheResponse:(nonnull NSCachedURLResponse *)cachedResponse;
- (void)connection:(__unused NSURLConnection *)connection willSendRequest:(nonnull NSURLRequest *)request redirectResponse:(nullable NSURLResponse *)response;
@end

#endif /* FMURLConnection_h */
