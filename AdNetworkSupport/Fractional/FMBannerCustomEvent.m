//
//  FMBannerCustomEvent.m
//  FMAdZoneMoPubAdapter
//
//  Copyright © 2018 Fractional Media. All rights reserved.
//

#import "FMBannerCustomEvent.h"

@interface MPInstanceProvider (FMAdZoneBanners)

- (FMAdZoneView *)buildFMAdZoneViewWithAdZone:(NSString *)adZone adType:(FMAdType)adType delegate:(id<FMAdZoneViewDelegate>)delegate;

@end

@implementation MPInstanceProvider (FMAdZoneBanners)

- (FMAdZoneView *)buildFMAdZoneViewWithAdZone:(NSString *)adZone adType:(FMAdType)adType delegate:(id<FMAdZoneViewDelegate>)delegate
{
    switch (adType) {
        case FMAdTypeBanner:
            return [[FMAdZone sharedAdZone] bannerWithAdUnitID:adZone delegate:delegate];
        case FMAdTypeMRECT:
            return [[FMAdZone sharedAdZone] mrectWithAdUnitID:adZone delegate:delegate];
        case FMAdTypeSkyscraper:
            return [[FMAdZone sharedAdZone] skyscraperWithAdUnitID:adZone delegate:delegate];
        case FMAdTypeLeaderboard:
            return [[FMAdZone sharedAdZone] leaderboardWithAdUnitID:adZone delegate:delegate];
        default:
            return nil;
    }
}

@end

@implementation FMBannerCustomEvent

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info {
    MPLogInfo(@"FM banner adapter starting ad request with size: %@", NSStringFromCGSize(size));
    
    if (!self.delegate) {
        MPLogError(@"FM banner adapter: could not find delegate during creation of new banner custom event.");
        return;
    }
    
    NSString *adZoneID = [info objectForKey:@"adZoneID"];
    
    // Check for adZoneID and fail out if it's missing.
    if (!adZoneID || ![adZoneID isKindOfClass:[NSString class]]) {
        MPLogError(@"[FMERR_28101] FM banner adapter: Invalid adZoneID set in the MoPub UI.");
        [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:nil];
        return;
    }
    
    FMAdType adType = [FMUtilities displayAdTypeFromSize:size];
    
    self.adZoneView = [[MPInstanceProvider sharedProvider] buildFMAdZoneViewWithAdZone:adZoneID adType:adType delegate:self];
    
    if (!self.adZoneView) {
        MPLogError(@"FM banner adapter: could not construct FMAdZoneView for size: %@", NSStringFromCGSize(size));
        [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:nil];
        return;
    }
}

#pragma mark - FMAdZoneDelegate

- (void)adZoneStartSuccess:(FMAdZone *)adZone {
    MPLogInfo(@"AdZone DidStart");
}

- (void)adZoneStartFailed:(FMAdZone *)adZone {
    MPLogInfo(@"AdZone DidFailStart");
}

#pragma mark - FMAdZoneViewDelegate

- (void)adZoneAdViewDidLoad:(FMAdZoneView *)adZoneView {
    MPLogInfo(@"FM banner DidLoad called");
    
    if (!self.delegate) {
        return;
    }
    
    UIViewController *viewController = [self.delegate viewControllerForPresentingModalView];
    
    if (!viewController) {
        MPLogError(@"FM banner adapter: MPBannerCustomEventDelegate failed to return presenting modal viewController: %@");
        [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:nil];
    }
    
    [self.adZoneView show:viewController];
    
    [self.delegate bannerCustomEvent:self didLoadAd:self.adZoneView];
}
- (void)adZoneAdViewDidFail:(FMAdZoneView *)adZoneView withError:(FMError *)error {
    MPLogInfo(@"FM banner DidFail called");
    
    if (!self.delegate) {
        return;
    }
    
    [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:nil];
}
- (void)adZoneAdViewDidShow:(FMAdZoneView *)adZoneView {
    MPLogInfo(@"FM banner DidShow called");
}
- (void)adZoneAdViewDidClose:(FMAdZoneView *)adZoneView {
    MPLogInfo(@"FM banner DidClose called");
}
- (void)adZoneAdViewDidReceiveClick:(FMAdZoneView *)adZoneView {
    MPLogInfo(@"FM banner DidReceiveClick called");
    
    if (!self.delegate) {
        return;
    }
    
    // Per MoPub SDK Docs: When automatic click and impression tracking is enabled (the default) bannerCustomEventWillBeginAction will track a click (the click is guaranteed to only be tracked once per ad)
    // A bannerCustomEventWillBeginAction should always be accompanied with a corresponding bannerCustomEventDidFinishAction.
    [self.delegate bannerCustomEventWillBeginAction:self];
    [self.delegate bannerCustomEventDidFinishAction:self];
}
- (void)adZoneAdViewDidExpand:(FMAdZoneView *)adZoneView {
    MPLogInfo(@"FM banner DidExpand called");
}
- (void)adZoneAdViewDidCollapse:(FMAdZoneView *)adZoneView {
    MPLogInfo(@"FM banner DidCollapse called");
}

@end
