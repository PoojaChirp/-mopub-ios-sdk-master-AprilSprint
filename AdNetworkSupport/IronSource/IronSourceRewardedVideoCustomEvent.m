//
//  MOPUBRVAdapterIronSource.m
//

#import "IronSourceRewardedVideoCustomEvent.h"
#import "MPLogging.h"
#import "IronSourceConstants.h"

@interface IronSourceRewardedVideoCustomEvent()

#pragma mark Mopub properties
@property (nonatomic, strong) MPRewardedVideoReward *reward;

#pragma mark Class local properties
@property (nonatomic, assign) NSString *placementName;
@property (nonatomic, strong) NSString *instanceId;
@property (nonatomic, assign) BOOL isTestEnabled;
@end

static BOOL initRewardedVideoSuccessfully;

@implementation IronSourceRewardedVideoCustomEvent

#pragma mark init dealloc Methods
- (instancetype)init {
    self = [super init];
    if (self) {
        MPLogInfo(@"IronSource RewardedVideo general init");
    }
    return self;
}

- (void)dealloc {
    MPLogInfo(@"IronSource RewardedVideo general dealloc");
}

#pragma mark Mopub IronSourceRVCustomEvent Methods

- (void)requestRewardedVideoWithCustomEventInfo:(NSDictionary *)info {
    [self onLog:@"requestRewardedVideoWithCustomEventInfo"];
    MPLogInfo(@"IronSource RewardedVideo is requested");

    NSString *applicationKey = @"";
    if ([info objectForKey:kIronSourceAppKey] != nil){
        applicationKey = [info objectForKey:kIronSourceAppKey];
    }
    
    if ([info objectForKey:kIronSourcePlacementName] != nil){
        _placementName = [info objectForKey:kIronSourcePlacementName];
    }
    
    _instanceId = @"0";
    if ([info objectForKey:kIronSourceInstanceId] != nil){
        _instanceId = [info objectForKey:kIronSourceInstanceId];
    }
    
    if ([info objectForKey:kIronSourceIsTestEnabled] != nil){
        _isTestEnabled = [[info objectForKey:kIronSourceIsTestEnabled] boolValue];
    }
    
    [self onLog:[NSString stringWithFormat:@"server params: %@", info.description]];

    if (![self isEmpty:applicationKey]) {
        [IronSource setISDemandOnlyRewardedVideoDelegate:self];

        [self initIronSourceSDKWithAppKey:applicationKey];
        
        if (initRewardedVideoSuccessfully && [IronSource hasISDemandOnlyRewardedVideo:_instanceId]) {
            
            id<MPRewardedVideoCustomEventDelegate> strongDelegate = self.delegate;
            [strongDelegate rewardedVideoDidLoadAdForCustomEvent:self];
        }
    } else {
        NSError *error = [self createErrorWith:@"IronSource Adapter failed to requestRewardedVideo"
                                     andReason:@"applicationKey parameter is missing"
                                 andSuggestion:@"make sure that 'applicationKey' server parameter is added"];
        
        
        id<MPRewardedVideoCustomEventDelegate> strongDelegate = self.delegate;
        [strongDelegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:error];
    }
}

- (BOOL)hasAdAvailable {
    return [IronSource hasISDemandOnlyRewardedVideo:_instanceId];
}

- (void)presentRewardedVideoFromViewController:(UIViewController *)viewController {
    [self onLog:@"presentRewardBasedVideoAdWithRootViewController"];
    
    if ([self isEmpty:_placementName]) {
        [IronSource showISDemandOnlyRewardedVideo:viewController instanceId:_instanceId];
    } else {
        [IronSource showISDemandOnlyRewardedVideo:viewController placement:_placementName instanceId:_instanceId];
    }
}

- (void)handleCustomEventInvalidated {
    // do nothing
}

- (void)handleAdPlayedForCustomEventNetwork {
    // do nothing
}

#pragma mark IronSource RV Methods

-(void)initIronSourceSDKWithAppKey:(NSString *)appKey {
    
    if (!initRewardedVideoSuccessfully) {
        [self onLog:@"initIronSourceSDKWithAppKey"];
        
        [IronSource setMediationType:kIronSourceMediationName];
        [IronSource initISDemandOnly:appKey adUnits:@[IS_REWARDED_VIDEO]];

        initRewardedVideoSuccessfully = YES;
    }
}

#pragma mark Utiles Methods

- (void)onLog:(NSString *)log {
    if (_isTestEnabled) {
        NSLog(@"IronSourceRewardedVideoCustomEvent: %@" , log);
    }
}

- (BOOL)isEmpty:(id)value {
    return value == nil
    || [value isKindOfClass:[NSNull class]]
    || ([value respondsToSelector:@selector(length)] && [(NSString *)value length] == 0)
    || ([value respondsToSelector:@selector(length)] && [(NSData *)value length] == 0)
    || ([value respondsToSelector:@selector(count)] && [(NSArray *)value count] == 0);
}

- (NSError *)createErrorWith:(NSString *)description andReason:(NSString *)reaason andSuggestion:(NSString *)suggestion {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(description, nil),
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(reaason, nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(suggestion, nil)
                               };
    
    return [NSError errorWithDomain:NSStringFromClass([self class]) code:0 userInfo:userInfo];
}

#pragma mark IronSource RV Events

/*!
 * @discussion Invoked when there is a change in the ad availability status.
 *
 *              hasAvailableAds - value will change to YES when rewarded videos are available.
 *              You can then show the video by calling showRV(). Value will change to NO when no videos are available.
 */
- (void)rewardedVideoHasChangedAvailability:(BOOL)available instanceId:(NSString *)instanceId {
    [self onLog: [NSString stringWithFormat:@"rewardedVideoHasChangedAvailability - %@, for instance: %@ " , available ? @"YES" : @"NO", instanceId]];
    
    if(![_instanceId isEqualToString:instanceId])
        return;
    
    id<MPRewardedVideoCustomEventDelegate> strongDelegate = self.delegate;
    if (available) {
        [strongDelegate rewardedVideoDidLoadAdForCustomEvent:self];
    } else {
        [strongDelegate rewardedVideoDidFailToLoadAdForCustomEvent:self error:nil];
    }
}

/*!
 * @discussion Invoked when the user completed the video and should be rewarded.
 *
 *              If using server-to-server callbacks you may ignore these events and wait for the callback from the IronSource server.
 *              placementInfo - IronSourcePlacementInfo - an object contains the placement's reward name and amount
 */
- (void)didReceiveRewardForPlacement:(ISPlacementInfo *)placementInfo instanceId:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"didReceiveRewardForPlacement for instance:%@",instanceId]];

    if (placementInfo) {
        NSString *rewardName = [placementInfo rewardName];
        NSNumber *rewardAmount = [placementInfo rewardAmount];
        _reward = [[MPRewardedVideoReward alloc] initWithCurrencyType:rewardName amount:rewardAmount];
        [self.delegate rewardedVideoShouldRewardUserForCustomEvent:self reward:_reward];
    } else {
        [self onLog:@"didReceiveRewardForPlacement - did not receive placement info"];
    }
}

/*!
 * @discussion Invoked when an Ad failed to display.
 *
 *          error - NSError which contains the reason for the failure.
 *          The error contains error.code and error.message.
 */
- (void)rewardedVideoDidFailToShowWithError:(NSError *)error instanceId:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"rewardedVideoDidFailToShowWithError for instance:%@",instanceId]];

    [self.delegate rewardedVideoDidFailToPlayForCustomEvent:self error:error];
}

/*!
 * @discussion Invoked when the RewardedVideo ad view has opened.
 *
 */
- (void)rewardedVideoDidOpen:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"rewardedVideoDidOpen for instance:%@",instanceId]];

    id<MPRewardedVideoCustomEventDelegate> strongDelegate = self.delegate;
    [strongDelegate rewardedVideoWillAppearForCustomEvent:self];
    [strongDelegate rewardedVideoDidAppearForCustomEvent:self];
}

/*!
 * @discussion Invoked when the user is about to return to the application after closing the RewardedVideo ad.
 *
 */
- (void)rewardedVideoDidClose:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"rewardedVideoDidClose for instance:%@",instanceId]];

    id<MPRewardedVideoCustomEventDelegate> strongDelegate = self.delegate;
    [strongDelegate rewardedVideoWillDisappearForCustomEvent:self];
    [strongDelegate rewardedVideoDidDisappearForCustomEvent:self];
    
    self.reward = nil;
}

/*!
 * @discussion Invoked when the video ad starts playing.
 */
- (void)rewardedVideoDidStart:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"rewardedVideoDidStart for instance:%@",instanceId]];

}

/*!
 * @discussion Invoked when the video ad finishes playing.
 */
- (void)rewardedVideoDidEnd:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"rewardedVideoDidEnd for instance:%@",instanceId]];

}

/*!
 * @discussion Invoked when a video has been clicked.
 */
- (void)didClickRewardedVideo:(ISPlacementInfo *)placementInfo instanceId:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"didClickRewardedVideo for instance:%@",instanceId]];
    [self.delegate rewardedVideoDidReceiveTapEventForCustomEvent:self ];

}

@end
