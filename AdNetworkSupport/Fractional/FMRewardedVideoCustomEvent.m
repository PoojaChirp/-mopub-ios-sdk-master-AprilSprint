//
//  FMRewardedVideoCustomEvent.m
//  FMAdZoneMoPubAdapter
//
//  Copyright © 2017 Fractional Media. All rights reserved.
//

#import "FMRewardedVideoCustomEvent.h"


@implementation FMRewardedVideoCustomEvent

- (void)requestRewardedVideoWithCustomEventInfo: (NSDictionary *)info {
    MPLogInfo(@"Starting FM ad request for MoPub rewarded video.");
    
    if (!self.delegate) {
        return;
    }

    NSString *adZoneID = [info objectForKey:@"adZoneID"];
    
    // Check for adZoneID and fail out if it's missing.
    if (!adZoneID || ![adZoneID isKindOfClass:[NSString class]]) {
        MPLogError(@"[FMERR_28206] FM RewardedVideo adapter: Invalid adZoneID set in the MoPub UI.");
        [self.delegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:nil];
        return;
    }
    
    if (![[FMAdZone sharedAdZone] respondsToSelector:NSSelectorFromString(@"rewardedWithAdUnitID:delegate:")]) {
        MPLogError(@"[FMERR_28207] FM RewardedVideo adapter: could not create ad request because the AdZone API did not support the request.");
        [self.delegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:nil];
        return;
    }
                   
    // AdZone request - adZoneID provided by the user.
    self.adRequest = [[FMAdZone sharedAdZone] rewardedWithAdUnitID:adZoneID delegate:self];
    
    if (!self.adRequest) {
        MPLogError(@"[FMERR_28208] FM RewardedVideo adapter: could not create ad request.");
        [self.delegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:nil];
    }
}

- (BOOL)hasAdAvailable {
    
    MPLogInfo(@"FM RewardedVideo adapter hasAdAvailable called");
    
    if (!self.adRequest) {
        return NO;
    }
    
    if (![self.adRequest respondsToSelector:NSSelectorFromString(@"state")]) {
        MPLogError(@"[FMERR_28208] FM RewardedVideo adapter: could not get ad availability because the ad request API did not support the request.");
        return NO;
    }
    
    return [self.adRequest state] == FMAdRequestStateReadyToShow;
}


- (void)presentRewardedVideoFromViewController:(UIViewController *)viewController {
    
    MPLogInfo(@"FM RewardedVideo adapter starting present from view controller.");
    
    if (![self hasAdAvailable]) {
        MPLogError(@"[FMERR_28201] FM RewardedVideo adapter: could not show ad because no ads were available.");
    }
    
    if (!self.delegate) {
        return;
    }
    
    if (![self.adRequest respondsToSelector:NSSelectorFromString(@"show:")]) {
        MPLogError(@"[FMERR_28203] FM RewardedVideo adapter: could not show because there was a problem with the ad request.");
        return;
    }
    
    [self.delegate rewardedVideoWillAppearForCustomEvent:self];
    [self.adRequest show:viewController];
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
    
    MPLogInfo(@"FM RewardedVideo adapter called closed delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate rewardedVideoWillDisappearForCustomEvent:self];
    [self.delegate rewardedVideoDidDisappearForCustomEvent:self];
}


- (void)adZoneAdDidReceiveClick:(FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM RewardedVideo adapter called clicked delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate rewardedVideoDidReceiveTapEventForCustomEvent:self];
}


- (void)adZoneAdDidShow: (FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM RewardedVideo adapter called shown delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate rewardedVideoDidAppearForCustomEvent:self];
}


- (void)adZoneAdDidLoad:(FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM RewardedVideo adapter called loaded delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate rewardedVideoDidLoadAdForCustomEvent:self];
}

- (void)adZoneAdDidFail:(FMAdRequest *)adRequest withError:(FMError *)error {
    
    MPLogInfo(@"FM RewardedVideo adapter called failed delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:nil];
}

#pragma mark - FMRewardedVideoAdDelegate

- (void)adZoneAdShouldRewardUser:(FMAdRequest *)adRequest {
    
    MPLogInfo(@"FM RewardedVideo adapter called shouldRewardUser delegate.");
    
    if (!self.delegate) {
        return;
    }
    
    MPRewardedVideoReward *reward = [[MPRewardedVideoReward alloc] initWithCurrencyType:kMPRewardedVideoRewardCurrencyTypeUnspecified amount:@(kMPRewardedVideoRewardCurrencyAmountUnspecified)];
    [self.delegate rewardedVideoShouldRewardUserForCustomEvent:self reward:reward];
}

@end
