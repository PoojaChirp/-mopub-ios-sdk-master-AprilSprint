//
//  FMInterstitialCustomEvent.m
//  AdZone-iOS-SDK
//
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#import "FMInterstitialCustomEvent.h"

@implementation FMInterstitialCustomEvent

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info {
    MPLogInfo(@"FM interstitial adapter starting ad request.");
    
    if (!self.delegate) {
        MPLogError(@"FM interstitial adapter: could not find delegate during creation of new interstitial custom event.");
        return;
    }
    
    NSString *adZoneID = [info objectForKey:@"adZoneID"];
    
    // Check for adZoneID and fail out if it's missing.
    if (!adZoneID || ![adZoneID isKindOfClass:[NSString class]]) {
        MPLogError(@"[FMERR_28101] FM interstitial adapter: Invalid adZoneID set in the MoPub UI.");
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
        return;
    }
    
    if (![[FMAdZone sharedAdZone] respondsToSelector:NSSelectorFromString(@"interstitialWithAdUnitID:delegate:")]) {
        MPLogError(@"[FMERR_28102] FM Interstitial adapter: could not create a new ad request because the AdZone API did not support the interstitial request.");
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
        return;
    }
    
    // AdZone request - adZoneID provided by the user.
    self.adRequest = [[FMAdZone sharedAdZone] interstitialWithAdUnitID:adZoneID delegate:self];
    
    if (!self.adRequest) {
        MPLogError(@"[FMERR_28103] FM Interstitial adapter: could not create ad request.");
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
    }
}


- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController {
    
    MPLogInfo(@"FM interstitial adapter calling show.");
    
    if (!self.adRequest) {
        MPLogError(@"[FMERR_28103] FM interstitial adapter: could not find ad request while showing.");
        return;
    }
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate interstitialCustomEventWillAppear:self];
    
    if (![self.adRequest respondsToSelector:NSSelectorFromString(@"show:")]) {
        MPLogError(@"[FMERR_28105] FM interstitial adapter: could not be shown because the ad request is missing a selector.");
        return;
    }
    
    [self.adRequest show:rootViewController];

}

#pragma mark - FMAdZoneDelegate

- (void)adZoneStartSuccess:(FMAdZone *)adZone {
    MPLogInfo(@"AdZone DidStart");
}

- (void)adZoneStartFailed:(FMAdZone *)adZone {
    MPLogInfo(@"AdZone DidFailStart");
}

#pragma mark - FMAdDelegate

- (void)adZoneAdDidClose: (FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM interstitial adapter called closed delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate interstitialCustomEventWillDisappear:self];
    [self.delegate interstitialCustomEventDidDisappear:self];
}


- (void)adZoneAdDidLoad: (FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM interstitial adapter called loaded delegate.");
    
    if (!self.delegate) {
        return;
    }
    

    [self.delegate interstitialCustomEvent:self didLoadAd:self.adRequest];
}


- (void)adZoneAdDidReceiveClick: (FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM interstitial adapter called clicked delegate.");
    
    if (!self.delegate) {
        return;
    }

    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}


- (void)adZoneAdDidShow: (FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM interstitial adapter called shown delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate interstitialCustomEventDidAppear:self];
}


- (void)adZoneAdDidFail: (FMAdRequest *)adRequest withError:(FMError *)error {
    
    MPLogInfo(@"FM interstitial adapter called failed delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
}

@end




